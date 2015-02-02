//
//  SKExampleTableViewCell.h
//  SKScrollingSlider
//
//  Created by shashi kumar on 02/02/15.
//
//

#import <UIKit/UIKit.h>

@interface SKExampleTableViewCell : UITableViewCell

+ (NSString *)reuseIdentifier;
+ (CGFloat)height;

- (void)configureWithRowIndex:(NSUInteger)index;

@end
