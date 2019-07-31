//
//  NSString+Extension.h
//  TextChangeDirectionDemo
//
//  Created by zwwuchn on 7/31/17.
//  Copyright © 2019 zwwuchn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIBezierPath+TextPath.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

/**
 文本改变方向

 @param aView 文本的控件
 @param aRect 控件的尺寸
 @param aFont 文字的字号
 @param aColor 文字的颜色
 @param aDuration 动画持续时间
 @param needAnimation 是否需要动画
 @param directionStr 文字显示的方向
 @return layer
 */
- (CAShapeLayer *)animateOnView:(UIView *)aView atRect:(CGRect)aRect forFont:(UIFont *)aFont withColor:(UIColor *)aColor andDuration:(CGFloat)aDuration andWithIsNeedAnimation:(BOOL)needAnimation andDirection:(TransformLayerDirectionType)directionStr;
@end

NS_ASSUME_NONNULL_END
