//
//  MIDGoPayPayment.m
//  MidtransSDK
//
//  Created by Nanang Rafsanjani on 27/11/18.
//  Copyright © 2018 Midtrans. All rights reserved.
//

#import "MIDGopayPayment.h"

@implementation MIDGopayPayment

- (NSDictionary *)dictionaryValue {
    return @{@"payment_type": @"gopay"};
}

@end
