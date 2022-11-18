# cp.mt.sdk-tools-mobile [![Coverage Status](https://coveralls.io/repos/github/solfacil/cp.mt.sdk-tools-mobile/badge.svg?branch=dev&t=9PHPiw)](https://coveralls.io/github/solfacil/cp.mt.sdk-tools-mobile?branch=main)

![Github Badge](https://img.shields.io/badge/Version-1.1.3-<>)
![Github Badge](https://img.shields.io/badge/-Flutter-3dbbe3?&logo=Flutter)
![Github Badge](https://img.shields.io/badge/-Dart-268bab?&logo=Dart)
![Github Badge](https://img.shields.io/badge/-NullSafety-268bab)

Pacote com helpers que facilitam em algumas funções das aplicações e SDKs.

<br/>

### **Governança**
---
**DOMAIN**: (cp)

**SUBDOMAIN**: (mt)

<br/>

# Sumário

- [Informações técnicas](#informações-técnicas)
    - [Versão atual](#versão-atual)
    - [Dependências](#dependências)
- [Instalação](#instalação)
- [Implementação](#implementação)
    - [Requisitos de implementação](#requisitos-de-implementação)
    - [Passos](#passos)
- [Componentes](#classes)
    - [AuthenticatorLoginPage](#authenticatorloginpage)
    - [AuthenticatorLoginController](#authenticatorlogincontroller)
        - [Mudar ambiente do autenticador](#mudar-ambiente-do-autenticador)
        - [Login](#login)
        - [Logout](#logout)
    - [SSOAuthenticationInfo](#ssoauthenticationinfo)
- [SSOEnvironment](#ssoenvironment)
        

## Informações técnicas
---

### Versão atual

* 2.0.0 (Acesse o [changelog](CHANGELOG.md) para visualizar todas mudanças)

### Dependências

- `firebase_core`: ^1.20.0
- `firebase_analytics`: ^9.2.1
- `firebase_crashlytics`: ^2.8.6
- `cloud_firestore`: ^3.4.0
- `logger`: ^1.1.0
- `intl`: ^0.17.0
- `shared_preferences`: ^2.0.6
- `equatable`: ^2.0.3
- `launchdarkly_flutter_client_sdk`: ^1.1.4
- `mixpanel_flutter`: ^2.0.0
- `flutter_lints`: ^2.0.0
- `mocktail`: ^0.3.0

<br/>

## Instalação
---

Adicionar a seguinte dependência (com base em como você vai utilizar) no seu arquivo `pubspec.yaml` e logo após rodar o comando `flutter pub get` para baixar a dependência

- Versão do Github:
```yaml
solfacil_tools_sdk:
    git:
        url: https://github.com/solfacil/cp.mt.sdk-tools-mobile
        ref: {nome_da_branch}
```

- Versão local:
```yaml
solfacil_tools_sdk:
    path: {caminho_do_pacote}
```

<br/>

## Implementação
---

<br/>

Há um exemplo de como implementar a biblioteca [aqui](example/lib/main.dart).

<br/>

### Requisitos de implementação

<br/>

## Componentes
---

### FIM