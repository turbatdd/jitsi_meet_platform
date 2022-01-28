/// JitsiMeetingListener
/// Class holding the callback functions for conference events
class JitsiListener {
  final Function(Map<dynamic, dynamic> message)? onConferenceWillJoin;
  final Function(Map<dynamic, dynamic> message)? onConferenceJoined;
  final Function(Map<dynamic, dynamic> message)? onConferenceTerminated;
  final Function(Map<dynamic, dynamic> message)? onParticipantJoined;
  final Function(Map<dynamic, dynamic> message)? onParticipantLeft;
  final Function(Map<dynamic, dynamic> message)? onAudioMutedChanged;
  final Function(Map<dynamic, dynamic> message)? onVideoMutedChanged;
  final Function(Map<dynamic, dynamic> message)? onEndpointTextMessageReceived;
  final Function(Map<dynamic, dynamic> message)? onScreenShareToggled;
  final Function(Map<dynamic, dynamic> message)? onChatMessageReceived;
  final Function(Map<dynamic, dynamic> message)? onChatToggled;
  final Function(Map<dynamic, dynamic> message)? onReadyToClose;
  final Function(Map<dynamic, dynamic> message)? onEnterPictureInPicture;
  final Function(Map<dynamic, dynamic> message)?
      onEnterPictureInPictureTerminated;
  final Function(dynamic error)? onError;

  final List<JitsiGenericListener>? genericListeners;

  JitsiListener(
      {this.onConferenceWillJoin,
      this.onConferenceJoined,
      this.onConferenceTerminated,
      this.onParticipantJoined,
      this.onParticipantLeft,
      this.onAudioMutedChanged,
      this.onVideoMutedChanged,
      this.onEndpointTextMessageReceived,
      this.onScreenShareToggled,
      this.onChatMessageReceived,
      this.onChatToggled,
      this.onReadyToClose,
      this.onEnterPictureInPicture,
      this.onEnterPictureInPictureTerminated,
      this.onError,
      this.genericListeners});
}

/// Generic listener
class JitsiGenericListener {
  final String eventName;
  final Function(dynamic message) callback;

  JitsiGenericListener({required this.eventName, required this.callback});
}
