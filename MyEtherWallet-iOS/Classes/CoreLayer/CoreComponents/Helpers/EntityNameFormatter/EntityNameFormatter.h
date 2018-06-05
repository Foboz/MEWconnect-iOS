//
//  EntityNameFormatter.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 22/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;

@protocol EntityNameFormatter <NSObject>
- (Class)transformToClassEntityName:(NSString *)entityName;
- (NSString *)transformToEntityNameClass:(Class)entityClass;
@end
