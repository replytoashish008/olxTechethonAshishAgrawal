//
//  HomeViewController.m
//  olxAppChallenge
//
//  Created by Ashish Agrawal on 9/26/15.
//  Copyright (c) 2015 Ashish Agrawal. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "CommonUtlilities.h"
#import "CategoryViewController.h"

@interface HomeViewController ()<UIActionSheetDelegate,CategoryViewControllerDelegate>
{
    NSArray *arrayListOfProduct;
    
    NSArray *arrayFilter;
    NSArray *arraySearch;
    HomeCell *cellForHeight;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrayListOfProduct = [CommonUtlilities containAllProduct];
    arrayFilter = arrayListOfProduct;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchDisplayController.searchResultsTableView == tableView)
        return arraySearch.count;
    
    return arrayFilter.count;
}

-(UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    HomeCell *cell;
    if (self.searchDisplayController.searchResultsTableView == tableView)
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    else
        cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.btnTick.tag = indexPath.row +1;
    
    if (self.searchDisplayController.searchResultsTableView == tableView)
        [cell cellDetailAtIndexPathOlxProductDetial:[arraySearch objectAtIndex:indexPath.row]];
    else
        [cell cellDetailAtIndexPathOlxProductDetial:[arrayFilter objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(nonnull UITableView *)tableView estimatedHeightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    if (!cellForHeight)
        cellForHeight = [[[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:self options:nil] objectAtIndex:0];
    
    if (self.searchDisplayController.searchResultsTableView == tableView)
        [cellForHeight cellDetailAtIndexPathOlxProductDetial:[arraySearch objectAtIndex:indexPath.row]];
    else
        [cellForHeight cellDetailAtIndexPathOlxProductDetial:[arrayFilter objectAtIndex:indexPath.row]];
    

    return[CommonUtlilities calculateHeightOfCell:cellForHeight];
}


#pragma mark - UISearchControllerDelegate

-(BOOL)searchBar:(nonnull UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(nonnull NSString *)text
{
    NSString *string = [searchBar.text stringByReplacingCharactersInRange:range withString:text];
    NSString *categoryformatString = [NSString stringWithFormat:@"category contains[c] '%@'", string];
    NSPredicate *categoryPredicate = [NSPredicate predicateWithFormat:categoryformatString];
    
    NSString *typeFormatString = [NSString stringWithFormat:@"subCategory contains[c] '%@'", string];
    NSPredicate *typePredicate = [NSPredicate predicateWithFormat:typeFormatString];
    
    NSString *nameFormatString = [NSString stringWithFormat:@"productName contains[c] '%@'", string];
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:nameFormatString];
    
    NSPredicate * combinePredicate = [NSCompoundPredicate orPredicateWithSubpredicates:[NSArray arrayWithObjects:namePredicate, typePredicate,categoryPredicate, nil]];
    
    arraySearch = [arrayListOfProduct filteredArrayUsingPredicate:combinePredicate];
    [self.searchDisplayController.searchResultsTableView reloadData];
    
    return YES;
}

#pragma mark - UISearchBarDelegate

-(void)searchBarCancelButtonClicked:(nonnull UISearchBar *)searchBar
{
    arraySearch = nil;
}


#pragma mark - IBAction

-(IBAction)btnClickOnSort:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Filter" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Newest",@"How Old",@"Price", nil];
    [actionSheet showInView:self.navigationController.view];
    

}

-(IBAction)btnClickOnCategory:(id)sender
{
   
    
    
}

#pragma mark - UIActionSheetDelegate

-(void)actionSheet:(nonnull UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0) {
        [self setSortTableView:@"price"];
        
    } else if (buttonIndex == 1) {
        [self setSortTableView:@"dateOfPost"];

    } else if (buttonIndex == 2) {
        [self setSortTableView:@"broughtDate"];

    }
}

-(void)setSortTableView:(NSString *)string
{
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:string ascending:NO];
    [arrayFilter sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    [self.tableView reloadData];
}


#pragma mark - CategoryViewControllerDelegate

-(void)selectedCategory:(NSString *)category subCategory:(NSString *)subCategory
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
