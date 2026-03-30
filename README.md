# commons-tools-mobile

![Version](https://img.shields.io/badge/Version-1.2.0-blueviolet)
![Flutter](https://img.shields.io/badge/-Flutter-3dbbe3?&logo=Flutter)
![Dart](https://img.shields.io/badge/-Dart-268bab?&logo=Dart)
![NullSafety](https://img.shields.io/badge/-NullSafety-268bab)

Pacote com helpers, extensões, formatadores e interfaces que facilitam o desenvolvimento de aplicações e SDKs Flutter. Fornece utilitários reutilizáveis para formatação de dados, gerenciamento de preferências, rastreamento de eventos, logs e configuração remota.

---

## Sumário

- [Instalação](#instalação)
- [Módulos](#módulos)
  - [Extensions](#extensions)
  - [Input Formatters](#input-formatters)
  - [Utils](#utils)
  - [Logger](#logger)
  - [Preferences](#preferences)
  - [Trackers](#trackers)
  - [Error Report](#error-report)
  - [Remote Config](#remote-config)
  - [Constants](#constants)
- [Dependências](#dependências)
- [Testes](#testes)

---

## Instalação

Adicione a dependência no `pubspec.yaml` e rode `flutter pub get`.

**Via Git:**
```yaml
dependencies:
  commons_tools_sdk:
    git:
      url: https://github.com/PhillipiLino/flutter-commons-tools-sdk
      ref: main
```

**Via path local:**
```yaml
dependencies:
  commons_tools_sdk:
    path: /caminho/para/sdk-tools-mobile
```

---

## Módulos

### Extensions

Importe via barrel principal:
```dart
import 'package:commons_tools_sdk/commons_tools_sdk.dart';
```

#### String (NullableStringExtension — on `String?`)

```dart
// Validações
'user@email.com'.isValidEmail       // true
'(11) 99999-9999'.isValidPhoneNumber // true
'12/12/2022'.isValidDate            // true
'João Silva'.isValidFullName        // true
'abc123'.matchRegex(r'^[a-z0-9]+$') // true

// Conversão
'R$ 1.234,56'.fromCurrency()        // 1234.56 (num)
'R$ 1.234,56'.fromCurrency('pt_BR') // locale customizável

// Transformação
'café com açúcar'.removeDiacritics()   // 'cafe com acucar'
'(11) 99999-9999'.onlyDigits()         // '11999999999'
'olá mundo!'.removeSpecialChars()      // 'olmundo'  (remove não alfanuméricos)
```

#### String (StringExtension — on `String`)

```dart
'hello world'.toCapitalized()  // 'Hello world'
'hello world'.toTitleCase      // 'Hello World'
```

#### Number (NumExtensions — on `num?`)

```dart
1234.56.toCurrency()                        // 'R$ 1.234,56'
1234.56.toCurrency(showDecimals: false)     // 'R$ 1.235'
1234.56.toCurrency(locale: 'en_US')        // '$ 1,234.56'

1234.56.toLocale()                          // '1.234,56'
1234.toLocale(showDecimals: false)          // '1.234'

0.75.toPercent()                            // '0,75 %'
0.75.toPercent(showDecimals: false)         // '1 %'
```

#### Document (DocumentStringExtension — on `String?`)

```dart
'123.456.789-09'.isValidCPF   // true/false (valida dígitos verificadores)
'11.222.333/0001-81'.isValidCNPJ // true/false (valida dígitos verificadores)
```

#### Date (DateFormatExtension — on `DateFormat`)

```dart
final fmt = DateFormat('dd/MM/yyyy');

// tryParse retorna null em vez de lançar exceção
fmt.tryParse('25/12/2024')  // DateTime(2024, 12, 25)
fmt.tryParse('invalido')    // null
fmt.tryParse('25/12/2024', true) // UTC
```

#### Iterable (IterablesExtension — on `Iterable<E>`)

```dart
final pessoas = [
  {'nome': 'Ana', 'cidade': 'SP'},
  {'nome': 'Bob', 'cidade': 'RJ'},
  {'nome': 'Bia', 'cidade': 'SP'},
];

final porCidade = pessoas.groupBy((p) => p['cidade']);
// {'SP': [...], 'RJ': [...]}
```

#### ScrollController (ScrollControllerExtensions)

```dart
final controller = ScrollController();

// Scrolla para o final com animação suave
await controller.scrollDown();

// Com delay antes de scrollar e duração customizada
await controller.scrollDown(
  delay: 100,
  animateDuration: const Duration(milliseconds: 500),
);
```

---

### Input Formatters

Importe via barrel específico:
```dart
import 'package:commons_tools_sdk/input_formatters.dart';
```

Use como `inputFormatters` em `TextField` ou `TextFormField`:
```dart
TextField(
  inputFormatters: [CPFInputFormatter()],
)
```

| Classe | Saída | Observação |
|---|---|---|
| `CPFInputFormatter` | `123.456.789-09` | |
| `CNPJInputFormatter` | `11.222.333/0001-81` | |
| `CPFAndCNPJInputFormatter` | CPF ou CNPJ | Alterna automaticamente com base no tamanho |
| `CEPInputFormatter` | `01310-100` | |
| `PhoneInputFormatter` | `(11) 99999-9999` | |
| `DateInputFormatter` | `12/12/2022` | |
| `YearInputFormatter` | `1 ano` / `5 anos` | |
| `CurrencyInputFormatter` | `R$ 1.234` ou `R$ 1.234,56` | Parâmetros: `withDecimals`, `allowNegative` |
| `NumberInputFormatter` | `1.234` ou `1.234,56 kWh` | Parâmetros: `suffix`, `withDecimals`, `allowNegative` |
| `PercentInputFormatter` | `75 %` ou `75,50 %` | Parâmetros: `withDecimals`, `allowNegative` |
| `KwhInputFormatter` | `1.234 kWh` | **Deprecated** — use `NumberInputFormatter(suffix: 'kWh')` |
| `KwpInputFormatter` | `12,34 kWp` | **Deprecated** — use `NumberInputFormatter(suffix: 'kWp', withDecimals: true)` |
| `DoubleCurrencyInputFormatter` | `R$ 1.234,56` | **Deprecated** — use `CurrencyInputFormatter(withDecimals: true)` |
| `DoublePercentInputFormatter` | `75,50 %` | **Deprecated** — use `PercentInputFormatter(withDecimals: true)` |

**Exemplo com CurrencyInputFormatter:**
```dart
// Inteiros: R$ 1.234
TextField(
  inputFormatters: [CurrencyInputFormatter()],
)

// Com decimais: R$ 1.234,56
TextField(
  inputFormatters: [CurrencyInputFormatter(withDecimals: true)],
)

// Permite negativos
TextField(
  inputFormatters: [CurrencyInputFormatter(allowNegative: true)],
)
```

**Exemplo com NumberInputFormatter:**
```dart
// Energia com sufixo: 1.234 kWh
TextField(
  inputFormatters: [NumberInputFormatter(suffix: 'kWh')],
)

// Potência com decimais: 12,34 kWp
TextField(
  inputFormatters: [NumberInputFormatter(suffix: 'kWp', withDecimals: true)],
)
```

---

### Utils

Importe via barrel principal:
```dart
import 'package:commons_tools_sdk/commons_tools_sdk.dart';
```

#### castOrNull

Converte um valor dinamico para um tipo específico sem lançar exceção:

```dart
final value = castOrNull<int>('texto'); // null
final num    = castOrNull<int>(42);     // 42
final result = castOrNull<String>(json['campo']); // String? seguro
```

#### Debouncer

Adia a execução de uma ação até que o usuário pare de disparar eventos:

```dart
final debouncer = Debouncer(milliseconds: 500);

// Em um campo de busca
onChanged: (text) {
  debouncer.run(() => search(text));
},

// Lembre-se de fazer dispose
@override
void dispose() {
  debouncer.dispose();
  super.dispose();
}
```

#### hideKeyboard

Fecha o teclado programaticamente:

```dart
hideKeyboard(); // FocusManager.instance.primaryFocus?.unfocus()
```

#### InternetHelper

Verifica conectividade com a internet via DNS lookup:

```dart
final helper = InternetHelper();
final hasConnection = await helper.hasNetwork(); // bool
```

---

### Logger

Importe via barrel específico:
```dart
import 'package:commons_tools_sdk/logger.dart';
```

O sistema de log é composto por três camadas: `LogType` (categorias), `LogManager` (singleton orquestrador) e `LoggerAdapter` (adaptador do pacote `logger`).

#### Configuração

```dart
// Configure os tipos de log que deseja ativar
LogManager.shared.typesToLog = [
  LogType.request,
  LogType.responseRequest,
  LogType.error,
  LogType.warning,
];

// Substitua o adapter se necessário (ex: adapter customizado)
LogManager.shared.logger = MeuLoggerAdapter();
```

#### LogType

| Valor | Quando usar |
|---|---|
| `LogType.request` | Log de requisições HTTP de saída |
| `LogType.responseRequest` | Log de respostas HTTP recebidas |
| `LogType.warning` | Avisos não críticos |
| `LogType.info` | Informações gerais |
| `LogType.error` | Erros e exceções |
| `LogType.specificData` | Dados específicos de depuração |

#### Logging manual

```dart
final log = LogManager.shared;

log.logInfo('Usuário autenticado');
log.logWarning('Token próximo de expirar');
log.logError('Falha ao carregar dados');
log.logVerbose('Resposta recebida: $response');
log.logSpecificData('Estado interno: $state');
```

#### RequestLogEvent — log de chamadas HTTP

```dart
final event = RequestLogEvent(
  url: 'https://api.example.com/users',
  method: 'GET',
  headers: {'Authorization': 'Bearer token'},
  statusCode: 200,
  response: responseBody,
  logType: LogType.responseRequest,
);

LogManager.shared.logRequestEvent(event);
```

---

### Preferences

Importe via barrel específico:
```dart
import 'package:commons_tools_sdk/preferences.dart';
```

#### IPreferences

Interface para persistência de chave-valor. Implemente-a para injetar em qualquer repositório:

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

#### SharedPreferencesAdapter

Implementação concreta baseada no pacote `shared_preferences`:

```dart
final prefs = SharedPreferencesAdapter();

await prefs.setString('token', 'abc123');
final token = await prefs.getString('token'); // 'abc123'

await prefs.setBool('onboarding_done', true);
final done = await prefs.getBool('onboarding_done'); // true

await prefs.removeKey('token');
await prefs.clear(); // limpa tudo
```

**Usando com injeção de dependência:**
```dart
// Registro
getIt.registerSingleton<IPreferences>(SharedPreferencesAdapter());

// Uso no repositório
class AuthRepository {
  final IPreferences _prefs;
  AuthRepository(this._prefs);

  Future<void> saveToken(String token) =>
      _prefs.setString('auth_token', token);
}
```

---

### Trackers

Importe via barrel específico:
```dart
import 'package:commons_tools_sdk/trackers.dart';
```

#### IExternalTrackers

Interface que cada SDK de analytics deve implementar (Mixpanel, Amplitude, Firebase Analytics, etc.):

```dart
abstract class IExternalTrackers {
  Future logSuccessLogin(String userId, String email, {Map<String, Object>? additionalInfos});
  Future setLoggedUser({required String userId, required String email, required String name, Map<String, Object>? additionalInfos});
  Future removeUserData();
  Future trackButtonClick(String btnName, {required Map<String, Object> infos});
  Future trackCustomEvent(String eventName, {required Map<String, Object> infos});
  Future trackPageOpen(String pageName);
  Future stopTrackPage(String pageName, {required Map<String, Object>? infos});
}
```

#### TrackersManager

Orquestra múltiplos trackers com fan-out — uma chamada propaga para todos os trackers registrados:

```dart
final manager = TrackersManager([
  MixpanelTracker(),
  AmplitudeTracker(),
  FirebaseAnalyticsTracker(),
]);

// Todas as chamadas são propagadas para todos os trackers
await manager.setLoggedUser(
  userId: '123',
  email: 'user@example.com',
  name: 'João Silva',
);

await manager.trackPageOpen('home_page');

await manager.trackButtonClick('btn_buy', infos: {
  'product_id': 'prod_123',
  'price': 99.90,
});

await manager.trackCustomEvent('checkout_completed', infos: {
  'order_id': 'ord_456',
});

await manager.stopTrackPage('home_page', infos: {'time_spent': 30});

await manager.logSuccessLogin('123', 'user@example.com');

await manager.removeLoggedUser(); // ao fazer logout
```

**Implementando um tracker customizado:**
```dart
class MixpanelTracker implements IExternalTrackers {
  @override
  Future trackPageOpen(String pageName) async {
    await Mixpanel.getInstance().track('page_open_$pageName');
  }
  // ... demais métodos
}
```

---

### Error Report

Importe via barrel específico:
```dart
import 'package:commons_tools_sdk/error_report.dart';
```

#### IErrorReport

Interface para reportar exceções a serviços de monitoramento (Firebase Crashlytics, Sentry, etc.):

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

**Implementação e uso:**
```dart
class CrashlyticsErrorReport implements IErrorReport {
  @override
  Future recordException({
    required Exception exception,
    required StackTrace stack,
    required String reason,
    int? errorCode,
    bool printDebugLog = true,
  }) async {
    if (printDebugLog) debugPrint('[$errorCode] $reason: $exception');
    await FirebaseCrashlytics.instance.recordError(exception, stack, reason: reason);
  }
}

// Uso
try {
  await repository.fetchData();
} catch (e, stack) {
  errorReport.recordException(
    exception: e as Exception,
    stack: stack,
    reason: 'Falha ao carregar dados da home',
    errorCode: 500,
  );
}
```

---

### Remote Config

Importe via barrel específico:
```dart
import 'package:commons_tools_sdk/remote_config.dart';
```

#### IExternalRemoteConfigs

Interface para leitura de configurações remotas (Firebase Remote Config, LaunchDarkly, etc.):

```dart
abstract class IExternalRemoteConfigs {
  Future<void> setUser(String userId, String userEmail, {Map<String, dynamic>? additionalInfos});
  Future<bool> getBool(String key, bool defaultValue);
  Future<int> getInt(String key, int defaultValue);
  Future<double> getDouble(String key, double defaultValue);
  Future<String> getString(String key, String defaultValue);
  Future<Map<String, dynamic>> getJSON(String key, Map<String, dynamic> defaultValue);
}
```

**Uso:**
```dart
// Identificar o usuário para segmentação
await remoteConfig.setUser('user_123', 'user@example.com');

// Ler flags e configurações com valor padrão (nunca lança exceção)
final isFeatureEnabled = await remoteConfig.getBool('new_checkout_enabled', false);
final maxItems = await remoteConfig.getInt('cart_max_items', 10);
final discount = await remoteConfig.getDouble('discount_rate', 0.0);
final welcomeMsg = await remoteConfig.getString('welcome_message', 'Olá!');
final config = await remoteConfig.getJSON('app_config', {});
```

---

### Constants

Importe via barrel principal:
```dart
import 'package:commons_tools_sdk/commons_tools_sdk.dart';
```

Constantes de regex prontas para uso com `RegExp` ou nas extensões de `String?`:

| Constante | Padrão | Exemplo válido |
|---|---|---|
| `notEmptyRegex` | `^.*$` | qualquer string |
| `phoneNumberRegex` | `^\((\d{2})+\) +(\d{5})+\-\d{4}$` | `(11) 99999-9999` |
| `nameRegex` | `^[0-9a-zA-ZÀ-ÿ ]{0,180}$` | `João 123` |
| `fullNameRegex` | nome + sobrenome, mín. 2 chars cada | `João Silva` |
| `usernameRegex` | `^([0-9a-zA-Z._]{3,20})$` | `joao.silva` |
| `emailRegex` | padrão RFC com suporte a `-` no domínio | `user@my-domain.com` |
| `dateRegex` | `DD/MM/YYYY` ou `DD-MM-YYYY` ou `DD.MM.YYYY` | `25/12/2024` |
| `onlyLettersRegex` | `[a-zA-ZÀ-ž ]` | `João` |

```dart
// Uso direto
final isValid = RegExp(emailRegex).hasMatch('user@example.com');

// Via extensão (já usa os regex internamente)
'user@example.com'.isValidEmail
'(11) 99999-9999'.isValidPhoneNumber
'25/12/2024'.isValidDate
'João Silva'.isValidFullName
```

---

## Dependências

| Pacote | Versão | Propósito |
|---|---|---|
| `logger` | ^2.6.1 | Motor de log por trás do `LoggerAdapter` |
| `intl` | ^0.20.2 | Formatação de moeda, números e datas |
| `shared_preferences` | ^2.5.3 | Persistência local no `SharedPreferencesAdapter` |
| `equatable` | ^2.0.7 | Comparação de objetos por valor (re-exportado) |
| `collection` | ^1.19.1 | Utilitários de coleção (re-exportado) |

> `equatable`, `intl` e `collection` são re-exportados pelo barrel principal, dispensando import separado nos consumidores do SDK.

---

## Testes

```bash
# Rodar todos os testes
flutter test

# Com cobertura
flutter test --coverage
```
