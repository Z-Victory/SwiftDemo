//
//  LYHCycleScrollView.h
//  LYHCycleScrollView
//
//  Created by 刘亚和 on 2019/5/8.
//  Copyright © 2019 刘亚和. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LYHCycleScrollView;
@protocol LYHBannerViewDelegate <NSObject>

@optional //可选

- (void)selectImage:(LYHCycleScrollView *)bannerView currentImage:(NSInteger )currentImage;

- (void)selectIndex:(NSInteger )currentIndex;

@end
@interface LYHCycleScrollView : UIView
@property (nonatomic, strong) NSMutableArray *imageArray;//图片数组
@property (nonatomic,weak) id<LYHBannerViewDelegate> delegate;

//自定义init方法
- (id)initWithFrame:(CGRect)frame addImageArray:(NSMutableArray *)addImageArray;

- (void)reloadImage;

- (void)destory;
@end

NS_ASSUME_NONNULL_END
