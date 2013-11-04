#import "ISInteractiveEdgesNavigationBar.h"

@implementation ISInteractiveEdgesNavigationBar

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSMutableArray *barButtonItems = [NSMutableArray array];
    if (self.topItem.leftBarButtonItem) {
        [barButtonItems addObject:self.topItem.leftBarButtonItem];
    }
    if (self.topItem.rightBarButtonItem) {
        [barButtonItems addObject:self.topItem.rightBarButtonItem];
    }
    
    for (UIBarButtonItem *barButtonItem in barButtonItems) {
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
