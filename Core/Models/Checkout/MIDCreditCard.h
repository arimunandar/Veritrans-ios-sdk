//
//  MIDCreditCardOption.h
//  MidtransSDK
//
//  Created by Nanang Rafsanjani on 19/11/18.
//  Copyright © 2018 Midtrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MIDCheckoutable.h"
#import "MIDInstallment.h"
#import "MIDModelEnums.h"

@interface MIDCreditCard : NSObject<MIDCheckoutable>

@property (nonatomic) MIDAuthentication authentication;
@property (nonatomic) MIDAcquiringBank bank;
@property (nonatomic) MIDAcquiringChannel channel;
@property (nonatomic) MIDCreditCardTransactionType type;
@property (nonatomic) NSArray <NSString *> *whiteListBins;
@property (nonatomic) NSArray <NSString *> *blackListBins;
@property (nonatomic) MIDInstallment *installment;

/**
 Credit card payment options
 
 @param type Credit card transaction type. Default: MIDCreditCardTransactionTypeAuthorizeCapture
 @param authentication Credit card authentication types
 @param bank Acquiring bank. Options: bca, bni, mandiri, cimb, bri, danamon, maybank, mega
 @param channel Acquiring channel. Options: migs
 @param installment Credit card payment with installment
 */
- (instancetype _Nonnull)initWithCreditCardTransactionType:(MIDCreditCardTransactionType)type
                                            authentication:(MIDAuthentication)authentication
                                             acquiringBank:(MIDAcquiringBank)bank
                                          acquiringChannel:(MIDAcquiringChannel)channel
                                               installment:(MIDInstallment *)installment
                                             whiteListBins:(NSArray <NSString *> *)whiteListBins
                                             blackListBins:(NSArray <NSString *> *)blackListBins;

@end
