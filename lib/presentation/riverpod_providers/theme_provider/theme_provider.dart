import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controller/theme_controller.dart';

final themeProvider =
    StateNotifierProvider<ThemeController, bool>((_) => ThemeController(false));
