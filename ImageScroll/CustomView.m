//
//  CustomView.m
//  ImageScroll
//
//  Created by jerry on 17/1/20.
//  Copyright © 2017年 jerry. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)doLeftAnimation:(CGFloat)time{
    if (self.location == 1) {
        [UIView animateWithDuration:time/4 animations:^{
            self.left = -self.width;
        } completion:^(BOOL finished) {
            self.left = WIDTH+self.width*3/4;
            [UIView animateWithDuration:time*3/4 animations:^{
                self.left = WIDTH-self.width*1/4;
            } completion:^(BOOL finished) {
                self.location = 5;
            }];
        }];
    }else if (self.location == 2) {
        [UIView animateWithDuration:time animations:^{
            self.left = -self.width*3/4;
        } completion:^(BOOL finished) {
            self.location = 1;
        }];
    }else if (self.location == 3) {
        CGFloat y = self.center.y;
        [UIView animateWithDuration:time animations:^{
            self.width = self.width*2/3;
            self.height = self.height*2/3;
            self.left = self.width/2;
            self.center = CGPointMake(self.left+self.width/2, y);
        } completion:^(BOOL finished) {
            self.location = 2;
        }];
    }else if (self.location == 4) {
        [UIView animateWithDuration:time animations:^{
            self.width = self.width*3/2;
            self.height = self.height*3/2;
            self.center = CGPointMake(self.superview.width/2, self.superview.height/2);
        } completion:^(BOOL finished) {
            self.location = 3;
        }];
    }else {
        [UIView animateWithDuration:time animations:^{
            self.left = self.superview.center.x+self.width;
        } completion:^(BOOL finished) {
            self.location = 4;
        }];
    }
}

-(void)doRightAnimation:(CGFloat)time{
    if (self.location == 5) {
        [UIView animateWithDuration:time/4 animations:^{
            self.left = WIDTH;
        } completion:^(BOOL finished) {
            self.right = -self.width*3/4;
            [UIView animateWithDuration:time*3/4 animations:^{
                self.left = -self.width*3/4;
            } completion:^(BOOL finished) {
                self.location = 1;
            }];
        }];
    }else if (self.location == 4) {
        [UIView animateWithDuration:time animations:^{
            self.left = WIDTH-self.width*1/4;
        } completion:^(BOOL finished) {
            self.location = 5;
        }];
    }else if (self.location == 3) {
        CGFloat y = self.center.y;
        [UIView animateWithDuration:time animations:^{
            self.width = self.width*2/3;
            self.height = self.height*2/3;
            self.left = self.superview.center.x + self.width;
            self.center = CGPointMake(self.left+self.width/2, y);
        } completion:^(BOOL finished) {
            self.location = 4;
        }];
    }else if (self.location == 2) {
        [UIView animateWithDuration:time animations:^{
            self.width = self.width*3/2;
            self.height = self.height*3/2;
            self.center = CGPointMake(self.superview.width/2, self.superview.height/2);
        } completion:^(BOOL finished) {
            self.location = 3;
        }];
    }else if (self.location == 1) {
        [UIView animateWithDuration:time animations:^{
            self.left = self.width/2;
        } completion:^(BOOL finished) {
            self.location = 2;
        }];
    }
}

@end
