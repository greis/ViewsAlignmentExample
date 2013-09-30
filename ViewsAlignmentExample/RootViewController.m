#import "RootViewController.h"
#import "LogoView.h"

@interface RootViewController () {
  LogoView *_logoView;
  UIImageView *_backgroundView;
}

-(LogoView *)logoView;
-(UIImageView *)backgroundView;
@end

@implementation RootViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view addSubview:self.backgroundView];
  [self.view addSubview:self.logoView];
  [self addConstraints];
}

-(UIImageView *)backgroundView {
  if (!_backgroundView) {
    _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"group-picture"]];
    [_backgroundView setContentMode:UIViewContentModeScaleAspectFill];
    [_backgroundView setTranslatesAutoresizingMaskIntoConstraints:NO];
  }
  return _backgroundView;
}

-(LogoView *)logoView {
  if (!_logoView) {
    _logoView = [[LogoView alloc] init];
    [_logoView setTranslatesAutoresizingMaskIntoConstraints:NO];
  }
  return _logoView;
}

-(void)addConstraints {
  id views = @{@"logo": self.logoView, @"background": self.backgroundView};
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[background]|" options:0 metrics:nil views:views]];
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[background]|" options:0 metrics:nil views:views]];
  
  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
}

@end
