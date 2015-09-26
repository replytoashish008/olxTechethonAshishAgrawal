//
//  CategoryCell.h
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright (c) 2015 Ashish Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CategoryCell : UITableViewCell

@property(weak,nonatomic) UILabel *lblName;
@property(weak,nonatomic) UILabel *lblDesc;
@property(weak,nonatomic) UILabel *lblPrice;
@property(weak,nonatomic) UILabel *lblCity;
@property(weak,nonatomic) UILabel *lblDatePosted;
@property(weak,nonatomic) UIImageView *imgView;
@property(weak,nonatomic) UIButton *btnTick;

@end
