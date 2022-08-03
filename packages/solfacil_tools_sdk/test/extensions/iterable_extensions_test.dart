import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/extensions/iterable_extensions.dart';

main() {
  test('Group maps by key', () {
    // Given
    final list = [
      {'20/12/2021': 3},
      {'20/11/2021': 4},
      {'20/12/2021': 3},
      {'20/12/2021': 5},
      {'20/10/2021': 6},
      {'20/10/2021': 7},
      {'20/10/2021': 8},
      {'20/12/2021': 3},
      {'20/12/2021': 32},
      {'20/11/2021': 3},
      {'20/12/2021': 23},
    ];

    // When
    final Map<String, List> groupedList =
        list.groupBy((element) => element.keys.first);

    // Then
    expect(groupedList, isA<Map>());
    expect(groupedList.length, 3);
    expect(groupedList['20/12/2021']?.length, 6);
    expect(groupedList['20/11/2021']?.length, 2);
    expect(groupedList['20/10/2021']?.length, 3);
  });
}
