#import <XCTest/XCTest.h>
#import "ISInteractiveEdgesNavigationBar.h"

@interface ISInteractiveEdgesNavigationBarTests : XCTestCase {
    ISInteractiveEdgesNavigationBar *navigationBar;
    UINavigationItem *item;
}

@end

@implementation ISInteractiveEdgesNavigationBarTests

- (void)setUp
{
    [super setUp];
    
    item = [[UINavigationItem alloc] init];
    navigationBar = [[ISInteractiveEdgesNavigationBar alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, 44.f)];
    navigationBar.items = @[item];
}

- (void)tearDown
{
    navigationBar = nil;
    
    [super tearDown];
}

#pragma mark -

- (void)setLeftBarButtonItem
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(-11.f, 0.f, 61.f, 44.f)];
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 50.f, 44.f)];
    [containerView addSubview:button];
    
    item.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:containerView];
}

@end
