//
//  ResponseValidatorsFactory.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 21/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;

#import "ResponseValidationType.h"

@protocol ResponseValidator;

@protocol ResponseValidatorsFactory <NSObject>
- (id<ResponseValidator>)validatorWithType:(NSNumber *)type;
@end
