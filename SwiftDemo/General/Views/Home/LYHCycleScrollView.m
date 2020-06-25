//
//  LYHCycleScrollView.m
//  LYHCycleScrollView
//
//  Created by 刘亚和 on 2019/5/8.
//  Copyright © 2019 刘亚和. All rights reserved.
//

#import "LYHCycleScrollView.h"
#import "LYHPageControl.h"
#import "objc/runtime.h"
#import <SDWebImage.h>

@interface LYHCycleScrollView()<UIScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;//图片数组

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSUInteger corneradiusValue; /**< 圆角值 */
@property (nonatomic, assign) NSUInteger count; /**< 图片个数 */
@property (nonatomic, assign) CGFloat gap; /**< 间距 */
@property (nonatomic, assign) CGFloat distance; /**< ScrollView 与 view 间距 */
@property (nonatomic, assign) CGFloat time; /**< 定时器间隔时间 */
@property (nonatomic, strong) NSTimer *timer; /**< 定时器 */
//@property (nonatomic, assign) NSInteger index; /**< 索引 */
@property (nonatomic, strong) UIPageControl *pageCtrl;//小白点

@end
@implementation LYHCycleScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame addImageArray:(NSMutableArray *)addImageArray{
    if (self = [super initWithFrame:frame]) {
//        [self remakeImageArray:addImageArray];
        self.corneradiusValue = 8;
        self.gap = 8;
        self.distance = 10;
        self.count = addImageArray.count;
//        self.index = 2;
        self.time = 5.0f;
//        self.dragging = NO;
        [self addSubview:self.pageCtrl];
//        [self setupUI];
//        [self addTimer];
//        [self bringSubviewToFront:self.pageCtrl];
        self.clipsToBounds = YES;
    }
    return self;
}
//处理图片数组
- (void)remakeImageArray:(NSMutableArray *)addImageArray{
    
    //改变图片数组 1 2 3
    _dataArray = [NSMutableArray arrayWithArray:addImageArray];
    
    //在数组的最后一位添加上第一张图片 1 2 3 1
    [_dataArray addObject:addImageArray[0]];
    
    //在数组的最后一位添加上第一张图片 1 2 3 1 2
    [_dataArray addObject:addImageArray[1]];
    
    //在第一个位置插入图片3 | 3 1 2 3 1 2
    [_dataArray insertObject:[addImageArray lastObject] atIndex:0];
    
    //在第一个位置插入图片2 | 2 3 1 2 3 1 2
    [_dataArray insertObject:addImageArray[addImageArray.count - 2] atIndex:0];
}

- (UIPageControl *)pageCtrl{
    if (!_pageCtrl) {
        _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 40, self.frame.size.width, 20)];
//        _pageCtrl.backgroundColor = [UIColor lightGrayColor];
        _pageCtrl.numberOfPages = _count;
        _pageCtrl.currentPage = 0;
        //去掉系统自带样式
        //    pageCtrl.currentPageIndicatorTintColor = [UIColor clearColor];
        //    pageCtrl.pageIndicatorTintColor = [UIColor clearColor];
//        [_pageCtrl setValue:[UIImage imageNamed:@"banner_current"] forKeyPath:@"_currentPageImage"];
//        [_pageCtrl setValue:[UIImage imageNamed:@"banner_dot"] forKeyPath:@"_pageImage"];
    }
    return _pageCtrl;
}
#pragma mark - UI

- (void)setupUI {
    // 1.ScrollView
    self.scrollView.frame = CGRectMake(self.distance, 0, self.bounds.size.width - 2 * self.distance, self.bounds.size.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
    // 2.创建界面
    CGFloat itemWidth = self.scrollView.bounds.size.width - self.gap;
    CGFloat itemHeight = itemWidth*0.435;
    CGFloat itemY = (self.scrollView.bounds.size.height - itemHeight) * 0.5;
    CGFloat itemX;
    for (int i = 0; i < self.dataArray.count; i++) {
        
        itemX = (2 * i + 1) * self.gap * 0.5 + i * itemWidth;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.frame = CGRectMake(itemX-self.gap-itemWidth, itemY, itemWidth, itemHeight);
        imageView.tag = 200 + i;
        [self.scrollView addSubview:imageView];
        [imageView layoutIfNeeded];//iOS 10需要添加这个
        imageView.layer.cornerRadius = self.corneradiusValue;
        imageView.layer.masksToBounds = YES;
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.dataArray[i]] placeholderImage:[UIImage imageNamed:@"banner_placehold"]];
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        //将手势添加到图片上
        [imageView addGestureRecognizer:tap];
        
        //与用户交互
        imageView.userInteractionEnabled = YES;
    }
    //设置可滑动区域
    self.scrollView.contentSize = CGSizeMake((self.gap+ itemWidth)*(self.count+2), 0);
    //设置初始位置
    self.scrollView.contentOffset = CGPointMake((itemWidth + self.gap) * 1, 0);
}

//添加定时器
- (void)addTimer{
    _timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(change) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

//定时器方法
- (void)change{
    //获取起始位置
    CGFloat startX = _scrollView.contentOffset.x;
    __weak typeof(self) weakSelf = self;
    //获取终点
    CGFloat endX = startX + _scrollView.frame.size.width;
//    WS(weakSelf);
    if (endX == (self.count + 2) * _scrollView.frame.size.width){
        //动画时长  animateWithDuration
        [UIView animateWithDuration:0.25 animations:^{
            //往最后一位走
            weakSelf.scrollView.contentOffset = CGPointMake(endX, 0);
        }completion:^(BOOL finished){
            //走向第二位
            weakSelf.scrollView.contentOffset = CGPointMake((self.scrollView.bounds.size.width) * 2, 0);
            
            //走到对应的点
            NSInteger tmpPage = _scrollView.contentOffset.x / self.scrollView.bounds.size.width;
//            NSLog(@"%ld",tmpPage);
            weakSelf.pageCtrl.currentPage = tmpPage - 1;
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.scrollView.contentOffset = CGPointMake(endX, 0);
        }];
        
        //走到对应的点
        NSInteger tmpPage = _scrollView.contentOffset.x / self.scrollView.bounds.size.width;
//        NSLog(@"%ld",tmpPage);
        if (tmpPage == self.count+1) {
            tmpPage = 1;
        }
        self.pageCtrl.currentPage = tmpPage - 1;
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (_timer)
    {
        //timer停止在未来的一个时间
        [_timer setFireDate:[NSDate distantFuture]];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //恢复时间timer
    if (_timer)
    {
        [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    }
    // 实现无限循环滚动
    NSInteger curIndex = scrollView.contentOffset.x  / self.scrollView.frame.size.width;
//    self.index = curIndex;
//    NSLog(@"%ld",curIndex);
    if (curIndex > 0 && curIndex <= self.count) {
        self.pageCtrl.currentPage = curIndex - 1;
    }
    
    if (curIndex == self.count + 1) {
        scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
//        self.index = 2;
        self.pageCtrl.currentPage = 0;
    }
    if (curIndex == 0){
        scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * self.count, 0);
//        self.index = 3;
        self.pageCtrl.currentPage = self.count - 1;
    }
}

//手势方法
- (void)tapAction:(UITapGestureRecognizer *)recognizer
{
//    NSLog(@"%li",self.pageCtrl.currentPage);
    //如果代理响应该方法 , 就走该方法
    if ([self.delegate respondsToSelector:@selector(selectImage:currentImage:)])
    {
        [self.delegate selectImage:self currentImage:self.pageCtrl.currentPage];
    }
    //如果代理响应该方法 , 就走该方法
    if ([self.delegate respondsToSelector:@selector(selectIndex:)])
    {
        [self.delegate selectIndex:self.pageCtrl.currentPage];
    }
}

//- (void)reloadImage{
//    [self removeAllSubviews];
//    [self.timer invalidate];
//    self.timer = nil;
//
//    [self remakeImageArray:self.dataArray];
//    [self addSubview:self.pageCtrl];
//    [self setupUI];
//    [self addTimer];
//    [self bringSubviewToFront:self.pageCtrl];
//}

- (void)destory{
    [self.timer invalidate];
    self.timer = nil;
}
- (void)reloadImage{
//    return;
    //先销毁
//    [self.scrollView removeAllSubviews];
    for (UIView * view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
    [self.timer invalidate];
    self.timer = nil;
    //后重新初始化
    [self remakeImageArray:_imageArray];
    [self setupUI];
    [self addTimer];
    
    self.pageCtrl.numberOfPages = _imageArray.count;
    self.pageCtrl.currentPage = 0;
    [self bringSubviewToFront:self.pageCtrl];
}
#pragma mark - LazyLoad
- (NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}
@end
