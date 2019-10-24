#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(Detector, NSObject)


RCT_EXTERN_METHOD(detect:(NSString *) filePath
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
@end
