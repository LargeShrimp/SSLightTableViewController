//
//  SSTableViewCell+ConfigCell.m
//  SSLightTableViewController
//
//  Created by taitanxiami on 16/1/13.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "SSTableViewCell+ConfigCell.h"

@implementation SSTableViewCell (ConfigCell)

- (void)configCellWithModel:(CustomModel *)model {
    
    self.SSTileLabel.text = model.title;
}
@end
