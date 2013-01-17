@interface NSObject (ExchangeImp)

+ (BOOL)exchangeMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
