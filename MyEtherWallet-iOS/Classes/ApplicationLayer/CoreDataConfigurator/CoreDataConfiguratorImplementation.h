//
//  CoreDataConfiguratorImplementation.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 29/06/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import "CoreDataConfigurator.h"

@protocol KeychainService;

@interface CoreDataConfiguratorImplementation : NSObject <CoreDataConfigurator>
@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) id <KeychainService> keychainService;
@end
