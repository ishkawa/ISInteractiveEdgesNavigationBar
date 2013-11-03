#import "ISInteractiveEdgesNavigationBar.h"

@implementation ISInteractiveEdgesNavigationBar

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *leftView = self.topItem.leftBarButtonItem.customView;
    if ([self shouldPassEventAtPoint:point toView:leftView]) {
        return leftView;
    }
    
    UIView *rightView = self.topItem.rightBarButtonItem.customView;
    if ([self shouldPassEventAtPoint:point toView:rightView]) {
        return rightView;
    }
    
    return [super hitTest:point withEvent:event];
}

- (BOOL)shouldPassEventAtPoint:(CGPoint)point toView:(UIView *)view
{
    if (!view || view.isHidden || !view.userInteractionEnabled || view.alpha == 0.f) {
        return NO;
    }
    
    BOOL containsPoint = NO;
    for (UIView *subview in [view.subviews arrayByAddingObject:view]) {
        CGRect convertedFrame = [subview convertRect:subview.frame toView:view];
        if (CGRectContainsPoint(convertedFrame, point)) {
            containsPoint = YES;
            break;
        }
    }
    
    return containsPoint;
}

@end
