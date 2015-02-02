//
//  SKButton.m
//  SKScrollingSlider
//
//  Created by shashi kumar on 02/02/15.
//
//

#import "SKButton.h"
#import "FrameAccessor.h"

static CGFloat const kBottomImageViewHeight = 10.f;

@interface SKButton ()
@property (nonatomic, strong) UIImageView *bottomImageView;
@end

@implementation SKButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
        [self addBottomImageView];
    }
    
    return self;
}

- (void)commonInit {
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithRed:33.f / 255.f green:159.f / 255.f blue:200.f / 255.f alpha:1] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorWithRed:33.f / 255.f green:159.f / 255.f blue:200.f / 255.f alpha:1] forState:UIControlStateSelected];
    self.titleLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:13];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)addBottomImageView {
    self.bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.height - kBottomImageViewHeight / 2, self.width, kBottomImageViewHeight / 2)];
    UIImage *image = [[UIImage imageNamed:@"tab_bar_indicator"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)  resizingMode:UIImageResizingModeStretch];
    self.bottomImageView.image = image;
    [self addSubview:self.bottomImageView];
    //    self.bottomImageView.hidden = YES;
}

- (void)buttonSelected:(BOOL)isSelected {
    if (isSelected) {
        self.bottomImageView.hidden = NO;
        self.backgroundColor = [UIColor colorWithWhite:0.5f alpha:0.5f];
    } else {
        self.bottomImageView.hidden = YES;
        self.backgroundColor = [UIColor clearColor];
    }
}

@end
