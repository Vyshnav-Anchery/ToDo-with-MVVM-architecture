import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightCustomTheme = FlexThemeData.light(
  scheme: FlexScheme.deepOrangeM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 3,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 3,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
  ),
  tones: FlexTones.material(Brightness.light).onMainsUseBW().onSurfacesUseBW().surfacesUseBW(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
);
  static ThemeData darkCustomTheme = FlexThemeData.dark(
    scheme: FlexScheme.outerSpace,
    appBarElevation: 1,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
  );

  static Color todoDarkColor=FlexColor.outerSpaceDarkPrimary;
  static Color todoLightColor=FlexColor.rosewoodDarkPrimaryVariant;
}
