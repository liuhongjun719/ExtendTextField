//
//  SexTextField.m
//  ExtendTextField
//
//  Created by 123456 on 16/1/26.
//  Copyright © 2016年 123456. All rights reserved.
//

#import "SexTextField.h"

@implementation SexTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)fetchData {
    [self.componentsArray addObject:@"男"];
    [self.componentsArray addObject:@"女"];
    [self.pickerView reloadAllComponents];
}

@end
