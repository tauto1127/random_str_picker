import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_str_picker/view_model/current_bottom_index_viewmodel.dart';

class AppBottomNavigationBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "一覧"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "picker"),
        BottomNavigationBarItem(icon: Icon(Icons.edit), label: "編集")
      ],
      selectedItemColor: Colors.blue,
      currentIndex: ref.watch(currentBottomIndexViewmodelProvider),
      onTap: (index) {
        switch (index) {
          case 0:
            ref.read(currentBottomIndexViewmodelProvider.notifier).changeIndex(0);
            break;
          case 1:
            ref.read(currentBottomIndexViewmodelProvider.notifier).changeIndex(1);
            break;
          case 2:
            ref.read(currentBottomIndexViewmodelProvider.notifier).changeIndex(2);
            break;
        }
      },
    );
  }
}
