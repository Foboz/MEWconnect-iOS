//
//  DeclinedTransactionRouter.m
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 28/04/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import ViperMcFlurry;

#import "DeclinedTransactionRouter.h"

static NSString *const kDeclinedTransactionToHomeUnwindSegueIdentifier = @"DeclinedTransactionToHomeUnwindSegueIdentifier";

@implementation DeclinedTransactionRouter

#pragma mark - DeclinedTransactionRouterInput

- (void)close {
  [[self.transitionHandler openModuleUsingSegue:kDeclinedTransactionToHomeUnwindSegueIdentifier] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<RamblerViperModuleInput> moduleInput) {
    return nil;
  }];
}

@end
