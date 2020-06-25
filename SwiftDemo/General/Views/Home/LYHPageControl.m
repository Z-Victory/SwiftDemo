//
//  LYHPageControl.m
//  NinaPagerView
//
//  Created by 刘亚和 on 2019/5/8.
//  Copyright © 2019 刘亚和. All rights reserved.
//

#import "LYHPageControl.h"

@implementation LYHPageControl

- (instancetype)init{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)page {
    [super setCurrentPage:page];
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        subview.contentMode = UIViewContentModeScaleAspectFit;
        size.height = 5;
        size.width = 15;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,size.width,size.height)];
    }
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
