//
//  ScrollView.m
//  ImageScroll
//
//  Created by jerry on 17/1/19.
//  Copyright © 2017年 jerry. All rights reserved.
//

#import "ScrollView.h"
#import "CustomView.h"

@implementation ScrollView {
    NSMutableArray *viewArray;
    CGFloat viewWidth;
    CGPoint currentSize;
}

-(void)setColorArray:(NSArray *)colorArray{
    _colorArray = colorArray;
    if (_colorArray.count >= 5) {
        [self loadViews];
    }
}

-(void)loadViews{
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    swipe1.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipe1];
    UISwipeGestureRecognizer *swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    swipe2.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:swipe2];
    viewArray = [[NSMutableArray alloc] init];
    viewWidth = self.bounds.size.width/5;
    CGFloat lastX = -viewWidth*3/4;
    for (int i = 0; i < 5; i++) {
        CustomView * control = [[CustomView alloc] initWithFrame:CGRectMake(lastX, self.height/2-viewWidth/2, viewWidth, viewWidth)];
        control.backgroundColor = _colorArray[i];
        control.location = i+1;
        if (i == 2) {
            control.frame = CGRectMake(self.width/2-viewWidth*3/4, self.height/2-viewWidth*3/4, viewWidth*3/2, viewWidth*3/2);
        }
        lastX = control.frame.origin.x+control.frame.size.width+viewWidth/4;
        [self addSubview:control];
        [viewArray addObject:control];
    }
    currentSize = CGPointMake(0, 4);
}

-(void)swipeGesture:(UISwipeGestureRecognizer *)swipe{
    _animationTime = _animationTime <= 0 ? 1 : _animationTime;
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        for (CustomView *view in viewArray) {
            [view doLeftAnimation:_animationTime];
        }
        currentSize = CGPointMake(((int)currentSize.x+1)%_colorArray.count, ((int)currentSize.y+1)%_colorArray.count);
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight){
        for (CustomView *view in viewArray) {
            [view doRightAnimation:_animationTime];
        }
        currentSize = CGPointMake(((int)currentSize.x-1)%_colorArray.count, ((int)currentSize.y-1)%_colorArray.count);
    }
    [self performSelector:@selector(changeSomeThing:) withObject:swipe afterDelay:_animationTime*3/4];
}

-(void)changeSomeThing:(UISwipeGestureRecognizer *)swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        for (CustomView *view in viewArray) {
            if (view.location == 1) {
                view.backgroundColor = _colorArray[(int)currentSize.y];
            }
        }
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight){
        for (CustomView *view in viewArray) {
            if (view.location == 5) {
                view.backgroundColor = _colorArray[(int)currentSize.x];
            }
        }
    }
}

-(void)dealloc{
    for (UIGestureRecognizer *ges in self.gestureRecognizers) {
        [self removeGestureRecognizer:ges];
    }
}

@end
