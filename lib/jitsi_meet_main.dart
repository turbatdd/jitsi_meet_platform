import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:jitsi_meet_platform/jitsi_meet_channel.dart';
import 'package:jitsi_meet_platform/jitsi_meet_listener.dart';
import 'package:jitsi_meet_platform/jitsi_meet_options.dart';
import 'package:jitsi_meet_platform/jitsi_meet_response.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class JitsiMeetMain extends PlatformInterface {
  /// Constructs a JitsiMeetPlatform.
  JitsiMeetMain() : super(token: _token);

  static final Object _token = Object();

  static JitsiMeetMain _instance = MethodChannelJitsiMeet();

  /// The default instance of [JitsiMeetPlatform] to use.
  ///
  /// Defaults to [MethodChannelJitsiMeet].
  static JitsiMeetMain get instance => _instance;

  static set instance(JitsiMeetMain instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Joins a meeting based on the JitsiMeetingOptions passed in.
  /// A JitsiMeetingListener can be attached to this meeting that
  /// will automatically be removed when the meeting has ended
  Future<JitsiMeetResponse> joinMeeting(JitsiMeetOptions options,
      {JitsiMeetListener? listener}) async {
    throw UnimplementedError('joinMeeting has not been implemented.');
  }

  closeMeeting() {
    throw UnimplementedError('joinMeeting has not been implemented.');
  }

  /// Adds a JitsiMeetingListener that will broadcast conference events
  addListener(JitsiMeetListener jitsiMeetingListener) {
    throw UnimplementedError('addListener has not been implemented.');
  }

  /// remove JitsiListener
  removeListener(JitsiMeetListener jitsiMeetingListener) {
    throw UnimplementedError('removeListener has not been implemented.');
  }

  /// Removes all JitsiMeetingListeners
  removeAllListeners() {
    throw UnimplementedError('removeAllListeners has not been implemented.');
  }

  void initialize() {
    throw UnimplementedError('_initialize has not been implemented.');
  }

  /// execute command interface, use only in web
  void executeCommand(String command, List<String> args) {
    throw UnimplementedError('executeCommand has not been implemented.');
  }

  /// buildView
  /// Method added to support Web plugin, the main purpose is return a <div>
  /// to contain the conferencing screen when start
  /// additionally extra JS can be added usin `extraJS` argument
  /// for mobile is not need because the conferecing view get all device screen
  Widget buildView(List<String> extraJS) {
    throw UnimplementedError('_buildView has not been implemented.');
  }
}
