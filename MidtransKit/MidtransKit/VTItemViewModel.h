//
//  VTItemViewModel.h
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 2/25/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MidtransCoreKit/VTItem.h"

@interface VTItemViewModel : NSObject

@property (nonatomic, readonly) NSString *price;
@property (nonatomic, readonly) NSString *quantity;
@property (nonatomic, readonly) NSURL *image;

+ (NSString *)totalPriceOfItems:(NSArray *)items;

+ (instancetype)viewModelWithItem:(VTItem *)item;
@end
