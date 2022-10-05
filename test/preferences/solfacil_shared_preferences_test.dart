import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solfacil_tools_sdk/preferences/solfacil_shared_preferences.dart';

main() {
  test('Testing get int', () async {
    const value = 1;
    SharedPreferences.setMockInitialValues({'value': value});

    final solfacilPreferences = SolfacilSharedPreferences();

    final savedValue = await solfacilPreferences.getInt('value');

    expect(savedValue, value);
  });

  test('Testing get int with wrong key', () async {
    const value = 1;
    SharedPreferences.setMockInitialValues({'value': value});

    final solfacilPreferences = SolfacilSharedPreferences();

    final savedValue = await solfacilPreferences.getInt('value2');

    expect(savedValue, null);
  });

  test('Testing get string', () async {
    const value = 'teste';
    SharedPreferences.setMockInitialValues({'value': value});

    final solfacilPreferences = SolfacilSharedPreferences();

    final savedValue = await solfacilPreferences.getString('value');

    expect(savedValue, value);
  });

  test('Testing get boll', () async {
    const value = true;
    SharedPreferences.setMockInitialValues({'value': value});

    final solfacilPreferences = SolfacilSharedPreferences();

    final savedValue = await solfacilPreferences.getBool('value');

    expect(savedValue, value);
  });

  test('Testing get string with wrong key', () async {
    const value = 'teste';
    SharedPreferences.setMockInitialValues({'value': value});

    final solfacilPreferences = SolfacilSharedPreferences();

    final savedValue = await solfacilPreferences.getInt('value2');

    expect(savedValue, null);
  });

  test('Testing set int', () async {
    const key = 'key';
    const value = 1;

    SharedPreferences.setMockInitialValues({});
    final solfacilPreferences = SolfacilSharedPreferences();

    int? savedValue = await solfacilPreferences.getInt(key);
    expect(savedValue, null);

    final saveValue = await solfacilPreferences.setInt(key, value);
    savedValue = await solfacilPreferences.getInt(key);

    expect(saveValue, true);
    expect(savedValue, value);
  });

  test('Testing set string', () async {
    const key = 'key';
    const value = 'value';

    SharedPreferences.setMockInitialValues({});
    final solfacilPreferences = SolfacilSharedPreferences();

    String? savedValue = await solfacilPreferences.getString(key);
    expect(savedValue, null);

    final saveValue = await solfacilPreferences.setString(key, value);
    savedValue = await solfacilPreferences.getString(key);

    expect(saveValue, true);
    expect(savedValue, value);
  });

  test('Testing set bool', () async {
    const key = 'key';
    const value = true;

    SharedPreferences.setMockInitialValues({});
    final solfacilPreferences = SolfacilSharedPreferences();

    bool? savedValue = await solfacilPreferences.getBool(key);
    expect(savedValue, null);

    final saveValue = await solfacilPreferences.setBool(key, value);
    savedValue = await solfacilPreferences.getBool(key);

    expect(saveValue, true);
    expect(savedValue, value);
  });

  test('Testing remove key', () async {
    const key = 'key';
    const value = 'value';

    SharedPreferences.setMockInitialValues({key: value});
    final solfacilPreferences = SolfacilSharedPreferences();

    String? savedValue = await solfacilPreferences.getString(key);
    expect(savedValue, value);

    final removed = await solfacilPreferences.removeKey(key);
    savedValue = await solfacilPreferences.getString(key);

    expect(removed, true);
    expect(savedValue, null);
  });

  test('Testing get keys', () async {
    const key1 = 'key';
    const key2 = 'key2';

    SharedPreferences.setMockInitialValues({key1: 'value', key2: 1});
    final solfacilPreferences = SolfacilSharedPreferences();

    final keys = await solfacilPreferences.getKeys();

    expect(keys.length, 2);
    expect(keys[0], key1);
    expect(keys[1], key2);
  });

  test('Testing clear preferences', () async {
    SharedPreferences.setMockInitialValues({'key': 'value', 'key2': 1});
    final solfacilPreferences = SolfacilSharedPreferences();

    List keys = await solfacilPreferences.getKeys();
    expect(keys.length, 2);

    final cleared = await solfacilPreferences.clear();
    keys = await solfacilPreferences.getKeys();

    expect(cleared, true);
    expect(keys.isEmpty, true);
  });
}
