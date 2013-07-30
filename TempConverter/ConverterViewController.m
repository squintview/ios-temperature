//
//  ConverterViewController.m
//  TempConverter
//
//  Created by Nirmal Thangaraj on 7/27/13.
//  Copyright (c) 2013 Nirmal Thangaraj. All rights reserved.
//

#import "ConverterViewController.h"

@interface ConverterViewController ()

@property (nonatomic) int conversion;

@end

@implementation ConverterViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fahrenheit.delegate = self;
    self.celsius.delegate = self;
    self.conversion = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITextField delegate

-(void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.fahrenheit) {
        self.conversion = 1;
        self.ctype = F2C;
        
    } else if (textField == self.celsius) {
        self.conversion = 0;
        self.ctype = C2F;
    }
    [self updateLabelsWithConversion:self.ctype];
}

// handle events from the text fields and button
-(void)convertTemperatureWithSender: (id)sender
{
    [self.view endEditing:YES];
    
    if (sender == self.celsius) {
        [self updateLabelsWithConversion:C2F];
    } else if (sender == self.fahrenheit){
        [self updateLabelsWithConversion:F2C];
    } else {
        [self updateLabelsWithConversion:self.ctype];
    }
}

// handle the tap gesture
-(void)convertTemperature
{
    [self.view endEditing:YES];
    [self updateLabelsWithConversion:self.ctype];
}

-(float)fahrenheitWithCelsius:(float)celsius {
    return (celsius * 1.8) + 32.0;
}

-(float)celsiusWithFahrenheit:(float)fahrenheit {
    return (fahrenheit - 32.0) * (5.0/9.0);
}

-(void)updateLabelsWithConversion:(ConversionType)ctype {
    [self.view endEditing:YES];
    
    if (ctype == C2F) {
        if ([self.celsius.text  isEqual: @""]) {
            self.fahrenheit.text = @"";
            return;
        }
        float celsius = [self.celsius.text floatValue];
        float fahrenheit = [self fahrenheitWithCelsius:celsius];
        self.fahrenheit.text = [NSString stringWithFormat:@"%0.2f", fahrenheit];
        
    } else if (ctype == F2C){
        if ([self.fahrenheit.text  isEqual: @""]) {
            self.celsius.text = @"";
            return;
        }
        float fahrenheit = [self.fahrenheit.text floatValue];
        float celsius = [self celsiusWithFahrenheit:fahrenheit];
        
        self.celsius.text = [NSString stringWithFormat:@"%0.2f", celsius];
    }
}


@end
