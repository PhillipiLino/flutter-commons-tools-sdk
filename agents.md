# agents.md — commons_tools_sdk

Referência completa para agentes de IA trabalhando com este package.

---

## Package Identity

| Campo | Valor |
|---|---|
| Nome do package | `commons_tools_sdk` |
| Versão | `1.2.0` |
| Localização local | `/Users/phillipi/Workspace/sdk-tools-mobile` |
| Repositório | `https://github.com/PhillipiLino/flutter-commons-tools-sdk` |
| SDK mínimo | Dart `>=3.3.4 <4.0.0` |

---

## O que este package faz

`commons_tools_sdk` é uma biblioteca de utilitários Flutter agnóstica ao domínio de negócio. Fornece:

- **Extensions** sobre tipos primitivos e widgets Flutter (String, num, Iterable, DateFormat, ScrollController)
- **Input Formatters** para campos de texto (CPF, CNPJ, CEP, telefone, moeda, porcentagem, etc.)
- **Utils** transversais (conversão segura de tipo, debounce, fechar teclado, verificar internet)
- **Logger** com categorias de log e adaptador sobre o pacote `logger`
- **Preferences** com interface e adaptador para `shared_preferences`
- **Trackers** com interface e orquestrador fan-out para múltiplos SDKs de analytics
- **Error Report** com interface para serviços de monitoramento de erros
- **Remote Config** com interface para leitura de flags/configurações remotas
- **Constants** com regexes prontos para validação de dados brasileiros

O package NÃO implementa os SDKs externos (Firebase, Mixpanel, etc.) — apenas define as interfaces. As implementações concretas vivem em packages separados.

---

## Estrutura de Diretórios

```
sdk-tools-mobile/
├── lib/
│   ├── commons_tools_sdk.dart      # Barrel principal: extensions, utils, constants
│   ├── input_formatters.dart       # Barrel: todos os TextInputFormatters
│   ├── logger.dart                 # Barrel: LogManager, LoggerAdapter, LogType, RequestLogEvent
│   ├── preferences.dart            # Barrel: IPreferences, SharedPreferencesAdapter
│   ├── trackers.dart               # Barrel: IExternalTrackers, TrackersManager
│   ├── error_report.dart           # Barrel: IErrorReport
│   ├── remote_config.dart          # Barrel: IExternalRemoteConfigs
│   └── src/
│       ├── commons_tools_sdk.dart  # Re-export interno (junta todos os src/)
│       ├── constants/
│       │   └── regex.dart          # Constantes de regex (email, CPF, telefone, etc.)
│       ├── error_report/
│       │   └── error_report_interface.dart  # IErrorReport
│       ├── extensions/
│       │   ├── date_extensions.dart          # DateFormatExtension
│       │   ├── document_extensions.dart      # DocumentStringExtension (CPF/CNPJ)
│       │   ├── iterable_extensions.dart      # IterablesExtension
│       │   ├── number_extensions.dart        # NumExtensions
│       │   ├── scroll_controller_extension.dart # ScrollControllerExtensions
│       │   └── string_extensions.dart        # NullableStringExtension, StringExtension
│       ├── input_formatters/
│       │   ├── input_formatters.dart         # Library com parts (root)
│       │   ├── cep_input_formatter.dart
│       │   ├── cnpj_input_formatter.dart
│       │   ├── cpf_cnpj_input_formatter.dart
│       │   ├── cpf_input_formatter.dart
│       │   ├── currency_input_formatter.dart
│       │   ├── date_input_formatter.dart
│       │   ├── double_currency_input_formatter.dart  # @Deprecated
│       │   ├── double_percent_input_formatter.dart   # @Deprecated
│       │   ├── kwh_input_formatter.dart              # @Deprecated
│       │   ├── kwp_input_formatter.dart              # @Deprecated
│       │   ├── number_input_formatter.dart
│       │   ├── percent_input_formatter.dart
│       │   ├── phone_input_formatter.dart
│       │   └── year_input_formatter.dart
│       ├── log/
│       │   ├── logger.dart           # Library com parts (root)
│       │   ├── log_manager.dart      # LogManager singleton
│       │   ├── log_type.dart         # enum LogType
│       │   ├── logger_adapter.dart   # LoggerAdapter (wraps logger package)
│       │   └── request_log_event.dart
│       ├── preferences/
│       │   ├── preferences.dart      # Library com parts (root)
│       │   ├── preferences_interface.dart    # IPreferences
│       │   └── shared_preferences_adapter.dart
│       ├── remote_config/
│       │   ├── remote_config.dart    # Library com parts (root)
│       │   └── external_remote_config_interface.dart  # IExternalRemoteConfigs
│       ├── trackers/
│       │   ├── trackers.dart         # Library com parts (root)
│       │   ├── external_trackers_interface.dart  # IExternalTrackers
│       │   └── trackers_manager.dart
│       └── utils/
│           ├── cast_helper.dart      # castOrNull<T>()
│           ├── debouncer.dart        # Debouncer
│           ├── internet_helper.dart  # InternetHelper
│           └── keyboard.dart        # hideKeyboard()
└── test/
    └── ...
```

---

## Barrels e o que cada um exporta

### `lib/commons_tools_sdk.dart`

Re-exporta pacotes externos e os utilitários internos principais:

**Pacotes re-exportados (disponíveis sem import adicional):**
- `package:collection/collection.dart` — `ListEquality`, `groupBy`, etc.
- `package:equatable/equatable.dart` — `Equatable`, `EquatableMixin`
- `package:intl/date_symbol_data_local.dart`
- `package:intl/intl.dart` — `DateFormat`, `NumberFormat`, etc.
- `package:intl/message_lookup_by_library.dart`
- `package:intl/src/intl_helpers.dart`

**Símbolos internos exportados:**
- `castOrNull` (função)
- `DateFormatExtension` (extension on DateFormat)
- `dateRegex` (const String)
- `Debouncer` (class)
- `DocumentStringExtension` (extension on String?)
- `emailRegex` (const String)
- `hideKeyboard` (função)
- `InternetHelper` (class)
- `IterablesExtension` (extension on Iterable<E>)
- `nameRegex` (const String)
- `notEmptyRegex` (const String)
- `NullableStringExtension` (extension on String?)
- `NumExtensions` (extension on num?)
- `onlyLettersRegex` (const String)
- `phoneNumberRegex` (const String)
- `ScrollControllerExtensions` (extension on ScrollController)
- `StringExtension` (extension on String)
- `usernameRegex` (const String)

### `lib/input_formatters.dart`

- `CEPInputFormatter`
- `CNPJInputFormatter`
- `CPFAndCNPJInputFormatter`
- `CPFInputFormatter`
- `CurrencyInputFormatter`
- `DateInputFormatter`
- `DoubleCurrencyInputFormatter` *(deprecated)*
- `DoublePercentInputFormatter` *(deprecated)*
- `KwhInputFormatter` *(deprecated)*
- `KwpInputFormatter` *(deprecated)*
- `NumberInputFormatter`
- `PercentInputFormatter`
- `PhoneInputFormatter`
- `YearInputFormatter`

### `lib/logger.dart`

- `LogType` (enum)
- `LogManager` (singleton class)
- `RequestLogEvent` (class)
- `LoggerAdapter` (class)

### `lib/preferences.dart`

- `IPreferences` (abstract class)
- `SharedPreferencesAdapter` (class implements IPreferences)

### `lib/trackers.dart`

- `IExternalTrackers` (abstract class)
- `TrackersManager` (class)

### `lib/error_report.dart`

- `IErrorReport` (abstract class)

### `lib/remote_config.dart`

- `IExternalRemoteConfigs` (abstract class)

---

## API Completa

### Extensions

#### `NullableStringExtension` — on `String?`

```dart
bool get isValidEmail
bool get isValidPhoneNumber
bool get isValidDate
bool get isValidFullName
bool matchRegex(String regex)
num fromCurrency([String locale = 'pt_BR'])
String removeDiacritics()
String onlyDigits()
String removeSpecialChars()
```

#### `StringExtension` — on `String`

```dart
String toCapitalized()
String get toTitleCase
```

#### `NumExtensions` — on `num?`

```dart
String toCurrency({String locale = 'pt_BR', bool showDecimals = true})
String toLocale({String locale = 'pt_BR', bool showDecimals = true})
String toPercent({String locale = 'pt_BR', bool showDecimals = true})
```

#### `DocumentStringExtension` — on `String?`

```dart
bool get isValidCPF    // valida algoritmo mod 11
bool get isValidCNPJ   // valida algoritmo mod 11
```

#### `DateFormatExtension` — on `DateFormat`

```dart
DateTime? tryParse(String inputString, [bool utc = false])
```

#### `IterablesExtension<E>` — on `Iterable<E>`

```dart
Map<K, List<E>> groupBy<K>(K Function(E) keyFunction)
```

#### `ScrollControllerExtensions` — on `ScrollController`

```dart
Future<void> scrollDown({
  int delay = 0,
  Duration animateDuration = const Duration(milliseconds: 300),
})
```

---

### Input Formatters

Todos estendem `TextInputFormatter` e implementam `formatEditUpdate`.

#### `CPFInputFormatter`
- Saída: `123.456.789-09`
- Sem parâmetros

#### `CNPJInputFormatter`
- Saída: `11.222.333/0001-81`
- Sem parâmetros

#### `CPFAndCNPJInputFormatter`
- Saída: CPF quando `< 12 dígitos`, CNPJ quando `>= 12 dígitos`
- Delega internamente para `CPFInputFormatter` ou `CNPJInputFormatter`

#### `CEPInputFormatter`
- Saída: `01310-100`
- Sem parâmetros

#### `PhoneInputFormatter`
- Saída: `(11) 99999-9999`
- Sem parâmetros

#### `DateInputFormatter`
- Saída: `12/12/2022`
- Sem parâmetros

#### `YearInputFormatter`
- Saída: `1 ano` / `5 anos`
- Sem parâmetros

#### `CurrencyInputFormatter`
```dart
CurrencyInputFormatter({
  bool withDecimals = false,   // false: R$ 1.234 | true: R$ 1.234,56
  bool allowNegative = false,
})
```

#### `NumberInputFormatter`
```dart
NumberInputFormatter({
  String suffix = '',           // ex: 'kWh', 'kWp', '%'
  bool withDecimals = false,
  bool allowNegative = false,
})
```

#### `PercentInputFormatter`
Extends `NumberInputFormatter` com `suffix = '%'`:
```dart
PercentInputFormatter({
  bool withDecimals = false,
  bool allowNegative = false,
})
```

#### Formatters deprecated

| Classe | Substituto |
|---|---|
| `KwhInputFormatter` | `NumberInputFormatter(suffix: 'kWh')` |
| `KwpInputFormatter` | `NumberInputFormatter(suffix: 'kWp', withDecimals: true)` |
| `DoubleCurrencyInputFormatter` | `CurrencyInputFormatter(withDecimals: true)` |
| `DoublePercentInputFormatter` | `PercentInputFormatter(withDecimals: true)` |

---

### Utils

#### `castOrNull<T>(dynamic value) → T?`

```dart
T? castOrNull<T>(dynamic value)
// value == null → null
// value is T   → value
// otherwise    → null
```

#### `Debouncer`

```dart
class Debouncer {
  final int milliseconds;
  Debouncer({required this.milliseconds});

  void run(VoidCallback action)  // cancela timer anterior, agenda novo
  void dispose()                 // cancela timer pendente
}
```

#### `hideKeyboard() → void`

Função top-level. Chama `FocusManager.instance.primaryFocus?.unfocus()`.

#### `InternetHelper`

```dart
class InternetHelper {
  Future<bool> hasNetwork()  // DNS lookup para 'example.com'
}
```

---

### Logger

#### `enum LogType`

```dart
enum LogType {
  request,
  responseRequest,
  warning,
  info,
  error,
  specificData,
}
```

#### `LogManager` (singleton)

```dart
class LogManager {
  static final LogManager shared = LogManager._internal();
  factory LogManager() => shared;

  LoggerAdapter? logger;          // substituível para testes/customização
  List<LogType> typesToLog = [];  // apenas tipos listados aqui são logados

  void logRequestEvent(RequestLogEvent event)
  void logWarning(dynamic message)
  void logInfo(dynamic message)
  void logError(dynamic message)
  void logVerbose(dynamic message)
  void logSpecificData(dynamic message)
}
```

Regras de filtragem:
- `logInfo` passa se `typesToLog` contém `LogType.info` **ou** `LogType.request`
- `logVerbose` passa se `typesToLog` contém `LogType.info` **ou** `LogType.responseRequest`
- Demais métodos exigem o tipo correspondente exato

#### `LoggerAdapter`

```dart
class LoggerAdapter {
  final Logger logger;
  LoggerAdapter()  // cria Logger() interno

  dynamic logWarning(dynamic message)   // Level.warning
  dynamic logInfo(dynamic message)      // Level.info
  dynamic logError(dynamic message)     // Level.error
  dynamic logVerbose(dynamic message)   // Level.trace
  dynamic logStrange(dynamic message)   // Level.fatal
  void log(dynamic message, Level level)
}
```

#### `RequestLogEvent`

```dart
class RequestLogEvent {
  final String url;
  final dynamic data;
  final String? method;
  final Map<String, dynamic>? headers;
  final String? contentType;
  final Map<String, dynamic>? queryParameters;
  final dynamic response;
  final int? statusCode;
  final Exception? exception;
  final LogType logType;  // default: LogType.info

  RequestLogEvent({required this.url, ...});
  Map<String, dynamic> toJson()
  String toString()  // formatado multi-linha
}

typedef LogEventCallback = bool Function(RequestLogEvent event);
```

---

### Preferences

#### `IPreferences` (abstract)

```dart
abstract class IPreferences {
  Future<String?> getString(String key);
  Future<bool> setString(String key, String value);
  Future<int?> getInt(String key);
  Future<bool> setInt(String key, int value);
  Future<bool?> getBool(String key);
  Future<bool> setBool(String key, bool value);
  Future<List<String>> getKeys();
  Future<bool> removeKey(String key);
  Future<bool> clear();
}
```

#### `SharedPreferencesAdapter implements IPreferences`

Implementação completa de `IPreferences`. Usa `SharedPreferences.getInstance()` internamente (lazy, cached via `Future`). Métodos de leitura retornam `null` em caso de erro, sem lançar exceção.

---

### Trackers

#### `IExternalTrackers` (abstract)

```dart
abstract class IExternalTrackers {
  Future logSuccessLogin(
    String userId,
    String email, {
    Map<String, Object>? additionalInfos,
  });

  Future setLoggedUser({
    required String userId,
    required String email,
    required String name,
    Map<String, Object>? additionalInfos,
  });

  Future removeUserData();

  Future trackButtonClick(
    String btnName, {
    required Map<String, Object> infos,
  });

  Future trackCustomEvent(
    String eventName, {
    required Map<String, Object> infos,
  });

  Future trackPageOpen(String pageName);

  Future stopTrackPage(
    String pageName, {
    required Map<String, Object>? infos,
  });
}
```

#### `TrackersManager`

```dart
class TrackersManager {
  final List<IExternalTrackers> trackers;
  TrackersManager(this.trackers);

  Future setLoggedUser({required String userId, required String email, required String name, Map<String, Object>? additionalInfos})
  Future removeLoggedUser()
  Future trackButtonClick(String btnName, {required Map<String, Object> infos})
  Future trackPageOpen(String pageName)
  Future trackCustomEvent(String eventName, {required Map<String, Object> infos})
  Future stopTrackPage(String pageName, {Map<String, Object>? infos})
  Future logSuccessLogin(String userId, String email, {Map<String, Object>? additionalInfos})
}
```

Padrão fan-out: itera `trackers` e chama o método correspondente em cada um. Não aguarda as Futures individuais (fire-and-forget por tracker).

---

### Error Report

#### `IErrorReport` (abstract)

```dart
abstract class IErrorReport {
  Future recordException({
    required Exception exception,
    required StackTrace stack,
    required String reason,
    int? errorCode,
    bool printDebugLog = true,
  });
}
```

---

### Remote Config

#### `IExternalRemoteConfigs` (abstract)

```dart
abstract class IExternalRemoteConfigs {
  Future<void> setUser(
    String userId,
    String userEmail, {
    Map<String, dynamic>? additionalInfos,
  });

  Future<bool> getBool(String key, bool defaultValue);
  Future<int> getInt(String key, int defaultValue);
  Future<double> getDouble(String key, double defaultValue);
  Future<String> getString(String key, String defaultValue);
  Future<Map<String, dynamic>> getJSON(
    String key,
    Map<String, dynamic> defaultValue,
  );
}
```

Todos os métodos `get*` recebem `defaultValue` — implementações nunca devem lançar exceção, devem retornar o default em caso de falha.

---

### Constants (regex.dart)

```dart
const String notEmptyRegex       = r'^.*$';
const String phoneNumberRegex    = r'^\((\d{2})+\) +(\d{5})+\-\d{4}$';
const String nameRegex           = r'^[0-9a-zA-ZÀ-ÿ ]{0,180}$';
const String fullNameRegex       = r'^([A-Za-zÀ-Źà-ź]{2,})\s([A-Za-zÀ-Źà-ź-\s]{2,})$';
const String usernameRegex       = r'^([0-9a-zA-Z._]{3,20})$';
const String emailRegex          = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+";
const String dateRegex           = r'^(0[1-9]|[12][0-9]|3[01])(\/|-|\.)(0[1-9]|1[012])(\/|-|\.)(?:19|20)[0-9]{1}[0-9]{1}$';
const String onlyLettersRegex    = '[a-zA-ZÀ-ž ]';
```

`fullNameRegex` não está exportado pelo barrel `commons_tools_sdk.dart` mas é usado internamente por `NullableStringExtension.isValidFullName`.

---

## Padrões Arquiteturais Usados

### Adapter Pattern
`LoggerAdapter`, `SharedPreferencesAdapter` — wrappam libs externas atrás de interfaces controladas. Isso permite trocar o motor externo sem afetar consumidores.

### Singleton (com factory)
`LogManager.shared` — instância única global. Cuidado: estado mutável (`typesToLog`, `logger`) é compartilhado na aplicação inteira.

### Fan-out (Composite)
`TrackersManager` — recebe uma lista de `IExternalTrackers` e propaga cada chamada para todos. Adicionar um novo SDK de analytics é apenas registrar mais um item na lista.

### Interface Segregation
Cada capacidade (Trackers, Preferences, ErrorReport, RemoteConfig) tem sua própria interface mínima. Implementações concretas ficam fora deste package.

---

## Como adicionar uma nova Extension

1. Crie o arquivo em `lib/src/extensions/my_type_extensions.dart`
2. Declare a extension:
   ```dart
   extension MyTypeExtension on MyType {
     ReturnType myMethod() { ... }
   }
   ```
3. Adicione export no `lib/src/commons_tools_sdk.dart` (arquivo interno que agrega os `src/`)
4. Adicione o símbolo na lista `show` do barrel `lib/commons_tools_sdk.dart`:
   ```dart
   export 'src/commons_tools_sdk.dart'
       show
           ...,
           MyTypeExtension;
   ```
5. Escreva testes em `test/extensions/my_type_extensions_test.dart`

---

## Como adicionar um novo Input Formatter

1. Crie o arquivo em `lib/src/input_formatters/my_formatter.dart`
2. Inicie com `part of 'input_formatters.dart';`
3. Implemente estendendo `TextInputFormatter`:
   ```dart
   part of 'input_formatters.dart';

   class MyInputFormatter extends TextInputFormatter {
     @override
     TextEditingValue formatEditUpdate(
       TextEditingValue oldValue,
       TextEditingValue newValue,
     ) {
       // lógica de formatação
     }
   }
   ```
4. Adicione `part 'my_formatter.dart';` no `lib/src/input_formatters/input_formatters.dart`
5. Adicione `MyInputFormatter` na lista `show` do barrel `lib/input_formatters.dart`

---

## Como adicionar um novo Adapter (Preferences, Trackers, etc.)

1. Crie o arquivo em `lib/src/<módulo>/my_adapter.dart`
2. Inicie com `part of '<módulo>.dart';`
3. Implemente a interface correspondente (`IPreferences`, `IExternalTrackers`, etc.)
4. Adicione `part 'my_adapter.dart';` no arquivo library raiz do módulo
5. Exporte o novo símbolo no barrel público do módulo

---

## Pitfalls Comuns

### LogManager não loga nada
`typesToLog` começa vazio. Configure antes de usar:
```dart
LogManager.shared.typesToLog = [LogType.error, LogType.request];
```

### castOrNull vs conversão direta
```dart
// ERRADO — lança se o tipo não bate
final id = json['id'] as int;

// CORRETO — retorna null
final id = castOrNull<int>(json['id']);
```

### Debouncer sem dispose
`Debouncer` mantém um `Timer` ativo. Sem `dispose()`, gera memory leak em `StatefulWidget`.

### InternetHelper não substitui verificação real
`hasNetwork()` faz um lookup DNS para `example.com`. Em redes com DNS resolving mas sem internet real (captive portals), pode retornar `true` incorretamente.

### fromCurrency com locale diferente
`fromCurrency()` usa `pt_BR` por padrão. Se o valor exibido veio de outro locale, passe o locale correto:
```dart
'$ 1,234.56'.fromCurrency('en_US')
```

### Formatters deprecated
Quatro formatters têm `@Deprecated`. O linter do projeto vai emitir warnings. Use os substitutos indicados:
- `KwhInputFormatter` → `NumberInputFormatter(suffix: 'kWh')`
- `KwpInputFormatter` → `NumberInputFormatter(suffix: 'kWp', withDecimals: true)`
- `DoubleCurrencyInputFormatter` → `CurrencyInputFormatter(withDecimals: true)`
- `DoublePercentInputFormatter` → `PercentInputFormatter(withDecimals: true)`

### TrackersManager fire-and-forget
`TrackersManager` não aguarda as Futures de cada tracker individualmente. Erros lançados dentro de um tracker não são capturados pelo manager. Implemente try/catch dentro de cada `IExternalTrackers`.

### fullNameRegex não exportado
A constante `fullNameRegex` existe em `regex.dart` mas não está listada no `show` do barrel `commons_tools_sdk.dart`. Só está acessível internamente. Use `isValidFullName` via extensão.

---

## Dependências e seus Propósitos

| Pacote | Versão | Usado por | Propósito |
|---|---|---|---|
| `logger` | ^2.6.1 | `LoggerAdapter` | Motor de log com níveis e formatação colorida |
| `intl` | ^0.20.2 | `NumExtensions`, formatters, `DateFormatExtension` | Formatação de moeda, números e datas com locale |
| `shared_preferences` | ^2.5.3 | `SharedPreferencesAdapter` | Persistência chave-valor nativa (iOS NSUserDefaults / Android SharedPreferences) |
| `equatable` | ^2.0.7 | Re-exportado | Comparação de objetos por valor sem boilerplate |
| `collection` | ^1.19.1 | Re-exportado | Utilitários extras de coleção Dart |
| `flutter_lints` | ^6.0.0 | dev | Regras de lint recomendadas pelo Flutter team |
| `mocktail` | ^1.0.4 | dev | Mocking em testes (sem geração de código) |
