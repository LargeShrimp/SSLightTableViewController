//
//  SSTableViewDataSource.h
//  SSLightTableViewController
//
//  Created by taitanxiami on 16/1/13.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TableVieCellConfigBlock)(id cell, id item);
@interface SSTableViewDataSource : NSObject <UITableViewDataSource>


- (id) initWithItems:(NSArray *)items
       cellIdentifer:(NSString *)cellidentifier
     configCellBlock:(TableVieCellConfigBlock)aconfigCellBlock;

- (id) itemIndexPath:(NSIndexPath *)indexpath;

@end
