//
//  SKExampleTableView.m
//  SKScrollingSlider
//
//  Created by shashi kumar on 02/02/15.
//
//

#import "SKExampleTableView.h"
#import "SKExampleTableViewCell.h"

@interface SKExampleTableView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SKExampleTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerTableView];
        
    }
    
    return self;
}

- (void)registerTableView {
    [self registerClass:[SKExampleTableViewCell class] forCellReuseIdentifier:[SKExampleTableViewCell reuseIdentifier]];
}


#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SKExampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SKExampleTableViewCell reuseIdentifier] forIndexPath:indexPath];
    [cell configureWithRowIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [SKExampleTableViewCell height];
}

@end
