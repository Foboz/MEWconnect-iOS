//
//  NewWalletRouter.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 28/04/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import "NewWalletRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface NewWalletRouter : NSObject <NewWalletRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
