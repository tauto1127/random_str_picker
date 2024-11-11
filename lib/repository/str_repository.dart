import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:random_str_picker/model/str_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'str_repository.g.dart';

abstract class IStrRepository {
  Future<List<StrModel>> getStrings();
  Future<void> addString(StrModel string);
  Future<void> addStrings(List<StrModel> strings);
  Future<void> removeString(String string);
  Future<void> pick(String name);
  Future<void> clear();
}

@immutable
class StrState {
  final List<StrModel> strings;

  const StrState(this.strings);
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(ref) => throw UnimplementedError();

@Riverpod(keepAlive: true)
class SharedPrefStrRepository extends _$SharedPrefStrRepository implements IStrRepository {
  final String sharedPrefKey = "strings";
  @override
  Future<StrState> build() async {
    return StrState(await getStrings());
  }

  Future<List<StrModel>> getStrings() async {
    var strs = ref.read(sharedPreferencesProvider).getStringList(sharedPrefKey) ?? [];
    List<StrModel> results = [];
    for (var element in strs) {
      results.add(StrModel.fromJson(jsonDecode(element)));
    }

    return results;
  }

  @override
  Future<void> addString(StrModel string) async {
    state.maybeWhen(
        orElse: () => throw Exception("state is orElse"),
        data: (data) {
          state = AsyncData(StrState([...data.strings, string]));
          fetch();
        });
  }

  @override
  Future<void> addStrings(List<StrModel> strings) {
    // TODO: implement addStrings
    throw UnimplementedError();
  }

  @override
  Future<void> removeString(String string) {
    // TODO: implement removeString
    throw UnimplementedError();
  }

  @override
  Future<void> pick(String name) async {
    state.maybeWhen(
        orElse: () => throw Exception("state is orElse"),
        data: (data) {
          var picked = data.strings.firstWhere((element) => element.str == name);
          picked = picked.copyWith(pickedAt: DateTime.now());
          state = AsyncData(StrState(data.strings.map((e) => e.str == name ? picked : e).toList()));
          fetch();
        });
  }

  Future<void> fetch() async {
    state.maybeWhen(
        orElse: () => throw Exception("state is orElse"),
        data: (data) {
          ref.read(sharedPreferencesProvider).setStringList(sharedPrefKey, data.strings.map((e) => jsonEncode(e.toJson())).toList());
        });
  }

  @override
  Future<void> clear() async {
    state = const AsyncData(StrState([]));
    fetch();
  }
}
