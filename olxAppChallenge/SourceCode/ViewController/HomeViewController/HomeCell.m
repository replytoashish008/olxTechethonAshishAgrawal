//
//  HomeCell.m
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright © 2015 Ashish Agrawal. All rights reserved.
//

#import "HomeCell.h"
#import "OlxProductDetail.h"
#import "CommonUtlilities.h"

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
    
    self.contentView.frame = [UIScreen mainScreen].bounds;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cellDetailAtIndexPathOlxProductDetial:(OlxProductDetail *)olx
{    
    _lblName.text = olx.productName;
    _lblDesc.text = olx.productDesc;
    _lblCity.text = [NSString stringWithFormat:@"City : %@",olx.loc];
    _lblPrice.text = [NSString stringWithFormat:@"Price : %@",olx.price];
    _lblDatePosted.text = [NSString stringWithFormat:@"Date of Post : %@",[CommonUtlilities stringWithdate:olx.dateOfPost]];
    _imgView.image = [UIImage imageNamed:olx.img];

}

@end
