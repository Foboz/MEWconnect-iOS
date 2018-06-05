//
//  ForgotPasswordInteractor.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 27/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import "ForgotPasswordInteractorInput.h"

@protocol ForgotPasswordInteractorOutput;

@interface ForgotPasswordInteractor : NSObject <ForgotPasswordInteractorInput>

@property (nonatomic, weak) id<ForgotPasswordInteractorOutput> output;

@end
