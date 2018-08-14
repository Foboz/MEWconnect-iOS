//
//  SplashPasswordModuleOutput.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 28/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;
@import ViperMcFlurryX;

@protocol SplashPasswordModuleOutput <RamblerViperModuleOutput>
- (void) passwordDidEntered:(NSString *)password;
@end
