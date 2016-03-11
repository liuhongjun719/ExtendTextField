//
//  DateTextField.m
//  ExtendTextField
//
//  Created by 123456 on 16/1/27.
//  Copyright © 2016年 123456. All rights reserved.
//

#import "DateTextField.h"

@implementation DateTextField


- (void)datePickerValueChanged:(UIDatePicker *)picker {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:picker.date];
    self.text = dateStr;
}

@end
