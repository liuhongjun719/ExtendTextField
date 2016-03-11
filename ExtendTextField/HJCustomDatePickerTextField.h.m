//
//  HJCustomDateTextField.m
//  ExtendTextField
//
//  Created by 123456 on 16/1/27.
//  Copyright © 2016年 123456. All rights reserved.
//

#import "HJCustomDatePickerTextField.h"

@implementation HJCustomDatePickerTextField

#pragma mark- Create UIDatePicker
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.inputView = [self createInputView];
        self.inputAccessoryView = [self createInputAccessoryView];
        self.delegate = self;
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.inputView = [self createInputView];
        self.inputAccessoryView = [self createInputAccessoryView];
        self.delegate = self;
    }
    return self;
}

- (UIView *)createInputView {
    _datePicker = [[UIDatePicker alloc] init];
    _datePicker.datePickerMode = UIDatePickerModeDateAndTime;//模式
    _datePicker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];//中文显示
    NSDate *now = [NSDate date];
    _datePicker.minimumDate = now;
    _datePicker.date = now;
    [_datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    return _datePicker;
}

- (UIView *)createInputAccessoryView {
    if (!self.toolBar) {
        _toolBar = [[UIToolbar alloc] init];
        _toolBar.barStyle = UIBarStyleDefault;
        [_toolBar sizeToFit];
        _toolBar.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        UIBarButtonItem *cancleItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
        
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
        
        [_toolBar setItems:@[cancleItem, spaceItem, confirmItem]];
    }
    return _toolBar;
}



- (void)cancel {
    self.text = @"";
    [self resignFirstResponder];
}
- (void)confirm {
    [self resignFirstResponder];
}


#pragma mark- UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self removeBeforeGesture];
    [self.superview addGestureRecognizer:[self addGesture]];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
}


#pragma mark- Hide keyboard
- (void)removeBeforeGesture {
    for (UIGestureRecognizer *gesture in self.superview.gestureRecognizers) {
        [self.superview removeGestureRecognizer:gesture];
    }
}
- (UITapGestureRecognizer *)addGesture {
    if (!self.hideKeyboardGesture) {
        self.hideKeyboardGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    }
    return self.hideKeyboardGesture;
}
- (void)hideKeyboard {
    [self endEditing:YES];
    [self.superview removeGestureRecognizer:self.hideKeyboardGesture];
}

#pragma mark- Override by subclass through different dateFormat
- (void)datePickerValueChanged:(UIDatePicker *)picker {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateStr = [dateFormatter stringFromDate:picker.date];
    self.text = dateStr;
}

@end
