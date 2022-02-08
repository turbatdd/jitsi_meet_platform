import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jitsi_meet_platform/jitsi_meet_platform.dart';

void main() {
  const MethodChannel channel = MethodChannel('jitsi_meet_platform');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await JitsiMeetPlatform.platformVersion, '42');
  });
}
