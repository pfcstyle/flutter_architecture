
import 'package:flutter/material.dart';
import 'package:flutter_architecture/shared/responsive_adaptive/screen_size_type.dart';
import 'package:flutter_architecture/shared/services/window_size_service/providers/window_size_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_size_type_provider.g.dart';

@riverpod
ScreenSizeType screenSizeType(ScreenSizeTypeRef ref) {
  Size windowSize = ref.watch(windowSizeNotifierProvider);
  return getScreenSizeTypeBySize(windowSize) ;
}