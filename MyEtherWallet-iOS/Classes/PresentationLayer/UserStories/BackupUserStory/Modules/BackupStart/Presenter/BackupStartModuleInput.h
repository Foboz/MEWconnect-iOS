//
//  BackupStartModuleInput.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 23/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;
@import ViperMcFlurryX;

@class AccountPlainObject;

@protocol BackupStartModuleInput <RamblerViperModuleInput>

- (void) configureModuleWithAccount:(AccountPlainObject *)account;

@end
