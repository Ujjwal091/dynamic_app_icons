package com.codecuddlers.dynamic_app_icons

import android.content.ComponentName
import android.content.Context
import android.content.pm.PackageManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DynamicAppIconsPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "dynamic_app_icons")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "setIcon") {
            val iconName = call.argument<String?>("iconName")
            val aliases = call.argument<List<String>>("allAliasNames") ?: emptyList()
            switchIcon(iconName, aliases, result)
        } else {
            result.notImplemented()
        }
    }

    private fun switchIcon(
        enabledComponentName: String?,
        allAliases: List<String>,
        result: MethodChannel.Result
    ) {
        try {
            val pm = context.packageManager
            val packageName = context.packageName
            val selected = if (enabledComponentName == null)
                "$packageName.MainActivity"
            else
                "$packageName.$enabledComponentName"

            for (alias in allAliases) {
                val component = ComponentName(packageName, "$packageName.$alias")
                val newState = if (component.className == selected)
                    PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                else
                    PackageManager.COMPONENT_ENABLED_STATE_DISABLED

                pm.setComponentEnabledSetting(
                    component,
                    newState,
                    PackageManager.DONT_KILL_APP
                )
            }

            result.success(null)
        } catch (e: Exception) {
            result.error("SWITCH_ERROR", "Failed to switch icon: ${e.localizedMessage}", null)
        }
    }
}
