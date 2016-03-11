//
//  HGCustomPickerView.h
//  YouKang
//
//  Created by 123456 on 16/1/26.
//  Copyright © 2016年 Ucan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HJCustomTextFieldDelegate <NSObject>

- (void)cancelBarButtonItemDidSelected;
- (void)confirmBarButtonItemDidSelected;

- (void)pickerViewDidSelectedRowWithTitle:(NSString *)title;


- (void)customTextFieldDidBeginEditing:(UITextField *)textField;
- (void)customTextFieldDidEndEditing:(UITextField *)textField;

@end

@interface HJCustomTextField : UITextField<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, weak) id<HJCustomTextFieldDelegate> pickerDelegate;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic, strong) NSMutableArray *componentsArray;
@property (nonatomic, strong) NSMutableArray *rowsArray;
@property (nonatomic, strong) NSString *selectedRowTitle;
@property (nonatomic, strong) UITapGestureRecognizer *hideKeyboardGesture;


@end
