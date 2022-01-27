#import "JitsiMeetPlatformPlugin.h"
#if __has_include(<jitsi_meet_platform/jitsi_meet_platform-Swift.h>)
#import <jitsi_meet_platform/jitsi_meet_platform-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "jitsi_meet_platform-Swift.h"
#endif

@implementation JitsiMeetPlatformPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftJitsiMeetPlatformPlugin registerWithRegistrar:registrar];
}
@end
