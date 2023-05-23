# [1.1.0] - 2023-05-23

### Features:
- Atualização das dependências para usar o Flutter 3.10

# [1.0.0] - 2022-08-03

### Features:
- Adição do logger para os logs de requests e erros
- Adição do firebase crashlytics, performance, firestore
- Adição dos seguintes formatadores de texto:
   - CPFInputFormatter (formatador de CPF)
   - CurrencyInputFormatter (formatador de Valores sem centavos)
   - KwhInputFormatter (formatador de geração de energia)
   - PhoneInputFormatter (formatador de telefone)
- Adição do adapter para SharedPreferences 
- Adição dos extensions para:
   -  DateFormat
   - Iterable
   - Number
   - ScrollController
   - String
- Adição do mixpanel como mais um SDK de tracker 
- Remoção da responsabilidade de log de erros da classe de trackers para a IReportError
- Mudança de toda a estrutura do projeto para ficar de acordo com os projetos publicáveis do flutter
- Adição da opção de requisitar um JSON do remote config 
- Adição do formatador de texto `KwpInputFormatter`
- Remoção da biblioteca `flutter_appauth`
- Adicionado suporta para o launchDarkly
- Adicionado suporte para login com keycloack
- Adição dos seguintes formatadores de texto:
  - `DateInputFormatter`: '12/12/2022'
  - `CNPJInputFormatter`: '11.111.111/1111-11'
  - `CPFAndCNPJInputFormatter`: 
    - quando menor que 12 digitos: '111.111.111-11'
    - quando maior ou igual a 12 digitos: '11.111.111/1111-11'

### Bugfix:
- Correção na regex de validação de emails para aceitar emails com `-` no domínio

[1.0.0]: https://github.com/PhillipiLino/flutter-commons-tools-sdk/releases/tag/1.0.0