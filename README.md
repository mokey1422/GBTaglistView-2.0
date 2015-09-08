# GBTaglistView-2.0<br>
##如果觉得有用的话请点个星谢谢支持，会继续出一些功能性的框架，如有bug也请指出群号：433060483欢迎加入组织
说明：<br>
====
<br>
近期项目里面有选择标签的需求，简单的标签墙已经满足不了需求了就简单的把之前的版本进行了一些升级支持点击事件<br>
# 如何使用:<br>
* 手动拖入文件夹GBTagListView2.0<br>
* 在使用的地方包含一下头文件即可<br>
* 复制以下代码<br>
 
 ```
    GBTagListView *tagList=[[GBTagListView alloc]initWithFrame:CGRectMake(0, 80, ScreenWidth, 0)];
    tagList.canTouch=YES;
    tagList.signalTagColor=[UIColor whiteColor];
    [tagList setTagWithTagArray:strArray];
    __weak __typeof(self)weakSelf = self;
    [tagList setDidselectItemBlock:^(NSArray *arr) {
        NSLog(@"%@",arr);
        [_tempTag removeFromSuperview];
        GBTagListView*selectItems=[[GBTagListView alloc]initWithFrame:CGRectMake(0,tagList.frame.origin.y+tagList.frame.size.height+40 , ScreenWidth, 0)];
        selectItems.signalTagColor=[UIColor whiteColor];
        selectItems.canTouch=NO;
        [selectItems setTagWithTagArray:arr];
        [weakSelf.view addSubview:selectItems];
        _tempTag=selectItems;
        
        
        
    }];
    [self.view addSubview:tagList];
 ``` 
 
* 该控件的高度是自适应的根据赋值数组里的数据变化可以不用设置，详细的使用方法在GBTagListView.h里都有说明<br>
# 效果展示<br>
![image](https://github.com/mokey1422/gifResource/blob/master/2015-08-25%2023_29_41.gif)  <br>

 
