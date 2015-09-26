//
//  CommonUtlilities.m
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright © 2015 Ashish Agrawal. All rights reserved.
//

#import "CommonUtlilities.h"
#import "OlxProductDetail.h"

@implementation CommonUtlilities

+(NSMutableArray *)containAllProduct
{
    NSArray *array1  = [NSArray arrayWithObjects:@"Windows",@"Nokia",@"Iphone",@"Blackberry",@"Android", nil];
    NSArray *array2  = [NSArray arrayWithObjects:@"Fiat",@"Honda",@"Maruti",@"Hyundai",@"Volkswagon",@"Skoda", nil];
    NSArray *array3  = [NSArray arrayWithObjects:@"Air Conditioner",@"TV",@"Refrigerator",@"Camera",@"Washing Machine", nil];
    
    NSArray *arrayPlaceHolder  = [NSArray arrayWithObjects:@"cellphone",@"car",@"washing",nil];

    NSArray *arrayLoc  = [NSArray arrayWithObjects:@"Delhi",@"Mumbai",@"Gurgaon",@"Noida",@"Banglore",nil];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:array1,@"Mobile",array2,@"Cars",array3,@"Electronics", nil];
    
    NSMutableArray *arrayProduct = [NSMutableArray new];
    
    for (int i = 0; i < [dictionary allKeys].count; i++) {  // category
        
        NSInteger allKeyCount = [[dictionary objectForKey:[[dictionary allKeys]objectAtIndex:i]] count];
        
        for (int j = 0; j < allKeyCount ; j++) {    // sub category
            
            for (int k = 0; k < allKeyCount ; k++) { // product
                
                OlxProductDetail *olx = [OlxProductDetail new];
                
                olx.broughtDate = [CommonUtlilities timeStamp:i date:j];
                olx.dateOfPost = [CommonUtlilities timeStamp:i date:j];
                olx.category = [[dictionary allKeys]objectAtIndex:i];
                olx.subCategory = [[dictionary objectForKey:olx.category] objectAtIndex:j];
                olx.productName = [NSString stringWithFormat:@"%@-%@ %d",olx.category,olx.subCategory,k];
                olx.img = [arrayPlaceHolder objectAtIndex:i%3];
                olx.loc = [arrayLoc objectAtIndex:j%4];
                olx.price = [NSNumber numberWithInt:(i+1)+(j+1)+(k+1)*10];
                olx.productDesc = [NSString stringWithFormat:@"This Belong to %@ category %@ > subProduct with product Name : %@ .I am looking to sell on price Rs%@  .My location is %@",olx.category,olx.subCategory,olx.productName,olx.price,olx.loc];
                olx.productId =[NSNumber numberWithInt:(i+1)*100+(j+1)*10+k];

                [arrayProduct addObject:olx];
            }
        }
    }
    
    return arrayProduct;
}

+(NSDate *)timeStamp:(NSInteger )month date:(NSInteger)day
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    [comps setMonth:month];
    [comps setYear:2015];
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}


+(NSString *)stringWithdate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    return [dateFormatter stringFromDate:date];
}

+(CGFloat)calculateHeightOfCell:(UITableViewCell *)cellForHeight
{
    [cellForHeight setNeedsLayout];
    [cellForHeight layoutIfNeeded];
    CGSize size = [cellForHeight.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height;
}

@end
