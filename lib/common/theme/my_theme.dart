import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'material_color_generator.dart';
part 'my_typography.dart';

class MyTheme {
  Color white = const Color(0xFFFFFFFF);

  Color black = const Color(0xFF1F1F1F);

  Color grey = const Color(0xFFD9D9D9);

  Color orange = const Color.fromARGB(255, 200, 135, 67);

  Color green = const Color.fromARGB(255, 82, 202, 84);

  Color darkGrey = const Color(0xFF66696D);

  Color yellow = const Color.fromARGB(255, 201, 184, 1);

  Color colorIndicator = const Color(0xFF6abff7);

  List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 3),
    ),
  ];

  Gradient mainGradientColor = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF3B5C87),
      Color(0xFFddeede),
    ],
  );

  MaterialColor primarySwatch = _generateMaterialColor(
    const Color(0xFFbae6fd),
  );

  MaterialColor secondarySwatch =
      _generateMaterialColor(const Color(0xFFddeede));

  MyTypography typographyRegular = MyTypography(
    headingLarge:
        GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 48),
    headingMedium:
        GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 32),
    headingSmall:
        GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 24),
    bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 18),
    bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16),
    bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14),
    bodyExtraSmall:
        GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12),
  );

  MyTypography typographyLight = MyTypography(
    headingLarge:
        GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 48),
    headingMedium:
        GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 32),
    headingSmall:
        GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 24),
    bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 18),
    bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 16),
    bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 14),
    bodyExtraSmall:
        GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: 12),
  );

  MyTypography typographyBold = MyTypography(
    headingLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 48,
    ),
    headingMedium:
        GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 32),
    heading18: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
    heading16: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
    heading12: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12),
    heading14: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
    heading20: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20),
    headingSmall:
        GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 24),
    bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18),
    bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
    bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14),
    bodyExtraSmall:
        GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12),
  );

  ThemeData buildLightTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: primarySwatch,
      scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBarTheme: AppBarTheme(
        backgroundColor: primarySwatch,
        foregroundColor: Colors.black,
        shadowColor: Colors.grey,
        elevation: 0,
        titleTextStyle: typographyBold.bodyLarge.copyWith(color: Colors.black),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }

  ThemeData buildDarkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: primarySwatch,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: primarySwatch,
        foregroundColor: Colors.white,
        shadowColor: Colors.grey[800],
        elevation: 0.5,
        titleTextStyle: typographyBold.bodyLarge.copyWith(color: Colors.white),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget loadingIndicator({Color? color, double? size}) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color ?? primarySwatch),
        strokeWidth: size ?? 4.0,
      ),
    );
  }
}
