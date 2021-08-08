

#import "NSString+Localization.h"

@implementation NSString (Localization)

- (NSString *)localizedString {
    return [[NSBundle mainBundle] localizedStringForKey:self value:self table:nil];
}

@end
