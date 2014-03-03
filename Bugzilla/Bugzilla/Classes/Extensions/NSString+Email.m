#import "NSString+Email.h"


#pragma mark Class Definition

@implementation NSString (Email)


#pragma mark -
#pragma mark Public Methods

- (BOOL)isValidEmailAddress
{
	NSString *validEmailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	
    NSPredicate *validEmailPredicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", 
		validEmailRegex];
    
	BOOL isValidEmailAddress = [validEmailPredicate evaluateWithObject: self];
	
	return isValidEmailAddress;
}


@end // @implementation NSString (Email)