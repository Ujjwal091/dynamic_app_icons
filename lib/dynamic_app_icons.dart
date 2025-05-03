
import 'dynamic_app_icons_platform_interface.dart';

class DynamicAppIcons {
  Future<String?> getPlatformVersion() {
    return DynamicAppIconsPlatform.instance.getPlatformVersion();
  }
}
