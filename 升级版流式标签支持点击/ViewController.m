//
//  ViewController.m
//  升级版流式标签支持点击
//
//  Created by 张国兵 on 15/8/16.
//  Copyright (c) 2015年 zhangguobing. All rights reserved.
//

#import "ViewController.h"
#import "GBTagListView.h"
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface ViewController (){
    
        NSArray*strArray;//保存标签数据的数组
        GBTagListView*_tempTag;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    strArray=@[@"大好人",@"自定义流式标签",@"github",@"code4app",@"已婚",@"阳光开朗",@"慷慨大方帅气身材好",@"仗义",@"值得一交的朋友",@"值得一交的朋友",@"值得的交",@"值得一交的朋友",@"值得一交的朋友",@"大好人",@"自定义流式标签",@"github",@"code4app",@"已婚"];
    
    GBTagListView *tagList=[[GBTagListView alloc]initWithFrame:CGRectMake(0, 80, ScreenWidth, 0)];
    /**允许点击 */
    tagList.canTouch=YES;
    /**可以控制允许点击的标签数 */
    tagList.canTouchNum=5;
    /**控制是否是单选模式 */
    tagList.isSingleSelect=YES;
    tagList.signalTagColor=[UIColor whiteColor];
    [tagList setTagWithTagArray:strArray];
    __weak __typeof(self)weakSelf = self;
    [tagList setDidselectItemBlock:^(NSArray *arr) {
        NSLog(@"选中的标签%@",arr);
        [_tempTag removeFromSuperview];
        GBTagListView*selectItems=[[GBTagListView alloc]initWithFrame:CGRectMake(0,tagList.frame.origin.y+tagList.frame.size.height+40 , ScreenWidth, 0)];
        selectItems.signalTagColor=[UIColor whiteColor];
        selectItems.canTouch=NO;
        [selectItems setMarginBetweenTagLabel:20 AndBottomMargin:20];
        [selectItems setTagWithTagArray:arr];
        [weakSelf.view addSubview:selectItems];
        _tempTag=selectItems;
        
        
    }];
    
    [self.view addSubview:tagList];
    UILabel*tip=[[UILabel alloc]initWithFrame:CGRectMake(0, tagList.frame.origin.y+tagList.frame.size.height+10, ScreenWidth, 20)];
    tip.text=@"选中的标签是：";
    tip.textAlignment=NSTextAlignmentCenter;
    tip.font=[UIFont boldSystemFontOfSize:18];
    [self.view addSubview:tip];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
