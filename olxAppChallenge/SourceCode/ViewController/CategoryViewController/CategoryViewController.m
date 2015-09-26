//
//  CategoryViewController.m
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright (c) 2015 Ashish Agrawal. All rights reserved.
//

#import "CategoryViewController.h"
#import <CoreData/CoreData.h>

@interface CategoryViewController ()
{
    NSDictionary *dictionary;
}
@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array1  = [NSArray arrayWithObjects:@"Windows",@"Nokia",@"Iphone",@"Blackberry",@"Android", nil];
    NSArray *array2  = [NSArray arrayWithObjects:@"Fiat",@"Honda",@"Maruti",@"Hyundai",@"Volkswagon",@"Skoda", nil];
    NSArray *array3  = [NSArray arrayWithObjects:@"Air Conditioner",@"TV",@"Refrigerator",@"Camera",@"Washing Machine", nil];
    
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:array1,@"Mobile",array2,@"Cars",array3,@"Electronics", nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [[dictionary allKeys] count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section)
        return 1;
    
    NSInteger allKeyCount = [[dictionary objectForKey:[[dictionary allKeys]objectAtIndex:section]] count];
    return allKeyCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    if (indexPath.row==0) {
        cell.contentView.backgroundColor = [UIColor grayColor];
        if (indexPath.section == 0)
            cell.textLabel.text = @"All";
        else
            cell.textLabel.text = [[dictionary allKeys]objectAtIndex:indexPath.section];
    }
    else
    {
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.text = [[dictionary objectForKey:[[dictionary allKeys]objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    }

 
 // Configure the cell...
 
 return cell;
}

#pragma mark- UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([_delegate respondsToSelector:@selector(selectedCategory:subCategory:)])
    {
        if (indexPath.section ==0) {
            [_delegate selectedCategory:@"ALL" subCategory:nil];
        }
        else
        {
            NSString *category = [[dictionary allKeys]objectAtIndex:indexPath.section];
            [_delegate selectedCategory:category subCategory:[[dictionary objectForKey:category] objectAtIndex:indexPath.row]];
        }
    }
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


-(void)getFetchResultController
{

}


#pragma mark - IBAction

-(void)btnClickOnSection:(UIButton *)btn
{
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
