//
//  UserModel.m
//  iOS-XMLDOM-demo
//
//  Created by kevin on 13-5-28.
//  Copyright (c) 2013年 BJQ. All rights reserved.
//

#import "UserModel.h"
#import "GDataXMLNode.h"
#import "Citys.h"
#import "Country.h"


#define kCountry @"Country"
#define kProvince @"Province"
#define kRegionID @"RegionID"
#define kRegionName @"RegionName"


@implementation UserModel
static UserModel *userModel = nil;

+ (UserModel *)shareUserModel
{
    @synchronized (self) {
        if (userModel == nil) {
            userModel = [[UserModel alloc] init];
        }
    }
    return userModel;
}

- (id) init
{
    self = [super init];
    if (self != nil) {
        self.muarr = [NSMutableArray array];
        self.muarr_Country = [NSMutableArray array];
    }
    return self;
}

- (void)printXMLUseDOM
{
    //1 得到文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //2 取出根节点
    GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:nil ];    
    GDataXMLElement *rootElement = [xmlDoc rootElement];

    //3 找到子节点，若多个，则循环

    NSArray *ciyts = [rootElement elementsForName:kProvince];//elementsForName 返回值是一个数组
    //循环取出每个 ciyt 相关的属性
    for (GDataXMLElement *city in ciyts) {

        Citys *acity = [[Citys alloc] init];
        
        //cityName
        NSString *cityName = [[[city elementsForName:kRegionName] objectAtIndex:0] stringValue];
        acity.cname = cityName;
        //cityID
        NSString *cityID = [[[city elementsForName:kRegionID] objectAtIndex:0] stringValue];
        acity.cid = cityID;
        [self.muarr addObject:acity];
    }
    
    
    NSArray *countrys = [rootElement elementsForName:kCountry];//elementsForName 返回值是一个数组
    //循环取出每个 ciyt 相关的属性
    for (GDataXMLElement *country in countrys) {
        
        Country *acountry = [[Country alloc] init];
        //cityName
        NSString *countryName = [[[country elementsForName:kRegionName] objectAtIndex:0] stringValue];
        acountry.cname = countryName;
        //cityID
        NSString *countryID = [[[country elementsForName:kRegionID] objectAtIndex:0] stringValue];
        acountry.cid = countryID;
        [self.muarr_Country addObject:acountry];
    }
}
@end
