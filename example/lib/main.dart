import 'dart:async';

import 'package:dynamic_app_icons/dynamic_app_icons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> changeAppIcon(String? iconName) async {
    try {
      await DynamicAppIcons.setIcon(
        allAliasNames: ['MainActivity', 'alternate'],
        iconName: iconName,
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => changeAppIcon("alternate"),
                child: Text("Set Icon: Alternate"),
              ),
              ElevatedButton(
                onPressed: () => changeAppIcon(null),
                child: Text("Reset to Default"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
