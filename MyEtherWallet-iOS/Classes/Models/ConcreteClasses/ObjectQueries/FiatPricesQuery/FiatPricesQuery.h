//
//  FiatPricesQuery.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 02/07/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FiatPricesQuery : NSObject
@property (nonatomic, strong) NSSet *symbols;
@end
