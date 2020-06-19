//
//  ManaTopTabView.h
//  ManaTopTabView
//
//  Created by 刘亚和 on 2019/5/8.
//  Copyright © 2019 刘亚和. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManaTopTabView : UIView

- (instancetype)initWithTitle:(NSString *)rightTitleString WithTitleColor:(UIColor *)titleColor;

- (instancetype)initWithSelectedTitle:(NSString *)rightTitleString WithTitleColor:(UIColor *)titleColor;
@end
