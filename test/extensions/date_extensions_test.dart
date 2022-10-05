import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:solfacil_tools_sdk/extensions/date_extensions.dart';

main() {
  test('Date format parse string with success', () {
    // Arrange
    final dateFormat = DateFormat('dd/MM/yyyy');
    const date = '12/01/2022';

    // Act
    final parsedDate = dateFormat.tryParse(date);

    // Assert
    expect(parsedDate, DateTime(2022, 01, 12));
  });

  test('Date format parse string when fail return null', () {
    // Arrange
    final dateFormat = DateFormat('dd/MM/yyyy');
    const date = '12-01-2022';

    // Act
    final parsedDate = dateFormat.tryParse(date);

    // Assert
    expect(parsedDate, null);
  });
}
