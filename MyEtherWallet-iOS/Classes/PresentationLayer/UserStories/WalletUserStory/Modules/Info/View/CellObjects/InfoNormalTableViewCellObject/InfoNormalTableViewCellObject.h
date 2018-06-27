//
//  InfoNormalTableViewCellObject.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 24/06/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;
@import Nimbus.NimbusModels;

#import "CellObjectAction.h"

typedef NS_ENUM(short, InfoNormalTableViewCellObjectType) {
  InfoNormalTableViewCellObjectTypeContact            = 0,
  InfoNormalTableViewCellObjectTypeKnowledgeBase      = 1,
  InfoNormalTableViewCellObjectTypePrivateAndTerms    = 2,
  InfoNormalTableViewCellObjectTypeMyEtherWalletCom   = 3,
};

@interface InfoNormalTableViewCellObject : NSObject <NINibCellObject, NICellObject, CellObjectAction>
@property (nonatomic, readonly) InfoNormalTableViewCellObjectType type;
@property (nonatomic, strong, readonly) NSString *title;
+ (instancetype) objectWithType:(InfoNormalTableViewCellObjectType)type;
@end
