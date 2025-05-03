import Flutter
import UIKit

public class DynamicAppIconsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "dynamic_app_icons", binaryMessenger: registrar.messenger())
        let instance = DynamicAppIconsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "setIcon":
            guard let args = call.arguments as? [String: Any] else {
                result(
                    FlutterError(
                        code: "INVALID_ARGUMENT", message: "Missing or invalid arguments",
                        details: nil))
                return
            }

            let iconNameRaw = args["iconName"]
            let iconName = iconNameRaw is NSNull ? nil : iconNameRaw as? String

            if UIApplication.shared.supportsAlternateIcons {
                UIApplication.shared.setAlternateIconName(iconName) { error in
                    if let error = error {
                        result(
                            FlutterError(
                                code: "ICON_CHANGE_FAILED", message: error.localizedDescription,
                                details: nil))
                    } else {
                        result(nil)
                    }
                }
            } else {
                result(
                    FlutterError(
                        code: "NOT_SUPPORTED",
                        message: "Alternate icons not supported on this device", details: nil))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
