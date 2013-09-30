#import "RootViewController.h"
#import "LogoView.h"
#import <Masonry/Masonry.h>

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
  [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.view);
  }];
  
  [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.equalTo(self.view);
    make.centerX.equalTo(self.view);
  }];
}

@end
