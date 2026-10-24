import 'package:flutter/material.dart';

/// Farmloop's brand palette. Kept centralized so every screen pulls from
/// the same source rather than hardcoding colors -- matches the green used
/// throughout the project's planning documents.
abstract final class AppColors {
  static const primary = Color(0xFF2E5339);
  static const primaryLight = Color(0xFF4C7A5A);
  static const background = Color(0xFFF7F8F5);
  static const surface = Color(0xFFFFFFFF);
  static const urgent = Color(0xFFD64545);
  static const routine = Color(0xFF8A8F87);
  static const success = Color(0xFF2E8B57);
  static const textPrimary = Color(0xFF1C1F1D);
  static const textSecondary = Color(0xFF666B66);
}

class AppTheme {
  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      surface: AppColors.surface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        titleMedium: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        bodyMedium: TextStyle(color: AppColors.textSecondary),
      ),
    );
  }
}
