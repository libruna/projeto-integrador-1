import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rinf/rinf.dart';

import 'package:monitor/pressureGauge.dart';
import 'package:monitor/messages/request_serial_ports.pb.dart'
    as serialPortsRequestResource;

Future<List<String>> fetchSerialPorts() async {
  final requestPayload = serialPortsRequestResource.ReadRequest();
  final request = RustRequest(
    resource: serialPortsRequestResource.ID,
    operation: RustOperation.Read,
    message: requestPayload.writeToBuffer(),
  );
  final response = await requestToRust(request);
  final responseMessage = serialPortsRequestResource.ReadResponse.fromBuffer(
    response.message!,
  );
  return responseMessage.portNames;
}

void main() async {
  await Rinf.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appLifecycleListener = AppLifecycleListener(
    onExitRequested: () async {
      // Terminate Rust tasks before closing the Flutter app.
      //await Rinf.ensureFinalized();
      return AppExitResponse.exit;
    },
  );

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitor da Base v1',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Home'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> serialPortNames = [''];
  String? selectedPort = '';
  bool serialConnected = false;

  @override
  void initState() {
    super.initState();
    fetchSerialPorts().then((portNames) {
      setState(() {
        serialPortNames = portNames;
        selectedPort = portNames.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Serial port: ',
                    style: Theme.of(context).textTheme.headlineSmall),
                DropdownMenu<String>(
                  width: 200,
                  initialSelection: serialPortNames.first,
                  dropdownMenuEntries: serialPortNames
                      .map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                  onSelected: (String? newValue) {
                    setState(() {
                      selectedPort = newValue!;
                    });
                  },
                  menuStyle: MenuStyle(),
                ),
                FilledButton(
                    onPressed: selectedPort == ''
                        ? null
                        : serialConnected
                            ? null
                            : () {
                                setState(() {
                                  serialConnected = true;
                                  final requestPayload =
                                      serialPortsRequestResource.CreateRequest(
                                    portname: selectedPort,
                                  );
                                  final request = RustRequest(
                                    resource: serialPortsRequestResource.ID,
                                    operation: RustOperation.Create,
                                    message: requestPayload.writeToBuffer(),
                                  );
                                  requestToRust(request);
                                });
                              },
                    child: const Text('Connect'))
              ],
            ),
            serialConnected
                ? const PressureGauge()
                : const Text('not connected'),
          ],
        ),
      ),
    );
  }
}
