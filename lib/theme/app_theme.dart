import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _background = Color(0xFF0B1120);
  static const Color _surface = Color(0xFF151F33);
  static const Color _primary = Color(0xFF8B7CFF);
  static const Color _secondary = Color(0xFF35D6A2);

  static ThemeData get darkTheme {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: _primary,
      brightness: Brightness.dark,
    ).copyWith(primary: _primary, secondary: _secondary, surface: _surface);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: _background,
      appBarTheme: const AppBarThemeData(
        backgroundColor: _background,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: _surface,
        elevation: 2,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: _surface,
        indicatorColor: _primary.withValues(alpha: 0.2),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (Set<WidgetState> states) => TextStyle(
            fontSize: 12,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w700
                : FontWeight.w500,
          ),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: _background,
        indicatorColor: _primary.withValues(alpha: 0.2),
        selectedIconTheme: const IconThemeData(color: _primary),
        unselectedIconTheme: IconThemeData(
          color: Colors.white.withValues(alpha: 0.65),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withValues(alpha: 0.08),
        thickness: 1,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: _surface,
        side: BorderSide(color: _primary.withValues(alpha: 0.28)),
        labelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
