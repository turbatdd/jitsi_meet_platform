import 'dart:async';
import 'package:flutter/services.dart';
import 'package:jitsi_meet_platform/jitsi_listener.dart';
import 'package:jitsi_meet_platform/jitsi_options.dart';
import 'package:jitsi_meet_platform/jitsi_response.dart';

class JitsiMeetPlatform {
  static const MethodChannel _channel =
      MethodChannel('turbat/jitsi_meet_platform', JSONMethodCodec());

  // static Future<JitsiResponse> joinMeeting(JitsiOptions options,
  //     {JitsiListener? listener,
  //     Map<RoomNameConstraintType, RoomNameConstraint>?
  //         roomNameConstraints}) async {
  //   return await JitsiMeetPlatform.instance
  //       .joinMeeting(options, listener: listener);
  // }

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
