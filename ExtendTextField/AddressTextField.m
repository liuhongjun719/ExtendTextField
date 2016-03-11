//
//  DatePickerView.m
//  ExtendTextField
//
//  Created by 123456 on 16/1/26.
//  Copyright © 2016年 123456. All rights reserved.
//

#import "AddressTextField.h"

@implementation AddressTextField

- (void)fetchData {
    for (int i = 0; i < 10; i++) {
        [self.componentsArray addObject:[NSString stringWithFormat:@"地址:%d", i+1]];
    }
    [self.pickerView reloadAllComponents];
}


@end
