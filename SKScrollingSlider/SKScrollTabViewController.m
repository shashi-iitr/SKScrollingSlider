//
//  SKScrollTabViewController.m
//  SKScrollingSlider
//
//  Created by shashi kumar on 02/02/15.
//
//

#import "SKScrollTabViewController.h"
#import "FrameAccessor.h"
#import "SKButton.h"

CGFloat kTabButtonMinWidth = 60.f;

@interface SKScrollTabViewController ()

@property (nonatomic, strong) UIScrollView *skScrollView;
@property (nonatomic) CGSize buttonSize;
@property (nonatomic, strong) NSArray *tabs;
@property (nonatomic, strong) NSMutableArray *allocatedButtons;

@end

@implementation SKScrollTabViewController

- (instancetype)initWithTabs:(NSArray *)tabs tabButtonSize:(CGSize)buttonSize {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _buttonSize = buttonSize;
        _tabs = tabs;
        
        CGFloat usedWidth = self.buttonSize.width < kTabButtonMinWidth ? kTabButtonMinWidth : _buttonSize.width;
        _buttonSize = CGSizeMake(usedWidth, _buttonSize.height);
        
        [self setupScrollView];
        [self setupTabButtons];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self highlightButtonWithScrollIndex:0];
}

- (void)setupScrollView {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.skScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, width, self.buttonSize.height)];
    self.skScrollView.showsHorizontalScrollIndicator = NO;
    self.skScrollView.showsVerticalScrollIndicator = NO;
    self.skScrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.skScrollView];
}

- (void)setupTabButtons {
    CGRect tabButtonFrame = CGRectMake(0, 0, self.buttonSize.width, self.buttonSize.height);
    
    for (NSUInteger index = 0; index < (NSUInteger)[self.tabs count]; index++) {
        SKButton *button = [self buttonWithFrame:tabButtonFrame title:self.tabs[(NSUInteger)index] tag:index];
        [self.skScrollView addSubview:button];
        [self.allocatedButtons addObject:button];
        button.backgroundColor = [UIColor clearColor];
        tabButtonFrame.origin.x = self.buttonSize.width * (index + 1);
    }
    
    self.skScrollView.contentSize = CGSizeMake(tabButtonFrame.origin.x, self.buttonSize.height);
}

- (SKButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title tag:(NSUInteger)tag {
    SKButton *button = [[SKButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = (NSInteger)tag;
    
    return button;
}

#pragma mark - action

- (void)buttonDidTap:(SKButton *)sender {
    [self scrollToIndex:sender.tag];
    [self showBottomImageForSelectedButton:sender];
}

#pragma mark - methods

- (void)highlightButtonWithScrollIndex:(CGFloat)index {
    [self scrollSKScrollViewToIndex:index];
    [self showBottomImageForSelectedButton:self.allocatedButtons[(NSUInteger)index]];
}

- (void)scrollSKScrollViewToIndex:(CGFloat)index {
    NSLog(@"index = %f", index);
    CGRect frame = CGRectMake(self.skScrollView.width - self.buttonSize.width, 0, self.buttonSize.width, self.buttonSize.height);
    frame.origin.x = CGRectGetWidth(frame) * index;
    NSLog(@"frame = %@", NSStringFromCGRect(frame));
    [self.skScrollView scrollRectToVisible:frame animated:YES];
}

- (void)scrollToIndex:(NSInteger)index {
    // abstract
}

- (void)showBottomImageForSelectedButton:(SKButton *)sender {
    for (SKButton *button in self.allocatedButtons) {
        if (button.tag == sender.tag) {
            [button buttonSelected:YES];
            button.selected = YES;
        } else {
            [button buttonSelected:NO];
            button.selected = NO;
        }
    }
}

#pragma mark - LazyInitializers

- (NSMutableArray *)allocatedButtons {
    if (!_allocatedButtons) {
        _allocatedButtons = [[NSMutableArray alloc] init];
    }
    
    return _allocatedButtons;
}

@end
