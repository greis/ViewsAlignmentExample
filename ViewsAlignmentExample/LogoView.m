#import "LogoView.h"
#import "ConstraintFormatter.h"

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
  id formats = @[@"label.centerY == superview.centerY",
                 @"H:|-margin-[image]-margin-[label]-margin-|",
                 @"V:|-margin-[image]-margin-|"];
  
  [self addConstraintsWithFormats:formats views:views metrics:metrics];
  
}

@end
