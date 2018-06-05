//
//  Ponsomizer.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 22/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;

@protocol Ponsomizer <NSObject>
- (id)convertObject:(id)object;
- (id)convertObject:(id)object ignoringProperties:(NSArray *)properties;
@end
