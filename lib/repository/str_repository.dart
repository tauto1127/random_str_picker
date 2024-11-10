import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'str_repository.g.dart';

abstract class IStrRepository {
  Future<List<String>> getStrings();
  Future<void> addString(String string);
  Future<void> addStrings(List<String> strings);
  Future<void> removeString(String string);
}

@riverpod
Raw<Future<SharedPreferences>> sharedPreferences(ref) async {
  return await SharedPreferences.getInstance();
}

@riverpod
Raw<Future<IStrRepository>> strRepository(StrRepositoryRef ref) async {
  return SharedPrefStrRepository(await ref.read(sharedPreferencesProvider));
}

class SharedPrefStrRepository implements IStrRepository {
  final SharedPreferences _sharedPreferences;

  SharedPrefStrRepository(this._sharedPreferences);

  Future<List<String>> getStrings() async {
    return _sharedPreferences.getStringList('strings') ?? [];
  }

  Future<void> addString(String string) async {
    final strings = await getStrings();
    strings.add(string);
    await _sharedPreferences.setStringList('strings', strings);
  }

  Future<void> addStrings(List<String> strings) async {
    final currentStrings = await getStrings();
    currentStrings.addAll(strings);
    await _sharedPreferences.setStringList('strings', currentStrings);
  }

  Future<void> removeString(String string) async {
    final strings = await getStrings();
    strings.remove(string);
    await _sharedPreferences.setStringList('strings', strings);
  }
}
