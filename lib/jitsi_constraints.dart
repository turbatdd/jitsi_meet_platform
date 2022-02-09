enum JistiRoomNameConstraintType {
  minLength,
  maxLength,
  allowedChars,
  forbiddenChars
}

class JitsiFeatureHelper {
  static Map<JitsiFeatureEnum, String> featureEnumList = {
    JitsiFeatureEnum.addPeopleAllowed: 'add-people.enabled',
    JitsiFeatureEnum.calendarEnabled: 'calendar.enabled',
    JitsiFeatureEnum.callIntegrationEnabled: 'call-integration.enabled',
    JitsiFeatureEnum.closeCaptionsEnabled: 'close-captions.enabled',
    JitsiFeatureEnum.chatEnabled: 'chat.enabled',
    JitsiFeatureEnum.inviteEnabled: 'invite.enabled',
    JitsiFeatureEnum.iosRecordEnabled: 'ios.recording.enabled',
    JitsiFeatureEnum.liveStreamingEnabled: 'live-streaming.enabled',
    JitsiFeatureEnum.meetingNameEnabled: 'meeting-name.enabled',
    JitsiFeatureEnum.meetingPasswordEnabled: 'meeting-password.enabled',
    JitsiFeatureEnum.pipEnabled: 'pip.enabled',
    JitsiFeatureEnum.raiseHandEnabled: 'raise-hand.enabled',
    JitsiFeatureEnum.recordingEnabled: 'recording.enabled',
    JitsiFeatureEnum.titleViewEnabled: 'tile-view.enabled',
    JitsiFeatureEnum.toolboxAlwaysVisibile: 'toolbox.alwaysVisible',
    JitsiFeatureEnum.welcomePageEnabled: 'welcomepage.enabled',
  };
}

enum JitsiFeatureEnum {
  /// Flag indicating if add-people functionality should be enabled.
  /// Default: enabled (true).
  addPeopleAllowed,

  /// Flag indicating if calendar integration should be enabled.
  /// Default: enabled (true) on Android, auto-detected on iOS.
  calendarEnabled,

  /// Flag indicating if call integration (CallKit on iOS,
  /// ConnectionService on Android)
  /// should be enabled.
  /// Default: enabled (true).
  callIntegrationEnabled,

  /// Flag indicating if close captions should be enabled.
  /// Default: enabled (true).
  closeCaptionsEnabled,

  /// Flag indicating if chat should be enabled.
  /// Default: enabled (true).
  chatEnabled,

  /// Flag indicating if invite functionality should be enabled.
  /// Default: enabled (true).
  inviteEnabled,

  /// Flag indicating if recording should be enabled in iOS.
  /// Default: disabled (false).
  iosRecordEnabled,

  /// Flag indicating if live-streaming should be enabled.
  /// Default: auto-detected.
  liveStreamingEnabled,

  /// Flag indicating if displaying the meeting name should be enabled.
  /// Default: enabled (true).
  meetingNameEnabled,

  /// Flag indicating if the meeting password button should be enabled. Note
  /// that this flag just decides on the buttton, if a meeting has a password
  /// set, the password ddialog will still show up.
  /// Default: enabled (true).
  meetingPasswordEnabled,

  /// Flag indicating if Picture-in-Picture should be enabled.
  /// Default: auto-detected.
  pipEnabled,

  /// Flag indicating if raise hand feature should be enabled.
  /// Default: enabled.
  raiseHandEnabled,

  /// Flag indicating if recording should be enabled.
  /// Default: auto-detected.
  recordingEnabled,

  /// Flag indicating if tile view feature should be enabled.
  /// Default: enabled.
  titleViewEnabled,

  /// Flag indicating if the toolbox should be always be visible
  /// Default: disabled (false).
  toolboxAlwaysVisibile,

  /// Flag indicating if the welcome page should be enabled.
  /// Default: disabled (false).
  welcomePageEnabled,
}

class RoomNameConstraint {
  late Function(String) _checkFunction;
  String? _constraintMessage;

  RoomNameConstraint(Function(String) checkFunction, String constraintMessage) {
    _checkFunction = checkFunction;
    _constraintMessage = constraintMessage;
  }

  bool checkConstraint(String value) {
    return _checkFunction(value);
  }

  String? getMessage() {
    return _constraintMessage;
  }
}
