//
//  OlxProductDetail.h
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright © 2015 Ashish Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OlxProductDetail : NSObject

@property (nullable,nonatomic, strong) NSDate *broughtDate;
@property (nullable,nonatomic, strong) NSDate *dateOfPost;
@property (nullable,nonatomic, strong) NSString *category;
@property (nullable,nonatomic, strong) NSNumber *compare;
@property (nullable,nonatomic, strong) NSString *img;
@property (nullable, nonatomic, strong) NSString *loc;
@property (nullable, nonatomic, strong) NSNumber *price;
@property (nullable, nonatomic, strong) NSString *productDesc;
@property (nullable, nonatomic, strong) NSNumber *productId;
@property (nullable, nonatomic, strong) NSString *productName;
@property (nullable, nonatomic, strong) NSString *subCategory;

@end
