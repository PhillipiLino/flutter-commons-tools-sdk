part of solfacil_tools_sdk;

typedef LogEventCallback = bool Function(RequestLogEvent event);

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
  final LogType logType;

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
    this.logType = LogType.info,
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
