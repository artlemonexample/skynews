//
//  LSNewsItem.h
//  SkyNews
//
//  Created by Oleksandr Kurtsev on 24.05.17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LSCategory.h"

@interface LSNewsItem : NSObject

@property (nonatomic, strong) NSString* linkNews;
@property (nonatomic, strong) NSString* newsDescription;
@property (nonatomic, strong) NSString* dateCreateNews;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* imageLink;
@property (nonatomic, strong) LSCategory *category;

@end
