import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_size_provider.g.dart';

@riverpod
class WindowSizeNotifier extends _$WindowSizeNotifier{
  @override
  Size build(){
    return Size.zero;
  }

  void changeSize(Size size){
    state = size;
  }
}

class WindowSizeObserver extends WidgetsBindingObserver {
  final WidgetRef ref;

  WindowSizeObserver(this.ref);

  @override
  void didChangeMetrics() {
    final Size newSize = MediaQuery.of(ref.context).size;
    ref.read(windowSizeNotifierProvider.notifier).changeSize(newSize);
  }
}
