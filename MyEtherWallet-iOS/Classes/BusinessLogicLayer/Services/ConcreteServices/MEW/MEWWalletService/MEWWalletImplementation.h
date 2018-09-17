//
//  MEWWalletImplementation.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 29/04/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import "MEWwallet.h"

@class Web3Wrapper;

@interface MEWWalletImplementation : NSObject <MEWwallet>
@property (nonatomic, strong) Web3Wrapper *wrapper;
@end
