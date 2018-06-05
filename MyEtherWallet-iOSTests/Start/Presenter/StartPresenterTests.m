//
//  StartPresenterTests.m
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 14/04/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import XCTest;
@import OCMock;

#import "StartPresenter.h"

#import "StartViewInput.h"
#import "StartInteractorInput.h"
#import "StartRouterInput.h"

@interface StartPresenterTests : XCTestCase

@property (nonatomic, strong) StartPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation StartPresenterTests

#pragma mark - Config the environment

- (void)setUp {
    [super setUp];

    self.presenter = [[StartPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(StartInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(StartRouterInput));
    self.mockView = OCMProtocolMock(@protocol(StartViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - StartModuleInput Tests

#pragma mark - StartViewOutput Tests

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - StartInteractorOutput Tests

@end
