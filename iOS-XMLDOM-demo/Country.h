//
//  Country.h
//  iOS-XMLDOM-demo
//
//  Created by kevin on 13-5-28.
//  Copyright (c) 2013年 BJQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject
{
    NSString *cid;
    NSString *cname;
}
@property (retain, nonatomic) NSString *cid;
@property (retain, nonatomic) NSString *cname;
@end
