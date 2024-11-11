import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:random_str_picker/app_bottom_navigation_bar.dart';
import 'package:random_str_picker/model/str_model.dart';
import 'package:random_str_picker/repository/str_repository.dart';
import 'package:random_str_picker/router.dart';
import 'package:random_str_picker/view_model/current_bottom_index_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPref = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPref),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> widgets = [
      ref.watch(sharedPrefStrRepositoryProvider).maybeWhen(orElse: () {
        return const CircularProgressIndicator();
      }, data: (data) {
        return data.strings.isNotEmpty
            ? ListView.builder(
                itemCount: data.strings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data.strings[index].str),
                    subtitle: Text("Picked: ${data.strings[index].pickedAt}"),
                  );
                },
              )
            : const Center(
                child: Text('No strings found'),
              );
      }),
      const Picker(),
      const EditPage(),
    ];
    return Scaffold(
      body: widgets[ref.watch(currentBottomIndexViewmodelProvider)],
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}

class EditPage extends ConsumerWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ref.watch(sharedPrefStrRepositoryProvider).maybeWhen(
            orElse: () => const CircularProgressIndicator(),
            data: (data) {
              return Flexible(
                child: data.strings.isNotEmpty
                    ? ListView.builder(
                        itemCount: data.strings.length + 1,
                        itemBuilder: (context, index) {
                          if (index == data.strings.length) {
                            return TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Add string',
                              ),
                              onFieldSubmitted: (value) {
                                ref.read(sharedPrefStrRepositoryProvider.notifier).addString(StrModel(str: value));
                              },
                              autofocus: true,
                            );
                          }
                          return ListTile(
                            title: Text(data.strings[index].str),
                          );
                        },
                      )
                    : const Center(
                        child: Text('No strings found'),
                      ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        var textController = TextEditingController();
                        return AlertDialog(
                          title: const Text('Add string'),
                          content: TextField(controller: textController),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                ref.read(sharedPrefStrRepositoryProvider.notifier).addString(StrModel(str: textController.text));
                                Navigator.of(context).pop();
                              },
                              child: const Text('Add'),
                            ),
                          ],
                        );
                      });
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 60,
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(sharedPrefStrRepositoryProvider.notifier).clear();
                  },
                  child: const Icon(Icons.clear))
            ],
          ),
        ),
      ],
    );
  }
}

class Picker extends HookConsumerWidget {
  const Picker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picked = useState<String>('');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            picked.value.isEmpty ? "no picked" : picked.value,
            style: const TextStyle(fontSize: 50),
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint("Picking a random string");
                ref.read(sharedPrefStrRepositoryProvider).whenData((data) {
                  if (data.strings.isNotEmpty) {
                    Random random = Random();
                    picked.value = data.strings[random.nextInt(data.strings.length)].str;
                    ref.read(sharedPrefStrRepositoryProvider.notifier).pick(picked.value);
                  }
                });
              },
              child: const Icon(Icons.sync)),
        ],
      ),
    );
  }
}
