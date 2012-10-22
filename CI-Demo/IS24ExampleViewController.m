//
//  IS24ExampleViewController.m
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
#import "IS24ExampleViewController.h"
#import "IS24SecondViewController.h"

@interface IS24ExampleViewController ()

@end

@implementation IS24ExampleViewController

- (id)init
{
    self = [super initWithNibName:@"IS24ExampleViewController" bundle:nil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed:(id)sender {
    [self presentModalViewController:[[IS24SecondViewController alloc] init] animated:YES];
    
}
@end