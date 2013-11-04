#import "ISAppDelegate.h"
#import "ISViewController.h"
#import "ISInteractiveEdgesNavigationBar.h"

@implementation ISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ISViewController *viewController = [[ISViewController alloc] init];
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithNavigationBarClass:[ISInteractiveEdgesNavigationBar class]
                                                  toolbarClass:[UIToolbar class]];
    
    navigationController.viewControllers = @[viewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
