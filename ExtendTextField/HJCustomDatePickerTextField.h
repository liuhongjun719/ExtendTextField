//
//  HJCustomDateTextField.h
//  ExtendTextField
//
//  Created by 123456 on 16/1/27.
//  Copyright © 2016年 123456. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJCustomDatePickerTextField: UITextField<UITextFieldDelegate>

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic, strong) UITapGestureRecognizer *hideKeyboardGesture;

@end
