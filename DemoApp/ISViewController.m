#import "ISViewController.h"

@implementation ISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"<-   Tap Edges   ->";
    
    CGFloat offset = [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.f ? 16.f : 7.f;
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(-offset, 0.f, 50.f, 44.f)];
    leftButton.backgroundColor = [UIColor colorWithWhite:.3f alpha:1.f];
    [leftButton setTitle:@"L" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [leftButton addTarget:self
                   action:@selector(leftButtonAction)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIView *leftContainerView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 50.f, 44.f)];
    [leftContainerView addSubview:leftButton];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftContainerView];
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(offset, 0.f, 50.f, 44.f)];
    rightButton.backgroundColor = [UIColor colorWithWhite:.3f alpha:1.f];
    [rightButton setTitle:@"R" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [rightButton addTarget:self
                    action:@selector(rightButtonAction)
          forControlEvents:UIControlEventTouchUpInside];
    
    UIView *rightContainerView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 50.f, 44.f)];
    [rightContainerView addSubview:rightButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightContainerView];
}

- (void)leftButtonAction
{
    [self alertWithMessage:@"the sender is left button."];
}

- (void)rightButtonAction
{
    [self alertWithMessage:@"the sender is right button."];
}

- (void)alertWithMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.title = @"Touched";
    alertView.message = message;
    [alertView addButtonWithTitle:@"OK"];
    [alertView show];
}

@end
