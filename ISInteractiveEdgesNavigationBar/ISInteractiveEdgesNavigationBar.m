#import "ISInteractiveEdgesNavigationBar.h"

@implementation ISInteractiveEdgesNavigationBar

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    for (UIBarButtonItem *barButtonItem in @[self.topItem.leftBarButtonItem, self.topItem.rightBarButtonItem]) {
        for (UIView *subview in barButtonItem.customView.subviews) {
            CGRect convertedRect = [self convertRect:subview.frame fromView:barButtonItem.customView];
            BOOL isTouchable = subview.userInteractionEnabled && !subview.isHidden && subview.alpha > 0.f;
            BOOL containsPoint = CGRectContainsPoint(convertedRect, point);
            if (isTouchable && containsPoint) {
                CGPoint convertedPoint = [self convertPoint:point toView:subview];
                return [subview hitTest:convertedPoint withEvent:event];
            }
        }
    }
    return [super hitTest:point withEvent:event];
}

@end
