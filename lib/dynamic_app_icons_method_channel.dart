import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dynamic_app_icons_platform_interface.dart';

/// An implementation of [DynamicAppIconsPlatform] that uses method channels.
class MethodChannelDynamicAppIcons extends DynamicAppIconsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dynamic_app_icons');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
