//
//  IS24ExampleMockTest.h
//  CI-Demo
//
//  Created by Schulze, Felix on 01.10.2012.
//  Copyright (c) 2012 ImmobilienScout24. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <GHUnitIOS/GHUnit.h>
#import <OCMock/OCMock.h>
#import "IS24SampleObject.h"

@interface IS24ExampleMockTest : GHTestCase
@end

@implementation IS24ExampleMockTest

- (void) testShouldGetExpectedValue {
    IS24SampleObject *object = [[IS24SampleObject alloc] init];
    GHAssertEqualStrings(@"string is testvalue", [object someMethod:@"testvalue"], @"Should get testvalue string");
    GHAssertEqualStrings(@"string is other value", [object someMethod:@"othervalue"], @"Should get other value string");
}

- (void) testShouldUseMockForExpectedValue {
    id urlRequestMock = [OCMockObject niceMockForClass:[NSMutableURLRequest class]];
    [[urlRequestMock expect] setHTTPMethod:@"GET"];
    [[urlRequestMock reject] setHTTPMethod:@"POST"];
    //[[urlRequestMock reject] setHTTPBody:OCMOCK_ANY];
    
    IS24SampleObject *object = [[IS24SampleObject alloc] init];
    
    [object someModification:urlRequestMock];
    
    GHAssertNoThrow([urlRequestMock verify], @"Should not throw exception");
}

@end


