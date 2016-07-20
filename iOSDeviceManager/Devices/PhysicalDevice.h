
@import Foundation;
#import <XCTestBootstrap/XCTestBootstrap.h>
#import "Device.h"

@interface PhysicalDevice : Device<FBTestManagerTestReporter, FBControlCoreLogger>
+ (iOSReturnStatusCode)stopSimulatingLocation:(NSString *)deviceID;
@end
