//
//  CategoryCell.m
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright (c) 2015 Ashish Agrawal. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cellDetailAtIndexPath:(NSIndexPath *)indexPath
{
    _btnTick.tag = indexPath.row +1;
}




@end
