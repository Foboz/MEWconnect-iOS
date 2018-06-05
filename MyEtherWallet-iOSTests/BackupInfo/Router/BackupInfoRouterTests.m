//
//  BackupInfoRouterTests.m
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 23/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import XCTest;
@import OCMock;

#import "BackupInfoRouter.h"

@interface BackupInfoRouterTests : XCTestCase

@property (nonatomic, strong) BackupInfoRouter *router;

@end

@implementation BackupInfoRouterTests

#pragma mark - Config the environment

- (void)setUp {
    [super setUp];

    self.router = [[BackupInfoRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
