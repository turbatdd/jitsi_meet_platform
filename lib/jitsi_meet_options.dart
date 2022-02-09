import 'dart:collection';

import 'package:jitsi_meet_platform/jitsi_constraints.dart';

class JitsiMeetOptions {
  JitsiMeetOptions({
    required this.room,
  });

  final String room;
  String? serverURL;
  String? subject;
  String? token;
  bool? audioMuted;
  bool? audioOnly;
  bool? videoMuted;
  String? userDisplayName;
  String? userEmail;
  String? iosAppBarRGBAColor;
  String? userAvatarURL;

  Map<String, dynamic>? webOptions; // options for web

  Map<JitsiFeatureEnum, bool> featureFlags = HashMap();

  /// Get feature flags Map with keys as String instead of Enum
  /// Useful as an argument sent to the Kotlin/Swift code
  Map<String?, bool> getFeatureFlags() {
    Map<String?, bool> featureFlagsWithStrings = HashMap();

    featureFlags.forEach((key, value) {
      featureFlagsWithStrings[JitsiFeatureHelper.featureEnumList[key]] = value;
    });

    return featureFlagsWithStrings;
  }

  @override
  String toString() {
    return 'JitsiMeetOptions{room: $room, serverURL: $serverURL, '
        'subject: $subject, token: $token, audioMuted: $audioMuted, '
        'audioOnly: $audioOnly, videoMuted: $videoMuted, '
        'userDisplayName: $userDisplayName, userEmail: $userEmail, '
        'iosAppBarRGBAColor :$iosAppBarRGBAColor, featureFlags: $featureFlags }';
  }

/* Not used yet, needs more research
  Bundle colorScheme;
  String userAvatarURL;
*/

}
