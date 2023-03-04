import 'package:commons_tools_sdk/src/preferences/preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  test('Testing get int', () async {
    const value = 1;
    SharedPreferences.setMockInitialValues({'value': value});

    final preferencesAdapter = SharedPreferencesAdapter();

    final savedValue = await preferencesAdapter.getInt('value');

    expect(savedValue, value);
  });

  test('Testing get int with wrong key', () async {
    const value = 1;
    SharedPreferences.setMockInitialValues({'value': value});

    final preferencesAdapter = SharedPreferencesAdapter();

    final savedValue = await preferencesAdapter.getInt('value2');

    expect(savedValue, null);
  });

  test('Testing get string', () async {
    const value = 'teste';
    SharedPreferences.setMockInitialValues({'value': value});

    final preferencesAdapter = SharedPreferencesAdapter();

    final savedValue = await preferencesAdapter.getString('value');

    expect(savedValue, value);
  });

  test('Testing get boll', () async {
    const value = true;
    SharedPreferences.setMockInitialValues({'value': value});

    final preferencesAdapter = SharedPreferencesAdapter();

    final savedValue = await preferencesAdapter.getBool('value');

    expect(savedValue, value);
  });

  test('Testing get string with wrong key', () async {
    const value = 'teste';
    SharedPreferences.setMockInitialValues({'value': value});

    final preferencesAdapter = SharedPreferencesAdapter();

    final savedValue = await preferencesAdapter.getInt('value2');

    expect(savedValue, null);
  });

  test('Testing set int', () async {
    const key = 'key';
    const value = 1;

    SharedPreferences.setMockInitialValues({});
    final preferencesAdapter = SharedPreferencesAdapter();

    int? savedValue = await preferencesAdapter.getInt(key);
    expect(savedValue, null);

    final saveValue = await preferencesAdapter.setInt(key, value);
    savedValue = await preferencesAdapter.getInt(key);

    expect(saveValue, true);
    expect(savedValue, value);
  });

  test('Testing set string', () async {
    const key = 'key';
    const value = 'value';

    SharedPreferences.setMockInitialValues({});
    final preferencesAdapter = SharedPreferencesAdapter();

    String? savedValue = await preferencesAdapter.getString(key);
    expect(savedValue, null);

    final saveValue = await preferencesAdapter.setString(key, value);
    savedValue = await preferencesAdapter.getString(key);

    expect(saveValue, true);
    expect(savedValue, value);
  });

  test('Testing set bool', () async {
    const key = 'key';
    const value = true;

    SharedPreferences.setMockInitialValues({});
    final preferencesAdapter = SharedPreferencesAdapter();

    bool? savedValue = await preferencesAdapter.getBool(key);
    expect(savedValue, null);

    final saveValue = await preferencesAdapter.setBool(key, value);
    savedValue = await preferencesAdapter.getBool(key);

    expect(saveValue, true);
    expect(savedValue, value);
  });

  test('Testing remove key', () async {
    const key = 'key';
    const value = 'value';

    SharedPreferences.setMockInitialValues({key: value});
    final preferencesAdapter = SharedPreferencesAdapter();

    String? savedValue = await preferencesAdapter.getString(key);
    expect(savedValue, value);

    final removed = await preferencesAdapter.removeKey(key);
    savedValue = await preferencesAdapter.getString(key);

    expect(removed, true);
    expect(savedValue, null);
  });

  test('Testing get keys', () async {
    const key1 = 'key';
    const key2 = 'key2';

    SharedPreferences.setMockInitialValues({key1: 'value', key2: 1});
    final preferencesAdapter = SharedPreferencesAdapter();

    final keys = await preferencesAdapter.getKeys();

    expect(keys.length, 2);
    expect(keys[0], key1);
    expect(keys[1], key2);
  });

  test('Testing clear preferences', () async {
    SharedPreferences.setMockInitialValues({'key': 'value', 'key2': 1});
    final preferencesAdapter = SharedPreferencesAdapter();

    List keys = await preferencesAdapter.getKeys();
    expect(keys.length, 2);

    final cleared = await preferencesAdapter.clear();
    keys = await preferencesAdapter.getKeys();

    expect(cleared, true);
    expect(keys.isEmpty, true);
  });
}
