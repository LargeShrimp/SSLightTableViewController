//
//  SSTableViewDataSource.m
//  SSLightTableViewController
//
//  Created by taitanxiami on 16/1/13.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "SSTableViewDataSource.h"
#import "SSTableViewCell.h"
@interface SSTableViewDataSource ()

@property (nonatomic,strong) NSArray *items;
@property (nonatomic, copy)  NSString *cellIdentifier;
@property (nonatomic, copy)  TableVieCellConfigBlock configureCellBlock;
@end

@implementation SSTableViewDataSource

-(instancetype)init {
    return nil;
}

-(id)initWithItems:(NSArray *)items cellIdentifer:(NSString *)cellidentifier configCellBlock:(TableVieCellConfigBlock)aconfigCellBlock {
    
    if (self = [super init]) {
        
        self.items = items;
        self.cellIdentifier = cellidentifier;
        self.configureCellBlock = aconfigCellBlock;
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SSTableViewCell" owner:self options:nil] lastObject];
    }
    id item = [self itemIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

-(id)itemIndexPath:(NSIndexPath *)indexpath {
    return self.items[indexpath.row];
}
@end
