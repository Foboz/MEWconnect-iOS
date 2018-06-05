//
//  MEWConnectFacadeImplementation.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 19/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import "MEWConnectFacade.h"

@protocol MEWConnectService;
@protocol MEWCrypto;

@interface MEWConnectFacadeImplementation : NSObject <MEWConnectFacade>
@property (nonatomic, strong) id <MEWConnectService> connectService;
@property (nonatomic, strong) id <MEWCrypto> cryptoService;
@end
