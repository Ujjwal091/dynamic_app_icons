import 'package:dynamic_app_icons/dynamic_app_icons_platform_interface.dart';

class DynamicAppIcons {
  /// Switch to a specific icon by name.
  /// Pass `null` to reset to default.
  static Future<void> setIcon(String? iconName) async {
    return DynamicAppIconsPlatform.instance.setIcon(iconName);
  }
}
