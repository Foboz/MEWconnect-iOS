//
//  BuyEtherHistoryRouter.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 02/07/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import "BuyEtherHistoryRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface BuyEtherHistoryRouter : NSObject <BuyEtherHistoryRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
