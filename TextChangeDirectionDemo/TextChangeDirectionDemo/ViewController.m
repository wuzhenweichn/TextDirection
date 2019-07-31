//
//  ViewController.m
//  TextChangeDirectionDemo
//
//  Created by 硕方 on 7/31/19.
//  Copyright © 2019 zwwuchn. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Extension.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark- 文字朝上(默认状态)
- (void)textDirectionUp{
   _shapeLayer = [_contentLabel.text animateOnView:_contentLabel atRect:_contentLabel.bounds forFont:_contentLabel.font withColor:_contentLabel.textColor andDuration:0.0 andWithIsNeedAnimation:false andDirection:TransformLayerDirectionUp];
    [_contentLabel.layer addSublayer:_shapeLayer];
}


#pragma mark- 文字朝左
- (void)textDirectionLeft{
    _shapeLayer = [_contentLabel.text animateOnView:_contentLabel atRect:_contentLabel.bounds forFont:_contentLabel.font withColor:_contentLabel.textColor andDuration:0.0 andWithIsNeedAnimation:false andDirection:TransformLayerDirectionLeft];
    [_contentLabel.layer addSublayer:_shapeLayer];
}

#pragma mark- 文字朝右
- (void)textDirectionDown{
    _shapeLayer = [_contentLabel.text animateOnView:_contentLabel atRect:_contentLabel.bounds forFont:_contentLabel.font withColor:_contentLabel.textColor andDuration:0.0 andWithIsNeedAnimation:false andDirection:TransformLayerDirectionRight];
    [_contentLabel.layer addSublayer:_shapeLayer];
}


#pragma mark- 文字朝右
- (void)textDirectionRight{
    _shapeLayer = [_contentLabel.text animateOnView:_contentLabel atRect:_contentLabel.bounds forFont:_contentLabel.font withColor:_contentLabel.textColor andDuration:0.0 andWithIsNeedAnimation:false andDirection:TransformLayerDirectionDown];
    [_contentLabel.layer addSublayer:_shapeLayer];
}



- (UILabel *)contentLabel{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.text = @"输入的内容";
        _contentLabel.font = [UIFont systemFontOfSize:20];
        _contentLabel.textColor = UIColor.blackColor;
    }
    return _contentLabel;
}
@end
