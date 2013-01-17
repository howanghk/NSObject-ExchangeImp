#import "ExchangeImp.h"
#include <objc/runtime.h>

@implementation NSObject (ExchangeImp)

+ (BOOL)exchangeMethod:(SEL)orgSelector withMethod:(SEL)newSelector
{
    Method orgMethod = class_getInstanceMethod(self, orgSelector);
    Method newMethod = class_getInstanceMethod(self, newSelector);
	
    if ((orgMethod != NULL) && (newMethod != NULL))
    {
        if (class_addMethod(self, orgSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        {
            class_replaceMethod(self, newSelector, method_getImplementation(orgMethod), method_getTypeEncoding(orgMethod));
        }
        else
        {
            method_exchangeImplementations(orgMethod, newMethod);
        }
        return YES;
    }
    return NO;
}

@end
