# GBTaglistView-2.0<br>
##如果觉得有用的话请点个星谢谢支持，会继续出一些功能性的框架，如有bug也请指出群号：433060483欢迎加入组织<br>
##近期暴露添加了一个接口来控制tag之间的间距包括左右间距和上下间距
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
#升级版本2.1<br>
##最近有一个网友说自己的项目里面也用到了这个东西但是需要限制点击的个数，为了答谢网友积极提出意见我添加了一个接口来控制允许点击的tag个数<br>
## 超过这个限制数没有被选中的tag就不能被点击了只有取消选中项才能继续点击当然是在不超过限制数的基础上<br>
* 新添加属性:<br>
```
/**

 *  限制点击个数
 *  0->不限制
 *  不设置此属性默认不限制
 */
@property(nonatomic) NSInteger canTouchNum;
```
* 使用代码变动<br>
```
 GBTagListView *tagList=[[GBTagListView alloc]initWithFrame:CGRectMake(0, 80, ScreenWidth, 0)];
    /**允许点击 */
    tagList.canTouch=YES;
    /**可以控制允许点击的标签数 */
    tagList.canTouchNum=5;
    tagList.signalTagColor=[UIColor whiteColor];
    [tagList setTagWithTagArray:strArray];

```
##2.2.0 修复bug，感谢网友提出bug，bug已经解决请自行更新。<br>
##2.2.1 之前的是只支持多选的，特增加一个接口可以控制单选或者是多选<br>
# 单选模式效果图<br>
![](https://github.com/mokey1422/gifResourceOther/blob/master/2016-06-24%2010_12_38.gif)<br>
# 多选效果展示<br>
![image](https://github.com/mokey1422/gifResource/blob/master/2015-08-25%2023_29_41.gif)<br>
# 限制点击个数效果图<br>
![](https://github.com/mokey1422/gifResourceOther/blob/master/2016-06-24%2010_15_21.gif)<br>
 
