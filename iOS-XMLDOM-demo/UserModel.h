//
//  UserModel.h
//  iOS-XMLDOM-demo
//
//  Created by kevin on 13-5-28.
//  Copyright (c) 2013年 BJQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (retain, nonatomic) NSMutableArray *muarr;
@property (retain, nonatomic) NSMutableArray *muarr_Country;
+ (UserModel *)shareUserModel;

- (void)printXMLUseDOM;
@end
