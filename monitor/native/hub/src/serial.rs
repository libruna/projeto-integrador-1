use crate::bridge::send_rust_signal;
use crate::bridge::{RustRequest, RustResponse, RustOperation, RustSignal};
use prost::Message;
use tokio_with_wasm::tokio;
use serialport;


pub async fn handle_serial_port_names_request(request: RustRequest) -> RustResponse {
    use crate::messages::request_serial_ports::{ReadResponse, CreateRequest};

    match request.operation {
        RustOperation::Read => {
            match serialport::available_ports() {
                Ok(ports) => {
                    let port_names = ports.into_iter()
                    .map(|port| port.port_name)
                    .collect();
                    RustResponse { 
                        successful: true, 
                        message: Some(ReadResponse{port_names: port_names}.encode_to_vec()), 
                        blob: None 
                    }
                },
                Err(_) => RustResponse { 
                    successful: false, 
                    message: None, 
                    blob: None 
                }
            }
        },
        RustOperation::Create => {
            let message_bytes = request.message.unwrap();
            let message = CreateRequest::decode(message_bytes.as_slice()).unwrap();
            let portname = message.portname;
            tokio::spawn(stream_pressure_serial(portname));
            RustResponse { 
                successful: true, 
                message: None, 
                blob: None 
            }
        },
        _ => RustResponse::default(),
    }
}

pub async fn stream_pressure_serial(portname: String) {
    use crate::messages::pressure_stream::{StateSignal, ID};

    let mut port = serialport::new(portname, 9_600)
    .timeout(std::time::Duration::from_millis(10))
    .open().expect("Failed to open port");

    loop{
        //tokio::time::sleep(std::time::Duration::from_millis(100)).await;

        let mut buffer = [0; 3];
        match port.read(&mut buffer){
            Ok(_) => {
                crate::debug_print!("Buffer: {buffer:?}");
                if buffer[0] != 0xCC {
                    continue;
                }
                let value: u64 = ((buffer[1] as u64) << 8) + (buffer[2] as u64);
                crate::debug_print!("Read: {value:?}");
                let voltage: f64 = (value as f64)*(5.0/1024.0);
                let pressure: f64 = (voltage - 0.4443359375)*250.0*0.145038;
                
                let signal_message = StateSignal { pressure };
                let rust_signal = RustSignal {
                    resource: ID,
                    message: Some(signal_message.encode_to_vec()),
                    blob: None,
                };
                send_rust_signal(rust_signal);
                
            }
            Err(_) => continue
        };
        
    }
}