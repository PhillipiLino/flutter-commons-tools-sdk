# commons-tools-mobile

![Github Badge](https://img.shields.io/badge/Version-1.0.0-<>)
![Github Badge](https://img.shields.io/badge/-Flutter-3dbbe3?&logo=Flutter)
![Github Badge](https://img.shields.io/badge/-Dart-268bab?&logo=Dart)
![Github Badge](https://img.shields.io/badge/-NullSafety-268bab)

Pacote com helpers que facilitam em algumas funções das aplicações e SDKs.

<br/>

# Sumário

- [commons-tools-mobile](#commons-tools-mobile)
- [Sumário](#sumário)
  - [Informações técnicas](#informações-técnicas)
    - [Versão atual](#versão-atual)
    - [Dependências](#dependências)
  - [Instalação](#instalação)
    - [FIM](#fim)
        
## Informações técnicas
---

### Versão atual

* 1.0.0 (Acesse o [changelog](CHANGELOG.md) para visualizar todas mudanças)

### Dependências

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
commons_tools_sdk:
    git:
        url: https://github.com/PhillipiLino/flutter-commons-tools-sdk
        ref: {nome_da_branch}
```

- Versão local:
```yaml
commons_tools_sdk:
    path: {caminho_do_pacote}
```

### FIM