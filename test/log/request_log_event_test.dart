import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:solfacil_tools_sdk/src/log/logger.dart';

main() {
  test('Create event using main constructor', () {
    // Given
    const url = 'Url_to_test';
    const data = 34;
    const statusCode = 10;
    const method = 'GET';
    final Map<String, dynamic> headers = {};
    const contentType = 'contentType';
    final Map<String, dynamic> queryParameters = {};
    final Map<String, dynamic> response = {};
    const exception = null;
    const level = Level.error;

    // When
    final event = RequestLogEvent(
      url: url,
      data: data,
      method: method,
      headers: headers,
      contentType: contentType,
      queryParameters: queryParameters,
      response: response,
      exception: exception,
      level: level,
      statusCode: statusCode,
    );

    final expectedJson = {
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

    final expectedString = '---- EVENT INFORMATIONS ----'
        '\nurl: $url'
        '\ndata: $data'
        '\nmethod: $method'
        '\nheaders: $headers'
        '\ncontentType: $contentType'
        '\nqueryParameters: $queryParameters'
        '\nstatusCode: $statusCode'
        '\nexception: $exception'
        '\nresponse: $response';

    // Then
    expect(event.url, url);
    expect(event.method, method);
    expect(event.data, data);
    expect(event.headers, headers);
    expect(event.contentType, contentType);
    expect(event.queryParameters, queryParameters);
    expect(event.response, response);
    expect(event.statusCode, statusCode);
    expect(event.exception, exception);
    expect(event.level, Level.error);
    expect(event.toJson(), expectedJson);
    expect(event.toString(), expectedString);
  });
}
