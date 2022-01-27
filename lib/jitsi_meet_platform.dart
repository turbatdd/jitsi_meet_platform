
import 'dart:async';

import 'package:flutter/services.dart';

class JitsiMeetPlatform {
  static const MethodChannel _channel = MethodChannel('jitsi_meet_platform');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
