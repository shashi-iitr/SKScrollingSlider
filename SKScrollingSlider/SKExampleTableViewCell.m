//
//  SKExampleTableViewCell.m
//  SKScrollingSlider
//
//  Created by shashi kumar on 02/02/15.
//
//

#import "SKExampleTableViewCell.h"

@implementation SKExampleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    
    return self;
}

- (void)configureWithRowIndex:(NSUInteger)index {
    self.textLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)index];
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (CGFloat)height {
    return 44.f;
}

@end
