//
//  BuyEtherWebInteractorInput.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 05/07/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;

@class SimplexOrder;
@class AccountPlainObject;

@protocol BuyEtherWebInteractorInput <NSObject>
- (void) configurateWithOrder:(SimplexOrder *)order account:(AccountPlainObject *)account;
- (NSURLRequest *) obtainInitialRequest;
@end
