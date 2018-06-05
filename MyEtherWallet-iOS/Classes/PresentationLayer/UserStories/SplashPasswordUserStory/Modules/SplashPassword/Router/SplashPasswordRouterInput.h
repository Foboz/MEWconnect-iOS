//
//  SplashPasswordRouterInput.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 26/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;

@protocol SplashPasswordRouterInput <NSObject>
- (void) close;
- (void) openForgotPassword;
@end
