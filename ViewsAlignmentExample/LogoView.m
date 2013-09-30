#import "LogoView.h"

@interface LogoView () {
  UIImageView *_imageView;
  UILabel *_label;
}

-(UIImageView *)imageView;
-(UILabel *)label;
@end

@implementation LogoView

- (id)init {
  self = [super init];
  if (self) {
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.8]];
    [self addSubview:self.imageView];
    [self addSubview:self.label];
    [self addConstraints];
  }
  return self;
}

-(UIImageView *)imageView {
  if (!_imageView) {
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hr_logo_rocket"]];
    [_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  }
  return _imageView;
}

-(UILabel *)label {
  if (!_label) {
    _label = [[UILabel alloc] init];
    [_label setText:@"Hashrocket"];
    [_label setTranslatesAutoresizingMaskIntoConstraints:NO];
  }
  return _label;
}

-(void)addConstraints {
  id views = @{@"image": self.imageView, @"label": self.label};
  id metrics = @{@"margin": @6};
  
  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[image]-margin-[label]-margin-|" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[image]-margin-|" options:0 metrics:metrics views:views]];
}

@end
