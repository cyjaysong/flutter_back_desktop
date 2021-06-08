import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterBackDesktop {
  static const String _methodChannelName = "android_back_desktop/methodChannel";
  static const MethodChannel _channel = const MethodChannel(_methodChannelName);

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> backToDesktop() async {
    bool result = false;
    if (Platform.isAndroid)
      result = await _channel.invokeMethod<bool>('backToDesktop') ?? false;
    return result;
  }
}
