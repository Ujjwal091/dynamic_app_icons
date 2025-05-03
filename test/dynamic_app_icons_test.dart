import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_app_icons/dynamic_app_icons.dart';
import 'package:dynamic_app_icons/dynamic_app_icons_platform_interface.dart';
import 'package:dynamic_app_icons/dynamic_app_icons_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDynamicAppIconsPlatform
    with MockPlatformInterfaceMixin
    implements DynamicAppIconsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DynamicAppIconsPlatform initialPlatform = DynamicAppIconsPlatform.instance;

  test('$MethodChannelDynamicAppIcons is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDynamicAppIcons>());
  });

  test('getPlatformVersion', () async {
    DynamicAppIcons dynamicAppIconsPlugin = DynamicAppIcons();
    MockDynamicAppIconsPlatform fakePlatform = MockDynamicAppIconsPlatform();
    DynamicAppIconsPlatform.instance = fakePlatform;

    expect(await dynamicAppIconsPlugin.getPlatformVersion(), '42');
  });
}
