#import "RootViewController.h"
#import "LogoView.h"
#import "ConstraintFormatter.h"

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
  }
  return _backgroundView;
}

-(LogoView *)logoView {
  if (!_logoView) {
    _logoView = [[LogoView alloc] init];
  }
  return _logoView;
}

-(void)addConstraints {
  id views = @{@"logo": self.logoView, @"background": self.backgroundView};
  id metrics = @{@"margin": @(10)};
  id formats = @[@"logo.centerX == superview.centerX",
                 @"logo.bottom == superview.bottom",
                 @"H:|-margin-[background]|",
                 @"V:|[background]|"];
  
  [self.view addConstraintsWithFormats:formats views:views metrics:metrics];
  
}

@end
