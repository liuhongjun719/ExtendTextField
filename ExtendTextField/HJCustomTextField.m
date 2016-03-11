//
//  HGCustomPickerView.m
//  YouKang
//
//  Created by 123456 on 16/1/26.
//  Copyright © 2016年 Ucan. All rights reserved.
//
//        UIInputViewController

#import "HJCustomTextField.h"

@implementation HJCustomTextField

#pragma mark- CREATE
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.componentsArray = [[NSMutableArray alloc] init];
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
        self.componentsArray = [[NSMutableArray alloc] init];
        self.inputView = [self createInputView];
        self.inputAccessoryView = [self createInputAccessoryView];
        self.delegate = self;
    }
    return self;
}
- (UIView *)createInputView {
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.pickerView.backgroundColor = [UIColor whiteColor];
    self.pickerView.showsSelectionIndicator = YES;
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    [self fetchData];
    return self.pickerView;
}

- (UIView *)createInputAccessoryView {
    if (!self.toolBar) {
        self.toolBar = [[UIToolbar alloc] init];
        self.toolBar.barStyle = UIBarStyleDefault;
        [self.toolBar sizeToFit];
        self.toolBar.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        UIBarButtonItem *cancleItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
        
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
        
        [self.toolBar setItems:@[cancleItem, spaceItem, confirmItem]];
    }
    return self.toolBar;
}

- (void)cancel {
//    if ([self.pickerDelegate respondsToSelector:@selector(cancelBarButtonItemDidSelected)]) {
//        [self.pickerDelegate cancelBarButtonItemDidSelected];
//    }
    self.text = @"";
    [self resignFirstResponder];
}
- (void)confirm {
//    if ([self.pickerDelegate respondsToSelector:@selector(confirmBarButtonItemDidSelected)]) {
//        [self.pickerDelegate confirmBarButtonItemDidSelected];
//    }
    [self resignFirstResponder];
}

#pragma mark- UIPickerViewDataSource, UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    return self.componentsArray.count;
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    return self.rowsArray.count;
    return self.componentsArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
//    return self.window.frame.size.width/self.componentsArray.count;
    return self.window.frame.size.width;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.componentsArray[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    self.selectedRowTitle = self.componentsArray[row];
    self.text = self.componentsArray[row];
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

#pragma mark- Perform by subclass
- (void)fetchData{}
- (void)setDefaultSelectedRow{}
@end
