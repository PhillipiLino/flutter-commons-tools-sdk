# [2.0.0] - 2022-10-19

## Feature:
- Mudança de toda a estrutura do projeto para ficar de acordo com os projetos publicáveis do flutter
- Adição da opção de requisitar um JSON do remote config 

# [1.1.3] - 2022-10-04

## Feature:
- Adição do formatador de texto `KwpInputFormatter`

# [1.1.2] - 2022-09-29

## Feature:
- Remoção da biblioteca `flutter_appauth`

# [1.1.1] - 2022-09-14

## Bugfix:
- Correção na regex de validação de emails para aceitar emails com `-` no domínio

# [1.1.0] - 2022-09-12

## Feature:
- Adicionado suporta para o launchDarkly
- Adicionado suporte para login com keycloack
- Adição dos seguintes formatadores de texto:
   - `DateInputFormatter`: '12/12/2022'
   - `CNPJInputFormatter`: '11.111.111/1111-11'
   - `CPFAndCNPJInputFormatter`: 
       - quando menor que 12 digitos: '111.111.111-11'
       - quando maior ou igual a 12 digitos: '11.111.111/1111-11'

# [1.0.0] - 2022-08-03

### Feature:
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

[2.0.0]: https://github.com/solfacil/sdk-tools-mobile/releases/tag/2.0.0
[1.1.3]: https://github.com/solfacil/sdk-tools-mobile/releases/tag/1.1.3
[1.1.2]: https://github.com/solfacil/sdk-tools-mobile/releases/tag/1.1.2
[1.1.1]: https://github.com/solfacil/sdk-tools-mobile/releases/tag/1.1.1
[1.1.0]: https://github.com/solfacil/sdk-tools-mobile/releases/tag/1.1.0
[1.0.0]: https://github.com/solfacil/sdk-tools-mobile/releases/tag/1.0.0