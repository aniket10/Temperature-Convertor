//
//  TempViewController.m
//  Temperature Converter
//
//  Created by Aniket Ajagaonkar on 7/26/14.
//  Copyright (c) 2014 Aniket Ajagaonkar. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()
@property (nonatomic) BOOL flag;

- (void) computeTemperature;
- (void) onDoneButton;

@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature Converter";
        self.flag = true;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.flag == true) {
         self.temp.text = [NSString stringWithFormat:@"onload if %c",self.flag];
        self.fahrenheit.delegate = self;
    }
    self.celcius.delegate = self;
    
    [self.convert addTarget:self action:@selector(computeTemperature) forControlEvents:UIControlEventAllTouchEvents];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    if(textField == self.fahrenheit) {//  self.fahrenheit.isEditing ) {
        self.temp.text = [NSString stringWithFormat:@"in if"];
        self.celcius.text = [NSString stringWithFormat:@"0.0"];
        self.flag = true;
    }
    if(textField == self.celcius) { // self.celcius.isEditing){
        self.temp.text = [NSString stringWithFormat:@"in else"];
        self.fahrenheit.text = [NSString stringWithFormat:@"0.0"];
        self.flag = false;
    }

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    return YES;
}

- (void) onDoneButton{
    [self.view endEditing:YES];
}

-(void)computeTemperature{
    float fahrenheitValue = [self.fahrenheit.text floatValue];
    float celciusValue = [self.celcius.text floatValue];
    
    self.temp.text = [NSString stringWithFormat:@"%0.1f , %0.1f",fahrenheitValue,celciusValue];
    if (self.flag == true) {
        celciusValue = (fahrenheitValue-32)*5/9;
    }
    else fahrenheitValue = (celciusValue*9/5)+32;
    
    self.fahrenheit.text = [NSString stringWithFormat:@"%0.1f",fahrenheitValue];
    self.celcius.text = [NSString stringWithFormat:@"%0.1f",celciusValue];
}

@end
