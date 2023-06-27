import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silver/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList);

final themeProvider = StateNotifierProvider<ThemeController, AppTheme>(
    (ref) => ThemeController());

class ThemeController extends StateNotifier<AppTheme> {
  ThemeController() : super(AppTheme());

  void changeDarkMode() {
    state = state.copyWith(isDark: !state.isDark);
  }

  void changeColors(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
