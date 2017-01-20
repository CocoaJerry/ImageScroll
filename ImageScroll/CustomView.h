//
//  CustomView.h
//  ImageScroll
//
//  Created by jerry on 17/1/20.
//  Copyright © 2017年 jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIControl

@property (nonatomic,assign) NSInteger location;

-(void)doLeftAnimation:(CGFloat)time;

-(void)doRightAnimation:(CGFloat)time;

@end
