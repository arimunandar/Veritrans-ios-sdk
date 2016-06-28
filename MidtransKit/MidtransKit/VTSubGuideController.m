//
//  VTSubGuideController.m
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 6/22/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "VTSubGuideController.h"
#import "VTGuideView.h"
#import "VTStringHelper.h"
#import "VTClassHelper.h"

@interface VTSubGuideController ()
@property (strong, nonatomic) IBOutlet VTGuideView *view;
@property (strong, nonatomic) NSArray *guideList;
@end

@implementation VTSubGuideController

@dynamic view;

- (instancetype)initWithList:(NSArray *)list {
    self = [super initWithNibName:[self.class description] bundle:VTBundle];
    if (self) {
        self.guideList = list;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.guideTextView.attributedText = [VTStringHelper numberingTextWithList:_guideList];
}
@end