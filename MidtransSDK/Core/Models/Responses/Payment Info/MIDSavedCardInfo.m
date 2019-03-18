//
//  MIDSavedCard.m
//  MidtransSDK
//
//  Created by Nanang Rafsanjani on 27/12/18.
//  Copyright © 2018 Midtrans. All rights reserved.
//

#import "MIDSavedCardInfo.h"
#import "MIDModelHelper.h"

@implementation MIDSavedCardInfo

- (NSDictionary *)dictionaryValue {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [result setValue:self.token forKey:@"token"];
    [result setValue:[NSString stringOfCreditCardType:self.tokenType] forKey:@"token_type"];
    [result setValue:self.maskedCard forKey:@"masked_card"];
    [result setValue:self.expireDate forKey:@"expires_at"];
    return result;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.token = [dictionary objectOrNilForKey:@"token"];
        self.tokenType = [[dictionary objectOrNilForKey:@"token_type"] cardTokenType];
        self.maskedCard = [dictionary objectOrNilForKey:@"masked_card"];
        self.expireDate = [dictionary objectOrNilForKey:@"expires_at"];
    }
    return self;
}

@end
