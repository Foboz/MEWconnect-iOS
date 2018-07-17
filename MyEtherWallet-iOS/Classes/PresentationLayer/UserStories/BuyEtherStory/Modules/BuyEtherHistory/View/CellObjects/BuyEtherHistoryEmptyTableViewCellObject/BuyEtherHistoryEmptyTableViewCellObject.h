//
//  BuyEtherHistoryEmptyTableViewCellObject.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 06/07/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;
@import Nimbus.NICellFactory;

@interface BuyEtherHistoryEmptyTableViewCellObject : NSObject <NINibCellObject>
@property (nonatomic, strong) NSString *title;
+ (instancetype) object;
@end
