//
//  TempViewController.h
//  Temperature Converter
//
//  Created by Aniket Ajagaonkar on 7/26/14.
//  Copyright (c) 2014 Aniket Ajagaonkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *fahrenheit;
@property (nonatomic,weak) IBOutlet UITextField *celcius;
@property (nonatomic,weak) IBOutlet UIButton *convert;
@property (nonatomic,weak) IBOutlet UILabel *temp;

@end
