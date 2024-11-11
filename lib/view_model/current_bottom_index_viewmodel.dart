import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_bottom_index_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class CurrentBottomIndexViewmodel extends _$CurrentBottomIndexViewmodel {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
