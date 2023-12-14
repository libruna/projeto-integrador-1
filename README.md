# App

 Este app tem como objetivo permitir a operação do foguete durante o lançamento e o processamento dos dados após cada lançamento.

## Modificações

 Esta branch pode ser considerada a 'main' no que diz respeito ao app. 

Dito isso, modificações futuras devem ser feitas em branches separadas e posteriormente mergeadas ao código aqui contido.

## Instalação e Configuração

<details><summary><b>🗿 Para Linux </b></summary>

> ⚠️ **Essas instruções são válidas para Ubuntu e semelhantes, caso use outra distribuição, será necessário adaptar alguns comandos**.

1. Primeiramente, instale as ferramentas essenciais:

```shell
sudo apt install build-essential curl
```

2. [Instale o runtime do Rust](https://www.rust-lang.org/tools/install)

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

3. [Instale o Flutter SDK](https://docs.flutter.dev/get-started/install/linux#method-2-manual-installation)

```shell
mkdir fluttter_sdk && cd flutter_sdk

curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.0-stable.tar.xz

tar xf flutter_linux_3.16.0-stable.tar.xz

echo "export PATH=\"\$PATH:$(pwd)/flutter/bin\"
" >> ~/.$(echo $0)rc

source ~/.$(echo $0)rc
```

4. Instale o ProtoBuf

```shell
sudo apt install -y protobuf-compiler
```

5. Verifique as instalações

```shell
rustc --version
protoc --version # Verifique que a versão é maior que 3
flutter doctor
```

</details>


<details><summary><b>🤡 Para Windows </b></summary>

1. Instale as [ferramentas de build para Windows](https://aka.ms/vs/17/release/vs_BuildTools.exe), rodando o executável e selecionando a opção "Desktop development with C++" conforme a imagem: 

![imagem do instalador](https://code.visualstudio.com/assets/docs/cpp/msvc/desktop_development_with_cpp-2022.png)

2. [Baixe e execute o instalador do Rust](https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe)

3. Instale o Flutter SDK [de acordo com as instruções oficiais](https://docs.flutter.dev/get-started/install/windows)

4. Instale o ProtoBuf baixando [o arquivo compactado](https://github.com/protocolbuffers/protobuf/releases/download/v25.1/protoc-25.1-win64.zip), extraindo-o na sua pasta de preferência e adicionando ao PATH o caminho da pasta **`/bin`** que está dentro do conteúdo extraído.

</details>


Após seguir as instruções acima, clone o repositório, mude para a branch **`apps/base/monitor`** e abra a pasta **`monitor/`** com o editor de texto de sua preferência.

No diretório do projeto, abra um terminal e execute o seguinte comando:
```shell
cargo install rinf
```

Quaisquer problemas de instalação podem ser compartilhados com os colegas no grupo de software.

## Build

Para compilar e executar o código, é necessário:

1. Compilar as mensagens do ProtoBuf. Só é preciso compilar uma vez após editar os arquivos na pasta **`messages/`**, com o seguinte comando:
```shell
rinf message
```

2. Rodar a aplicação:
```shell
flutter run
```

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
