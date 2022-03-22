#import "FlutterVideoPlayerPlugin.h"
#if __has_include(<flutter_video_player/flutter_video_player-Swift.h>)
#import <flutter_video_player/flutter_video_player-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_video_player-Swift.h"
#endif

@implementation FlutterVideoPlayerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterVideoPlayerPlugin registerWithRegistrar:registrar];
}
@end
