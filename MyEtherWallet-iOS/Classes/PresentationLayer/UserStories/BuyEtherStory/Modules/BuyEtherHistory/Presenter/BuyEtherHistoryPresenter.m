//
//  BuyEtherHistoryPresenter.m
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 02/07/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import "BuyEtherHistoryPresenter.h"

#import "BuyEtherHistoryViewInput.h"
#import "BuyEtherHistoryInteractorInput.h"
#import "BuyEtherHistoryRouterInput.h"

@implementation BuyEtherHistoryPresenter

#pragma mark - BuyEtherHistoryModuleInput

- (void) configureModuleWithAccount:(AccountPlainObject *)account {
  [self.interactor configureWithAccount:account];
}

#pragma mark - BuyEtherHistoryViewOutput

- (void) didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - BuyEtherHistoryInteractorOutput

- (void) didProcessCacheTransactionBatch:(CacheTransactionBatch *)cacheTransactionBatch {
  [self.view updateWithCacheTransaction:cacheTransactionBatch];
}

@end
