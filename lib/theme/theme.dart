import 'package:visanka/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static  ThemeData Theme(){
    return ThemeData(
      fontFamily:'Roboto',
      appBarTheme: const AppBarTheme(
        iconTheme:IconThemeData(

          color: AppColor.secondary
        ),
        elevation: 5,
      ),
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.white,
      highlightColor: AppColor.primary,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.getFont(
            'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.secondary
        ),
        displayMedium: GoogleFonts.getFont(
            'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.black
        ),
        displaySmall: GoogleFonts.getFont(
            'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColor.black
        ),
        titleLarge: GoogleFonts.getFont(
            'Roboto',
            fontSize: 18,
            color: AppColor.black
        ),
        titleMedium: GoogleFonts.getFont(
            'Roboto',
            fontSize: 16,
            color: AppColor.black.withOpacity(0.4)
        ),
        titleSmall: GoogleFonts.getFont(
            'Roboto',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColor.black
        ),
        bodyLarge:GoogleFonts.getFont(
            'Roboto',
            fontSize: 14,
            color: AppColor.white
        ),
        bodyMedium: GoogleFonts.getFont(
            'Roboto',
            fontSize: 15,
            color: AppColor.secondary
        ),  bodySmall: GoogleFonts.getFont(
          'Roboto',
          fontSize: 12,
          color: AppColor.black.withOpacity(0.4)
      ),
      ),
      iconTheme: const IconThemeData(color:AppColor.black ),
        colorScheme:  ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primary,
      onPrimary: AppColor.primary,
      secondary: AppColor.secondary,
      onSecondary: AppColor.secondary,
      surface: AppColor.white,
      onSurface: AppColor.white,
      error: AppColor.error,
      onError: AppColor.error,
      background: AppColor.white,
      onBackground: AppColor.black,
      brightness: Brightness.light,
    ),
    );
  }
}
