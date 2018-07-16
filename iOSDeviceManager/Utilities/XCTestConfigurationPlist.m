
#import "XCTestConfigurationPlist.h"
#import <XCTestBootstrap/XCTestBootstrap.h>

@implementation XCTestConfigurationPlist

+ (NSString *)plistWithXCTestInstallPath:(NSString *)testInstallPath
                        AUTInstalledPath:(NSString *)autInstalledPath
                     AUTBundleIdentifier:(NSString *)autBundleIdentifier
                     runnerInstalledPath:(NSString *)runnerInstalledPath
                  runnerBundleIdentifier:(NSString *)runnerBundleIdentifier
                       sessionIdentifier:(NSString *)uuid{
    NSString *plist = [XCTestConfigurationPlist plist];
    plist = [plist stringByReplacingOccurrencesOfString:@"TEST_BUNDLE_URL"
                                             withString:
                                            [NSString stringWithFormat:@"file://%@", testInstallPath]];
    plist = [plist stringByReplacingOccurrencesOfString:@"AUT_INSTALLED_PATH"
                                             withString:autInstalledPath];
    plist = [plist stringByReplacingOccurrencesOfString:@"AUT_BUNDLE_IDENTIFIER"
                                             withString:autBundleIdentifier];
    plist = [plist stringByReplacingOccurrencesOfString:@"RUNNER_INSTALLED_PATH"
                                             withString:runnerInstalledPath];
    plist = [plist stringByReplacingOccurrencesOfString:@"RUNNER_BUNDLE_IDENTIFIER"
                                             withString:runnerBundleIdentifier];
    uuid_t bytes;
    [[[NSUUID alloc] initWithUUIDString:uuid] getUUIDBytes:bytes];
    NSString *base64EncodedSessionIdentifier = [[NSData dataWithBytes:bytes length:16]
                                                base64EncodedStringWithOptions:kNilOptions];
    plist = [plist stringByReplacingOccurrencesOfString:@"SESSION_IDENTIFIER"
                                             withString:base64EncodedSessionIdentifier];

    return plist;
}

+ (NSString *)plist {
    return @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
        "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n"
        "<plist version=\"1.0\">\n"
        "<dict>\n"
        "   <key>$archiver</key>\n"
        "   <string>NSKeyedArchiver</string>\n"
        "   <key>$objects</key>\n"
        "   <array>\n"
        "       <string>$null</string>\n"
        "       <dict>\n"
        "           <key>$class</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>23</integer>\n"
        "           </dict>\n"
        "           <key>aggregateStatisticsBeforeCrash</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>18</integer>\n"
        "           </dict>\n"
        "           <key>automationFrameworkPath</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>22</integer>\n"
        "           </dict>\n"
        "           <key>baselineFileRelativePath</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>0</integer>\n"
        "           </dict>\n"
        "           <key>baselineFileURL</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>0</integer>\n"
        "           </dict>\n"
        "           <key>disablePerformanceMetrics</key>\n"
        "           <false/>\n"
        "           <key>emitOSLogs</key>\n"
        "           <false/>\n"
        "           <key>gatherLocalizableStringsData</key>\n"
        "           <false/>\n"
        "           <key>initializeForUITesting</key>\n"
        "           <true/>\n"
        "           <key>pathToXcodeReportingSocket</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>0</integer>\n"
        "           </dict>\n"
        "           <key>productModuleName</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>17</integer>\n"
        "           </dict>\n"
        "           <key>reportActivities</key>\n"
        "           <true/>\n"
        "           <key>reportResultsToIDE</key>\n"
        "           <true/>\n"
        "           <key>sessionIdentifier</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>7</integer>\n"
        "           </dict>\n"
        "           <key>systemAttachmentLifetime</key>\n"
        "           <integer>1</integer>\n"
        "           <key>targetApplicationArguments</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>5</integer>\n"
        "           </dict>\n"
        "           <key>targetApplicationBundleID</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>10</integer>\n"
        "           </dict>\n"
        "           <key>targetApplicationEnvironment</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>0</integer>\n"
        "           </dict>\n"
        "           <key>targetApplicationPath</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>9</integer>\n"
        "           </dict>\n"
        "           <key>testApplicationDependencies</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>11</integer>\n"
        "           </dict>\n"
        "           <key>testApplicationUserOverrides</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>0</integer>\n"
        "           </dict>\n"
        "           <key>testBundleRelativePath</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>0</integer>\n"
        "           </dict>\n"
        "           <key>testBundleURL</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>2</integer>\n"
        "           </dict>\n"
        "           <key>testsMustRunOnMainThread</key>\n"
        "           <true/>\n"
        "           <key>testsToRun</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>0</integer>\n"
        "           </dict>\n"
        "           <key>testsToSkip</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>0</integer>\n"
        "           </dict>\n"
        "           <key>treatMissingBaselinesAsFailures</key>\n"
        "           <false/>\n"
        "           <key>userAttachmentLifetime</key>\n"
        "           <integer>1</integer>\n"
        "       </dict>\n"
        "       <dict>\n"
        "           <key>$class</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>4</integer>\n"
        "           </dict>\n"
        "           <key>NS.base</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>0</integer>\n"
        "           </dict>\n"
        "           <key>NS.relative</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>3</integer>\n"
        "           </dict>\n"
        "       </dict>\n"
        "       <string>TEST_BUNDLE_URL</string>\n"
        "       <dict>\n"
        "           <key>$classes</key>\n"
        "           <array>\n"
        "               <string>NSURL</string>\n"
        "               <string>NSObject</string>\n"
        "           </array>\n"
        "           <key>$classname</key>\n"
        "           <string>NSURL</string>\n"
        "       </dict>\n"
        "       <dict>\n"
        "           <key>$class</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>6</integer>\n"
        "           </dict>\n"
        "           <key>NS.objects</key>\n"
        "           <array/>\n"
        "       </dict>\n"
        "       <dict>\n"
        "           <key>$classes</key>\n"
        "           <array>\n"
        "               <string>NSArray</string>\n"
        "               <string>NSObject</string>\n"
        "           </array>\n"
        "           <key>$classname</key>\n"
        "           <string>NSArray</string>\n"
        "       </dict>\n"
        "       <dict>\n"
        "           <key>$class</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>8</integer>\n"
        "           </dict>\n"
        "           <key>NS.uuidbytes</key>\n"
        "           <data>SESSION_IDENTIFIER</data>\n"
        "       </dict>\n"
        "       <dict>\n"
        "           <key>$classes</key>\n"
        "           <array>\n"
        "               <string>NSUUID</string>\n"
        "               <string>NSObject</string>\n"
        "           </array>\n"
        "           <key>$classname</key>\n"
        "           <string>NSUUID</string>\n"
        "       </dict>\n"
        "       <string>AUT_INSTALLED_PATH</string>\n"
        "       <string>AUT_BUNDLE_IDENTIFIER</string>\n"
        "       <dict>\n"
        "           <key>$class</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>16</integer>\n"
        "           </dict>\n"
        "           <key>NS.keys</key>\n"
        "           <array>\n"
        "               <dict>\n"
        "                   <key>CF$UID</key>\n"
        "                   <integer>12</integer>\n"
        "               </dict>\n"
        "               <dict>\n"
        "                   <key>CF$UID</key>\n"
        "                   <integer>13</integer>\n"
        "               </dict>\n"
        "           </array>\n"
        "           <key>NS.objects</key>\n"
        "           <array>\n"
        "               <dict>\n"
        "                   <key>CF$UID</key>\n"
        "                   <integer>14</integer>\n"
        "               </dict>\n"
        "               <dict>\n"
        "                   <key>CF$UID</key>\n"
        "                   <integer>15</integer>\n"
        "               </dict>\n"
        "           </array>\n"
        "       </dict>\n"
        "       <string>RUNNER_BUNDLE_IDENTIFIER</string>\n"
        "       <string>AUT_BUNDLE_IDENTIFIER</string>\n"
        "       <string>RUNNER_INSTALLED_PATH</string>\n"
        "       <string>AUT_INSTALLED_PATH</string>\n"
        "       <dict>\n"
        "           <key>$classes</key>\n"
        "           <array>\n"
        "               <string>NSDictionary</string>\n"
        "               <string>NSObject</string>\n"
        "           </array>\n"
        "           <key>$classname</key>\n"
        "           <string>NSDictionary</string>\n"
        "       </dict>\n"
        "       <string>UITests</string>\n"
        "       <dict>\n"
        "           <key>$class</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>16</integer>\n"
        "           </dict>\n"
        "           <key>NS.keys</key>\n"
        "           <array>\n"
        "               <dict>\n"
        "                   <key>CF$UID</key>\n"
        "                   <integer>19</integer>\n"
        "               </dict>\n"
        "           </array>\n"
        "           <key>NS.objects</key>\n"
        "           <array>\n"
        "               <dict>\n"
        "                   <key>CF$UID</key>\n"
        "                   <integer>20</integer>\n"
        "               </dict>\n"
        "           </array>\n"
        "       </dict>\n"
        "       <string>XCSuiteRecordsKey</string>\n"
        "       <dict>\n"
        "           <key>$class</key>\n"
        "           <dict>\n"
        "               <key>CF$UID</key>\n"
        "               <integer>21</integer>\n"
        "           </dict>\n"
        "           <key>NS.keys</key>\n"
        "           <array/>\n"
        "           <key>NS.objects</key>\n"
        "           <array/>\n"
        "       </dict>\n"
        "       <dict>\n"
        "           <key>$classes</key>\n"
        "           <array>\n"
        "               <string>NSMutableDictionary</string>\n"
        "               <string>NSDictionary</string>\n"
        "               <string>NSObject</string>\n"
        "           </array>\n"
        "           <key>$classname</key>\n"
        "           <string>NSMutableDictionary</string>\n"
        "       </dict>\n"
        "       <string>/Developer/Library/PrivateFrameworks/XCTAutomationSupport.framework</string>\n"
        "       <dict>\n"
        "           <key>$classes</key>\n"
        "           <array>\n"
        "               <string>XCTestConfiguration</string>\n"
        "               <string>NSObject</string>\n"
        "           </array>\n"
        "           <key>$classname</key>\n"
        "           <string>XCTestConfiguration</string>\n"
        "       </dict>\n"
        "   </array>\n"
        "   <key>$top</key>\n"
        "   <dict>\n"
        "       <key>root</key>\n"
        "       <dict>\n"
        "           <key>CF$UID</key>\n"
        "           <integer>1</integer>\n"
        "       </dict>\n"
        "   </dict>\n"
        "   <key>$version</key>\n"
        "   <integer>100000</integer>\n"
        "</dict>\n"
        "</plist>\n";
}

@end
