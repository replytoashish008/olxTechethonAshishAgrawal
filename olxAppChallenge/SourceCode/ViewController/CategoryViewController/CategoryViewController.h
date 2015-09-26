//
//  CategoryViewController.h
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright (c) 2015 Ashish Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryViewControllerDelegate <NSObject>

-(void)selectedCategory:(NSString *)category subCategory:(NSString *)subCategory;

@end

@interface CategoryViewController : UITableViewController


@property(weak,nonatomic)id<CategoryViewControllerDelegate> delegate;

@end
