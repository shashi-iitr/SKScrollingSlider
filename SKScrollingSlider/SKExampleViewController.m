//
//  SKExampleViewController.m
//  SKScrollingSlider
//
//  Created by shashi kumar on 02/02/15.
//
//

#import "SKExampleViewController.h"
#import "FrameAccessor.h"
#import "SKExampleTableView.h"

@interface SKExampleViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *buttonTabs;
@property (nonatomic) CGSize buttonTabSize;

@end

@implementation SKExampleViewController

- (instancetype)initWithTabs:(NSArray *)tabs tabButtonSize:(CGSize)buttonSize {
    self = [super initWithTabs:tabs tabButtonSize:buttonSize];
    if (self) {
        _buttonTabs = tabs;
        _buttonTabSize = buttonSize;
        self.view.backgroundColor = [UIColor clearColor];
        [self addScrollView];
        [self setupTableView];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"Scrolling tabs";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)addScrollView {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.buttonTabSize.height * 2, width, self.view.height - self.buttonTabSize.height * 2)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor  = [UIColor clearColor];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width * [self.buttonTabs count], self.scrollView.height);
    [self.view addSubview:self.scrollView];
}

- (void)setupTableView {
    CGRect frame = CGRectMake(10, 10, self.scrollView.width - 2 * 10, self.scrollView.height - 2 * 10);
    for (NSUInteger index = 0; index < [self.buttonTabs count]; index++) {
        SKExampleTableView *tableView = [[SKExampleTableView alloc] initWithFrame:frame];
        [self.scrollView addSubview:tableView];
        frame.origin.x = CGRectGetWidth(self.scrollView.frame) * (index + 1) + 10;
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGRect visibleRect;
    visibleRect.origin = scrollView.contentOffset;
    visibleRect.size = scrollView.contentSize;
    CGFloat index = visibleRect.origin.x / self.scrollView.width;
    [self highlightButtonWithScrollIndex:floor(index)];
}

- (void)scrollToIndex:(NSInteger)index {
    CGRect frame = self.scrollView.bounds;
    frame.origin.x = CGRectGetWidth(frame) * index;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}

@end
