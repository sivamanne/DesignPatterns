//
//  ViewController.m
//  DesignPatterns
//
//  Created by Siva Manne on 21/10/15.
//  Copyright © 2015 Siva Manne. All rights reserved.
//

#import "ViewController.h"
#import "ArrayDataSource.h"
#import <pop/Pop.h>
#import "PatternCell.h"

static NSString *cellIdentifier = @"Cell";
@interface ViewController ()<UITableViewDelegate>
{
    ArrayDataSource *patternsArrayDataSource;
}
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *patterns;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _patterns = [NSMutableArray new];
    NSArray *patternNames = @[@"Singleton"];
    [self.patterns addObjectsFromArray:patternNames];
    
    [self.tableView registerClass:[PatternCell class]
           forCellReuseIdentifier:cellIdentifier];
    void (^configureCell)(PatternCell*, NSString*) = ^(PatternCell* cell, NSString* patternName) {
        cell.textLabel.text = patternName;
    };
    patternsArrayDataSource = [[ArrayDataSource alloc] initWithItems:self.patterns
                                                    cellIdentifier:cellIdentifier
                                                configureCellBlock:configureCell];
    self.tableView.dataSource = patternsArrayDataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected = %@",self.patterns[indexPath.row]);
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
