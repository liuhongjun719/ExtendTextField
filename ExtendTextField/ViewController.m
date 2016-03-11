//
//  ViewController.m
//  ExtendTextField
//
//  Created by 123456 on 16/1/26.
//  Copyright © 2016年 123456. All rights reserved.
//

#import "ViewController.h"
#import "AddressTextField.h"
#import "SexTextField.h"
#import "HJCustomDatePickerTextField.h"
#import "DateTextField.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet AddressTextField *addressTextField;
@property (weak, nonatomic) IBOutlet SexTextField *sexTextField;


@property (weak, nonatomic) IBOutlet HJCustomDatePickerTextField *dateTextField;
@property (weak, nonatomic) IBOutlet DateTextField *subDateTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.titleTextField.delegate = self;
}

//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    [self.titleTextField becomeFirstResponder];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushNextPage:(UIButton *)sender {
}

@end
