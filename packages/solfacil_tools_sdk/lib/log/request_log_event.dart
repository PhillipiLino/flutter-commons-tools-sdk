import 'package:logger/logger.dart';

typedef LogEventCallback = bool Function(RequestLogEvent event);

class RequestLogEvent {
  final String url;
  final dynamic data;
  final String? method;
  final Map<String, dynamic>? headers;
  final String? contentType;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? response;
  final int? statusCode;
  final Exception? exception;
  final Level level;

  RequestLogEvent({
    required this.url,
    this.data,
    this.method,
    this.headers,
    this.contentType,
    this.queryParameters,
    this.response,
    this.statusCode,
    this.exception,
    this.level = Level.debug,
  });

  Map<String, dynamic> toJson() => {
        'url': url,
        'data': data,
        'method': method,
        'headers': headers,
        'contentType': contentType,
        'queryParameters': queryParameters,
        'response': response,
        'statusCode': statusCode,
        'exception': exception.toString(),
      };

  @override
  String toString() => '---- EVENT INFORMATIONS ----'
      '\nurl: $url'
      '\ndata: $data'
      '\nmethod: $method'
      '\nheaders: $headers'
      '\ncontentType: $contentType'
      '\nqueryParameters: $queryParameters'
      '\nstatusCode: $statusCode'
      '\nexception: $exception'
      '\nresponse: $response';
}
