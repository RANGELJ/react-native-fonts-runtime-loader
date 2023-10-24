#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(FontsRuntimeLoader, NSObject)

RCT_EXTERN_METHOD(loadFontFromFilePath:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
