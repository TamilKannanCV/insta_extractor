#import "InstaExtractorPlugin.h"
#if __has_include(<insta_extractor/insta_extractor-Swift.h>)
#import <insta_extractor/insta_extractor-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "insta_extractor-Swift.h"
#endif

@implementation InstaExtractorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInstaExtractorPlugin registerWithRegistrar:registrar];
}
@end
