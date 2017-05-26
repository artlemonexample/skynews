//
//  LSDataProvide.h
//  SkyNews
//
//  Created by Oleksandr Kurtsev on 24.05.17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSCategory.h"

@interface LSDataProvide : NSObject

+ (void)downloadData:(LSCategory*)category completion:(void(^)(NSArray *resultArray))completion;

@end
