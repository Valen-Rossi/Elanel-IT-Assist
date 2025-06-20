import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        // colorSchemeSeed: const Color(0xff027cf1),
        colorScheme: ColorScheme.fromSeed(
          surface: const Color.fromARGB(255, 230, 230, 230),
          onInverseSurface: const Color.fromARGB(255, 238, 238, 238),
          primary: const Color(0xff418bff),
          seedColor: const Color(0xff418bff),
        )
      );

  ThemeData getDarkTheme() => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff027cf1),
          // primary: const Color(0xFF2A96EE),
          brightness: Brightness.dark,
        ),
      );
}
// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:flutter/material.dart';

// class AppTheme {
//   static const Color _seedColor = Color(0xff027cf1);

//   ThemeData getTheme() {
//     return FlexThemeData.light(
//       scheme: FlexScheme.shadBlue, // o usá `FlexScheme.material`
//       // primary: _seedColor,
//       useMaterial3: true,
//       surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
//       blendLevel: 5,
//       subThemesData: const FlexSubThemesData(
//         blendOnLevel: 20,
//         blendOnColors: true,
//         elevatedButtonSchemeColor: SchemeColor.primary,
//       ),
//     );
//   }

//   ThemeData getDarkTheme() {
//     return FlexThemeData.dark(
//       scheme: FlexScheme.shadBlue,
//       // primary: _seedColor,
//       useMaterial3: true,
//       surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
//       blendLevel: 5,
//       subThemesData: const FlexSubThemesData(
//         blendOnLevel: 30,
//         blendOnColors: true,
//         elevatedButtonSchemeColor: SchemeColor.primary,
//       ),
//     );
//   }
// }
