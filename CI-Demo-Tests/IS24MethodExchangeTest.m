//
//  IS24MethodExchangeTest.h
//  CI-Demo
//
//  Created by Schulze, Felix on 23.10.12.
//  Copyright (c) 2012 ImmobilienScout24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>
#import <OCMock/OCMock.h>
#import "IS24Static.h"
#import <objc/runtime.h>

@interface IS24MethodExchangeTest : GHTestCase
@end

@implementation IS24MethodExchangeTest

- (NSString *) someStaticMockMethod {
    return @"Static Mock Method";
}

- (void) testShouldExchangeMethods {
    GHAssertEqualStrings(@"Static Method", [IS24Static someStaticMethod], @"Should be same");
    Method origMethod = class_getClassMethod([IS24Static class], @selector(someStaticMethod));
    Method mockMethod = class_getInstanceMethod([self class], @selector(someStaticMockMethod));
    method_exchangeImplementations(origMethod, mockMethod);
    
    GHAssertEqualStrings(@"Static Mock Method", [IS24Static someStaticMethod], @"Should be same");
    //Don't forget to reset:
    method_exchangeImplementations(mockMethod, origMethod);
}

- (void) testShouldUseStaticMethodAfter {
    GHAssertEqualStrings(@"Static Method", [IS24Static someStaticMethod], @"Should be same");
}

@end