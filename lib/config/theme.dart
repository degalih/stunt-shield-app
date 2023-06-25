import 'package:nylo_framework/nylo_framework.dart';

import '/resources/themes/dark_theme.dart';
import '/resources/themes/light_theme.dart';
import '/resources/themes/styles/color_styles.dart';

/*
|--------------------------------------------------------------------------
| Themes
| Manage your Flutter application's themes.
|
| Learn more: https://nylo.dev/docs/5.x/themes
|--------------------------------------------------------------------------
*/

// App Themes
final List<BaseThemeConfig<ColorStyles>> appThemes = [
  ThemeConfig.light(),
  ThemeConfig.dark(),
];

/*
|--------------------------------------------------------------------------
| Colors
|--------------------------------------------------------------------------
*/

ColorStyles color = ColorStyles();

/*
|--------------------------------------------------------------------------
| Themes
|--------------------------------------------------------------------------
*/

// Preset Themes
class ThemeConfig {
  // LIGHT
  static BaseThemeConfig<ColorStyles> light() => BaseThemeConfig<ColorStyles>(
        id: getEnv('LIGHT_THEME_ID'),
        description: "Light theme",
        theme: lightTheme(color),
        colors: color,
      );

  // DARK
  static BaseThemeConfig<ColorStyles> dark() => BaseThemeConfig<ColorStyles>(
        id: getEnv('DARK_THEME_ID'),
        description: "Dark theme",
        theme: darkTheme(color),
        colors: color,
      );
}
