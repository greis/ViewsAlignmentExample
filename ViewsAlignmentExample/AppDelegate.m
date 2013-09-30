#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  RootViewController *controller = [[RootViewController alloc] init];
  [self.window setRootViewController:controller];
  
  [self.window makeKeyAndVisible];
  return YES;
}

@end
