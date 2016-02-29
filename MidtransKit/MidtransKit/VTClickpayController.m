//
//  VTClickpayController.m
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 2/29/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "VTClickpayController.h"
#import "VTClassHelper.h"
#import "VTTextField.h"
#import <MidtransCoreKit/VTMandiriClickpay.h>

@interface VTClickpayController ()

@property (strong, nonatomic) IBOutlet VTTextField *debitNumberTextField;
@property (strong, nonatomic) IBOutlet VTTextField *tokenTextField;
@property (strong, nonatomic) IBOutlet UILabel *amountLabel;
@property (strong, nonatomic) IBOutlet UILabel *appliLabel;
@property (strong, nonatomic) IBOutlet UILabel *input1Label;
@property (strong, nonatomic) IBOutlet UILabel *input2Label;
@property (strong, nonatomic) IBOutlet UILabel *input3Label;

@property (nonatomic, readwrite) VTUser *user;
@property (nonatomic, readwrite) NSNumber *amount;

@end

@implementation VTClickpayController {
    VTMandiriClickpay *_clickpay;
}

+ (instancetype)controllerWithUser:(VTUser *)user andAmount:(NSNumber *)amount {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Midtrans" bundle:VTBundle];
    VTClickpayController *vc = [storyboard instantiateViewControllerWithIdentifier:@"VTClickpayController"];
    vc.user = user;
    vc.amount = amount;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _clickpay = [VTMandiriClickpay dataWithTransactionAmount:_amount];
    [_clickpay addObserver:self forKeyPath:@"input1" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    _appliLabel.text = APPLIType;
    _input2Label.text = _clickpay.input2;
    _input3Label.text = _clickpay.input3;
    
    NSNumberFormatter *nf = [NSNumberFormatter numberFormatterWith:@"vt.number"];
    _amountLabel.text = [nf stringFromNumber:_amount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)debitTextFieldChanged:(VTTextField *)sender {
    if ([sender.text isNumeric] == NO) {
        sender.warning = @"please input numeric data";
    } else {
        sender.warning = nil;
        _clickpay.debitNumber = sender.text;
    }
}

- (IBAction)confirmPaymentPressed:(UIButton *)sender {
    
}

- (IBAction)clickpayHelpPressed:(UIButton *)sender {
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"input1"]) {
        _input1Label.text = _clickpay.input1;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
