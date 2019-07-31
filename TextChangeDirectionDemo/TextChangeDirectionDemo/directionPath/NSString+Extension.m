//
//  NSString+Extension.m
//  TextChangeDirectionDemo
//
//  Created by zwwuchn on 7/31/17.
//  Copyright © 2019 zwwuchn. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (CAShapeLayer *)animateOnView:(UIView *)aView atRect:(CGRect)aRect forFont:(UIFont *)aFont withColor:(UIColor *)aColor andDuration:(CGFloat)aDuration andWithIsNeedAnimation:(BOOL)needAnimation andDirection:(TransformLayerDirectionType)directionStr
{
    // 创建文字路径
    UIBezierPath *path;
    path = [UIBezierPath bezierPathWithText:self font:aFont andWithDirection:directionStr];
    
    // 创建路径图层
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = aRect;
    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    pathLayer.geometryFlipped = NO;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [aColor CGColor];
    pathLayer.fillColor = [aColor CGColor];
    pathLayer.lineWidth = 1.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    [aView.layer addSublayer:pathLayer];
    
    BOOL isAnimation = needAnimation ? YES : NO;
    #pragma mark- 如何需要动画效果 可根据需求添加
    if (isAnimation) {
        // 创建画笔图层
        UIImage *penImage = [UIImage imageNamed:@"yourSelf pencil.png"];
        CALayer *penLayer = [CALayer layer];
        penLayer.contents = (id)penImage.CGImage;
        penLayer.anchorPoint = CGPointMake(0, 1);
        penLayer.frame = CGRectMake(0.0f, 0.0f, penImage.size.width, penImage.size.height);
        [pathLayer addSublayer:penLayer];
        
        // 绘图动画
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];// strokeStart 是擦除效果
        pathAnimation.duration = aDuration;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        pathAnimation.removedOnCompletion = YES;
        [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
        // 画笔动画
        CAKeyframeAnimation *penAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        penAnimation.duration = aDuration;
        penAnimation.path = path.CGPath;
        penAnimation.calculationMode = kCAAnimationPaced;
        penAnimation.removedOnCompletion = YES;
        [penLayer addAnimation:penAnimation forKey:@"position"];
    }
    return pathLayer;
}
@end
