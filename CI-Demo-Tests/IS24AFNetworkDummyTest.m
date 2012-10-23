//
//  IS24AFNetworkDummyTest.m
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
#import <GHUnitIOS/GHUnit.h>
#import <OCMock/OCMock.h>
#import "AFNetworkDummy.h"

@interface IS24AFNetworkDummyTest : GHTestCase
@end

@implementation IS24AFNetworkDummyTest

- (id) createNetworkFactoryMockWithSuccess:(BOOL)shouldSuccess {
    id networkFactoryMock = [OCMockObject niceMockForClass:[AFNetworkDummy class]];
    
    id aFJSONRequestOperationMock = [OCMockObject niceMockForClass:[AFJSONRequestOperation class]];
    
    [[[[networkFactoryMock expect] andDo:^(NSInvocation *invocation) {
        __unsafe_unretained NSURLRequest *request;
        AFJSONSuccess success;
        AFJSONFailure failure;
        [invocation getArgument:&request atIndex:2];
        [invocation getArgument:&success atIndex:3];
        [invocation getArgument:&failure atIndex:4];
        
        if (shouldSuccess) {
            success(request, @{@"key" : @"value"});
        }
        else {
            failure(request, nil, @{@"fail" : @"some error"});
        }
        
    }] andReturn:aFJSONRequestOperationMock] JSONRequestOperationWithRequest:OCMOCK_ANY success:OCMOCK_ANY failure:OCMOCK_ANY];
    return networkFactoryMock;
}

- (void) testShouldCallSuccessBlock {
    
    id networkFactoryMock = [self createNetworkFactoryMockWithSuccess:YES];
    NSURLRequest *inputRequest = [[NSURLRequest alloc] init];
    
    [networkFactoryMock JSONRequestOperationWithRequest:inputRequest success:^(NSURLRequest *request, id JSON) {
        NSLog(@"JSON: %@",JSON);
        GHAssertEquals(inputRequest, request, @"Should be the same");
    } failure:^(NSURLRequest *request, NSError *error, id JSON) {
        GHFail(@"Should not be called");
    }];
}

- (void) testShouldCallFailureBlock {
    
    id networkFactoryMock = [self createNetworkFactoryMockWithSuccess:NO];
    NSURLRequest *inputRequest = [[NSURLRequest alloc] init];
    
    [networkFactoryMock JSONRequestOperationWithRequest:inputRequest success:^(NSURLRequest *request, id JSON) {
        GHFail(@"Should not be called");
    } failure:^(NSURLRequest *request, NSError *error, id JSON) {
        NSLog(@"JSON: %@",JSON);
        GHAssertEquals(inputRequest, request, @"Should be the same");
    }];
}

@end