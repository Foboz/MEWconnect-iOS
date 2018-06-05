//
//  NSString+Hex.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 22/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hex)
- (NSString *) parseHexString;
- (NSUInteger) parseHexUInt;
@end
