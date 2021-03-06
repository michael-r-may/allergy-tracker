//
//  ScrollableToolbarView.m
//  AllergyTracker
//
//  Created by Emily Toop on 18/05/2015.
//  Copyright (c) 2015 Radical Robot. All rights reserved.
//

#import "ScrollableToolbarView.h"

#import "UIView+FrameAccessors.h"

@implementation ScrollableToolbarView

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat x = 6;
    CGFloat buttonWidth = 44;
    
    CGFloat totalWidth = MAX(self.items.count * buttonWidth, self.bounds.size.width);
    CGFloat xIncrement = totalWidth / self.items.count;
    
    for(UIButton *button in self.items){
        button.x = x;
        if(!button.superview){
            [self addSubview:button];
        }
        x += xIncrement;
    }
}

-(void)setItems:(NSArray *)items {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _items = items;
    [self setNeedsLayout];
}


@end
