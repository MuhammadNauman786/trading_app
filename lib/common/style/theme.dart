import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common.dart';

class AppTheme {
  static ThemeData baseTheme = _createTheme();

  static _createTheme() {
    var baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        brightness: Brightness.light,
        surface: AppColors.scaffoldColor,
        error: Colors.red,
        onSurface: AppColors.scaffoldColor,
        onError: Colors.red,
        onPrimary: AppColors.primaryColor,
        onSecondary: AppColors.secondaryColor,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(Colors.white),
        fillColor: WidgetStateColor.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryColor;
            }
            return AppColors.checkBoxBorderColor;
          },
        ),
        side: const BorderSide(
          color: AppColors.checkBoxBorderColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
      radioTheme: RadioThemeData(
        overlayColor: WidgetStateProperty.all(Colors.white),
        fillColor: WidgetStateColor.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryColor;
            }
            return AppColors.checkBoxBorderColor.withOpacity(0.4);
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarTextStyle: GoogleFonts.jost(
          fontSize: 18.sp,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        titleTextStyle: GoogleFonts.jost(
          fontSize: 18.sp,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.jost(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        bodyMedium: GoogleFonts.jost(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
        ),
      ),
      dividerColor: AppColors.textFieldBorderColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.secondaryColor,
        extendedTextStyle: GoogleFonts.jost(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicator: const BoxDecoration(
          color: AppColors.primaryColor,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.primaryColor,
        labelStyle: GoogleFonts.jost(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.jost(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      indicatorColor: const Color(0xff1e4899),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.textGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.textGreyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.textGreyColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.textGreyColor),
        ),
        constraints: BoxConstraints(
          minHeight: 56.h,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.appBarBorderColor
      )
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.jostTextTheme(baseTheme.textTheme),
    );
  }

}
