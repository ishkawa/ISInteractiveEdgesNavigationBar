#import "ISInteractiveEdgesNavigationBar.h"

@implementation ISInteractiveEdgesNavigationBar

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSMutableArray *subviews = [NSMutableArray array];
    [subviews addObjectsFromArray:self.topItem.leftBarButtonItem.customView.subviews];
    [subviews addObjectsFromArray:self.topItem.rightBarButtonItem.customView.subviews];
    
    UIView *receiverView = nil;
    for (UIView *subview in subviews) {
        CGRect convertedRect = [self convertRect:subview.frame fromView:subview.superview];
        BOOL isTouchable = subview.userInteractionEnabled && !subview.isHidden && subview.alpha > 0.f;
        BOOL containsPoint = CGRectContainsPoint(convertedRect, point);
        if (isTouchable && containsPoint) {
            receiverView = subview;
            break;
        }
    }
    
    if (receiverView) {
        CGPoint convertedPoint = [self convertPoint:point toView:receiverView];
        return [receiverView hitTest:convertedPoint withEvent:event];
    }
    
    return [super hitTest:point withEvent:event];
}

@end
