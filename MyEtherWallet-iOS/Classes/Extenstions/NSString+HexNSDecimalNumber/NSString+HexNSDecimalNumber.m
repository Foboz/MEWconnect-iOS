//
//  NSString+HexNSDecimalNumber.m
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 04/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import "NSString+HexNSDecimalNumber.h"
#import "MyEtherWallet_iOS-Swift.h"

@implementation NSString (HexNSDecimalNumber)

- (NSDecimalNumber *) decimalNumberFromHexRepresentation {
  NSString *decimal = [self hexStringToDecimalString];
  if (decimal) {
    return [NSDecimalNumber decimalNumberWithString:decimal];
  }
  return nil;
}

@end
