//
//  ViewController.m
//  ImageScroll
//
//  Created by jerry on 17/1/19.
//  Copyright © 2017年 jerry. All rights reserved.
//

#import "ViewController.h"
#import "ScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    ScrollView *scroll = [[ScrollView alloc] initWithFrame:CGRectMake(0, 150, WIDTH, 200)];
    scroll.colorArray = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor purpleColor], [UIColor blackColor], [UIColor cyanColor], [UIColor brownColor], [UIColor magentaColor], nil];
    [self.view addSubview:scroll];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
