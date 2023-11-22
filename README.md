 # App

 Este app tem como objetivo permitir a operação do foguete durante o lançamento e o processamento dos dados após cada lançamento.

 ## Modificações

 Esta branch pode ser considerada a 'main' no que diz respeito ao app. 

Dito isso, modificações futuras devem ser feitas em branches separadas e posteriormente mergeadas ao código aqui contido.

 ## Estrutura de diretório
    -- monitor
        |-- android
        |   
        |-- build
        |   
        |-- ios
        |
        |-- lib (CÓDIGO DO FRONT-END)
        |   `-- messages   (Gerado automaticamente, ignorar)
        |-- linux
        |
        |-- macos
        |
        |-- messages
        |
        |-- native (CÓDIGO DO BACK-END)
        |   `-- hub
        |       `-- src
        |           |-- bridge   (Gerado automaticamente, ignorar)
        |           `-- messages   (Gerado automaticamente, ignorar)
        |   
        |-- target
        |-- test
        |-- web
        `-- windows
