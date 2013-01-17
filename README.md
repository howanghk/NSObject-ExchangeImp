NSObject-ExchangeImp
====================

Exchange implementations of 2 methods

Usage
-----

 1. Add a category of the class you want to exchange implementation, and implement your methods
 2. call `+ (BOOL)exchangeMethod:(SEL)orgSelector withMethod:(SEL)newSelector` to exchange the implementation of the original method and your method
 3. if you need to call the original methods, call your new method instead. (as it have been exchanged)

Example
-------
Test code:

	- (void)test
	{
		NSLog(@"UDID before exchange: %@", [[UIDevice currentDevice] uniqueIdentifier]);
		[UIDevice exchangeMethod:@selector(uniqueIdentifier) withMethod:@selector(fakeUniqueIdentifier)];
		NSLog(@"UDID after exchange: %@", [[UIDevice currentDevice] uniqueIdentifier]);
	}

The category containing the method to exchange:

	@implementation UIDevice (FakeUDID)
	
	- (NSString *)fakeUniqueIdentifier
	{
		return @"0000000000000000000000000000000000000000";
	}
	
	@end
