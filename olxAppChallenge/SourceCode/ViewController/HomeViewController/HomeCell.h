//
//  HomeCell.h
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright © 2015 Ashish Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OlxProductDetail;

@interface HomeCell : UITableViewCell

@property(weak,nonatomic) IBOutlet UILabel *lblName;
@property(weak,nonatomic) IBOutlet UILabel *lblDesc;
@property(weak,nonatomic) IBOutlet UILabel *lblPrice;
@property(weak,nonatomic) IBOutlet UILabel *lblCity;
@property(weak,nonatomic) IBOutlet UILabel *lblDatePosted;
@property(weak,nonatomic) IBOutlet UIImageView *imgView;
@property(weak,nonatomic) IBOutlet UIButton *btnTick;

-(void)cellDetailAtIndexPathOlxProductDetial:(OlxProductDetail *)olx;

@end
