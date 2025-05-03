import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dynamic_app_icons_method_channel.dart';

abstract class DynamicAppIconsPlatform extends PlatformInterface {
  /// Constructs a DynamicAppIconsPlatform.
  DynamicAppIconsPlatform() : super(token: _token);

  static final Object _token = Object();

  static DynamicAppIconsPlatform _instance = MethodChannelDynamicAppIcons();

  /// The default instance of [DynamicAppIconsPlatform] to use.
  ///
  /// Defaults to [MethodChannelDynamicAppIcons].
  static DynamicAppIconsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DynamicAppIconsPlatform] when
  /// they register themselves.
  static set instance(DynamicAppIconsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
