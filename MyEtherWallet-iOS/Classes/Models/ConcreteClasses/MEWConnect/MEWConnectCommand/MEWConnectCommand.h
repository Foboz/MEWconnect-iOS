//
//  MEWConnectCommand.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 03/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;

#import "MEWConnectCommandTypes.h"

@class MEWConnectTransaction;

@interface MEWConnectCommand : NSObject
@property (nonatomic) MEWConnectCommandType type;
@property (nonatomic, strong) id data;
- (MEWConnectTransaction *) transaction;
@end
