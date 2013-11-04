#import <SenTestingKit/SenTestingKit.h>
#import <KIF/KIF.h>

@interface ISInteractiveEdgesNavigationBarTests : SenTestCase

@end

@implementation ISInteractiveEdgesNavigationBarTests

- (void)testTapLeftEdgeOfLeftBarButtonItem
{
    [tester waitForTappableViewWithAccessibilityLabel:@"L"];
    [tester tapScreenAtPoint:CGPointMake(1.f, 40.f)];
    [tester waitForViewWithAccessibilityLabel:@"the sender is left button."];
    [tester tapViewWithAccessibilityLabel:@"OK"];
}

- (void)testTapRightEdgeOfLeftBarButtonItem
{
    [tester waitForTappableViewWithAccessibilityLabel:@"L"];
    [tester tapScreenAtPoint:CGPointMake(49.f, 40.f)];
    [tester waitForViewWithAccessibilityLabel:@"the sender is left button."];
    [tester tapViewWithAccessibilityLabel:@"OK"];
}

- (void)testTapLeftEdgeOfRightBarButtonItem
{
    [tester waitForTappableViewWithAccessibilityLabel:@"R"];
    [tester tapScreenAtPoint:CGPointMake(271.f, 40.f)];
    [tester waitForViewWithAccessibilityLabel:@"the sender is right button."];
    [tester tapViewWithAccessibilityLabel:@"OK"];
}

- (void)testTapRightEdgeOfRightBarButtonItem
{
    [tester waitForTappableViewWithAccessibilityLabel:@"R"];
    [tester tapScreenAtPoint:CGPointMake(319.f, 40.f)];
    [tester waitForViewWithAccessibilityLabel:@"the sender is right button."];
    [tester tapViewWithAccessibilityLabel:@"OK"];
}

@end
