//
//  ManaTopTabView.h
//  ManaTopTabView
//
//  Created by 刘亚和 on 2019/5/8.
//  Copyright © 2019 刘亚和. All rights reserved.
//

#import "ManaTopTabView.h"
#import "UIParameter.h"

@interface ManaTopTabView()
@property (strong, nonatomic) UILabel *rightTitle;
@end

@implementation ManaTopTabView {
    NSString *imageName;
    NSString *titleName;
    UIColor *myTitleColor;
}

- (instancetype)initWithTitle:(NSString *)rightTitleString WithTitleColor:(UIColor *)titleColor {
    if (self = [super init]) {
        titleName = rightTitleString;
        myTitleColor = titleColor;
        [self addSubview:self.rightTitle];
        [self initUI];
    }
    return self;
}

- (instancetype)initWithSelectedTitle:(NSString *)rightTitleString WithTitleColor:(UIColor *)titleColor {
    if (self = [super init]) {
        titleName = rightTitleString;
        myTitleColor = titleColor;
        [self addSubview:self.rightTitle];
        [self initSelectedUI];
    }
    return self;
}

#pragma mark - LazyLoad

- (UILabel *)rightTitle {
    if (!_rightTitle) {
        _rightTitle = [UILabel new];
        _rightTitle.text = titleName;
        _rightTitle.textAlignment = NSTextAlignmentCenter;
        _rightTitle.textColor = myTitleColor;
        _rightTitle.font = [UIFont systemFontOfSize:14];
    }
    return _rightTitle;
}

#pragma mark - LayOut
- (void)initUI {
    self.rightTitle.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH / 4, 57);
}
- (void)initSelectedUI {
    CGSize fontSize = [self.rightTitle.text sizeForFont:[UIFont systemFontOfSize:24 weight:UIFontWeightBold] size:CGSizeMake(150, 24) mode:NSLineBreakByWordWrapping];
//    NSLog(@"%@",NSStringFromCGSize([self.rightTitle.text sizeForFont:[UIFont systemFontOfSize:24 weight:UIFontWeightBold] size:CGSizeMake(100, 24) mode:NSLineBreakByWordWrapping]));
    if (fontSize.width > (FUll_VIEW_WIDTH / 5)) {
        self.rightTitle.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    }else{
        self.rightTitle.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
    }
    self.rightTitle.frame = CGRectMake(0, 0, FUll_VIEW_WIDTH / 4, 47);
    self.rightTitle.textAlignment = NSTextAlignmentCenter;
    self.rightTitle.clipsToBounds = NO;
}
@end
