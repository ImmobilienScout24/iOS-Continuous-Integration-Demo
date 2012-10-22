//
//  IS24FirstTestScenario.m
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

#import "IS24FirstTestScenario.h"
#import "KIFTestStep.h"

@implementation IS24FirstTestScenario
+ (KIFTestScenario *)scenarioToEnterUserData {
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:[NSString stringWithFormat:@"Enter user data"]];
    
    scenario.stepsToSetUp = @[[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Button"]];
    
    [scenario addStep:[KIFTestStep stepToEnterText:@"Felix" intoViewWithAccessibilityLabel:@"firstname"]];
    [scenario addStep:[KIFTestStep stepToEnterText:@"Schulze" intoViewWithAccessibilityLabel:@"lastname"]];
    [scenario addStep:[KIFTestStep stepToEnterText:@"x2on" intoViewWithAccessibilityLabel:@"twitter"]];
    
    scenario.stepsToTearDown = @[[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Cancel"]];
    
    return scenario;
}
@end
