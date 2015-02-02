//
//  SKScrollTabViewController.h
//  SKScrollingSlider
//
//  Created by shashi kumar on 02/02/15.
//
//

#import <UIKit/UIKit.h>

@interface SKScrollTabViewController : UIViewController

- (instancetype)initWithTabs:(NSArray *)tabs tabButtonSize:(CGSize)buttonSize;
- (void)scrollToIndex:(NSInteger)index;
- (void)highlightButtonWithScrollIndex:(CGFloat)index;

@end
