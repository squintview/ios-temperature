//
//  ConverterViewController.h
//  TempConverter
//
//  Created by Nirmal Thangaraj on 7/27/13.
//  Copyright (c) 2013 Nirmal Thangaraj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConverterViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *fahrenheit;
@property (nonatomic, strong) IBOutlet UITextField *celsius;
@property (nonatomic, strong) IBOutlet UIButton *convert;
-(IBAction)convertTemperatureWithSender:(id)sender;

typedef enum  {
    C2F,
    F2C
} ConversionType;
@property (nonatomic) ConversionType ctype;
@end
