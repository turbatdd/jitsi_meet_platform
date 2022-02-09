import 'dart:async';

import 'package:flutter/services.dart';
import 'package:jitsi_meet_platform/jitsi_meet_listener.dart';
import 'package:jitsi_meet_platform/jitsi_meet_main.dart';
import 'package:jitsi_meet_platform/jitsi_meet_options.dart';
import 'package:jitsi_meet_platform/jitsi_meet_response.dart';
import 'package:jitsi_meet_platform/jitsi_constraints.dart';

class JitsiMeetPlatform {
  static bool _hasInitialized = false;

  static Future<String?> get checkWorking async {
    return "working platform";
  }

  static final Map<JistiRoomNameConstraintType, RoomNameConstraint>
      defaultRoomNameConstraints = {
    JistiRoomNameConstraintType.minLength: RoomNameConstraint((value) {
      return value.trim().length >= 3;
    }, "Minimum room length is 3"),
    JistiRoomNameConstraintType.allowedChars: RoomNameConstraint((value) {
      return RegExp(r"^[a-zA-Z0-9-_]+$", caseSensitive: false, multiLine: false)
          .hasMatch(value);
    }, "Only alphanumeric, dash, and underscore chars allowed"),
  };

  /// Joins a meeting based on the JitsiMeetOptions passed in.
  /// A JitsiMeetListener can be attached to this meeting that will automatically
  /// be removed when the meeting has ended
  static Future<JitsiMeetResponse> joinMeeting(JitsiMeetOptions options,
      {JitsiMeetListener? listener,
      Map<JistiRoomNameConstraintType, RoomNameConstraint>?
          roomNameConstraints}) async {
    assert(options.room.trim().isNotEmpty, "room is empty");

    // If no constraints given, take default ones
    // (To avoid using constraint, just give an empty Map)
    if (roomNameConstraints == null) {
      roomNameConstraints = defaultRoomNameConstraints;
    }

    // Check each constraint, if it exist
    // (To avoid using constraint, just give an empty Map)
    if (roomNameConstraints.isNotEmpty) {
      for (RoomNameConstraint constraint in roomNameConstraints.values) {
        assert(
            constraint.checkConstraint(options.room), constraint.getMessage());
      }
    }

    // Validate serverURL is absolute if it is not null or empty
    if (options.serverURL?.isNotEmpty ?? false) {
      assert(Uri.parse(options.serverURL!).isAbsolute,
          "URL must be of the format <scheme>://<host>[/path], like https://someHost.com");
    }

    return await JitsiMeetMain.instance
        .joinMeeting(options, listener: listener);
  }

  /// Initializes the event channel. Call when listeners are added
  static _initialize() {
    if (!_hasInitialized) {
      JitsiMeetMain.instance.initialize();
      _hasInitialized = true;
    }
  }

  static closeMeeting() => JitsiMeetMain.instance.closeMeeting();

  /// Adds a JitsiMeetListener that will broadcast conference events
  static addListener(JitsiMeetListener JitsiMeetListener) {
    JitsiMeetMain.instance.addListener(JitsiMeetListener);
    _initialize();
  }

  /// Removes the JitsiMeetListener specified
  static removeListener(JitsiMeetListener JitsiMeetListener) {
    JitsiMeetMain.instance.removeListener(JitsiMeetListener);
  }

  /// Removes all JitsiMeetListeners
  static removeAllListeners() {
    JitsiMeetMain.instance.removeAllListeners();
  }

  /// allow execute a command over a Jitsi live session (only for web)
  static executeCommand(String command, List<String> args) {
    JitsiMeetMain.instance.executeCommand(command, args);
  }
}
