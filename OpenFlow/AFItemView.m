/**
 * Copyright (c) 2009 Alex Fajkowski, Apparent Logic LLC
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */
#import "AFItemView.h"
#import <QuartzCore/QuartzCore.h>
#import "AFOpenFlowConstants.h"


@implementation AFItemView
@synthesize number;
@synthesize imageView;

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.opaque = YES;
	
		// Image View
		self.imageView = [[[UIImageView alloc] initWithFrame:frame] autorelease];
		self.imageView.opaque = YES;
		self.imageView.userInteractionEnabled = NO; //Needed for iOS 3.0, covers steal touch events otherwise.  
		self.userInteractionEnabled = NO; //Needed for iOS 3.0, covers steal touch events otherwise.
		[self addSubview:imageView];
	}
	
	return self;
}

- (void)setImage:(UIImage *)newImage {
	[self.imageView setImage:newImage];
	self.frame = CGRectMake(0, 0, newImage.size.width, newImage.size.height);
}

- (void)setFrame:(CGRect)newFrame {
	[super setFrame:newFrame];
	[self.imageView setFrame:newFrame];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"AFItemView - Cover %d layer position: %0.0f:%0.0f:%0.0f", self.number,
			self.layer.position.x, self.layer.position.y, self.layer.zPosition]; 
}

- (void)dealloc {
	self.imageView = nil; 
	[super dealloc];
}

@end