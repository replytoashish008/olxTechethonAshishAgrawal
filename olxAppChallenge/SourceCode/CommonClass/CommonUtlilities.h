//
//  CommonUtlilities.h
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright © 2015 Ashish Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonUtlilities : NSObject

+(NSMutableArray *)containAllProduct;
+(NSString *)stringWithdate:(NSDate *)date;
+(CGFloat)calculateHeightOfCell:(UITableViewCell *)cellForHeight;

@end
