#import "FlutterpluginwangfeiPlugin.h"
#if __has_include(<flutterpluginwangfei/flutterpluginwangfei-Swift.h>)
#import <flutterpluginwangfei/flutterpluginwangfei-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutterpluginwangfei-Swift.h"
#endif

@implementation FlutterpluginwangfeiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterpluginwangfeiPlugin registerWithRegistrar:registrar];
}
@end
