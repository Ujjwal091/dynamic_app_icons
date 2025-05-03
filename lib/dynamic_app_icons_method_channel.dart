import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dynamic_app_icons_platform_interface.dart';

/// An implementation of [DynamicAppIconsPlatform] that uses method channels.
class MethodChannelDynamicAppIcons extends DynamicAppIconsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dynamic_app_icons');

  @override
  Future<void> setIcon(String? iconName) async{
    try {
      await methodChannel.invokeMethod('setIcon', {'iconName': iconName});
    } on PlatformException catch (e) {
      debugPrint("PlatformException (iOS/Android): ${e.message}");
      rethrow;
    } catch (e) {
      debugPrint("Unknown error in setIcon: $e");
      rethrow;
    }
  }
}
