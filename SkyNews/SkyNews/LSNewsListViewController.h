//
//  LSNewsListViewController.h
//  SkyNews
//
//  Created by Oleksandr Kurtsev on 24.05.17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSCategory.h"

@interface LSNewsListViewController : UITableViewController

@property (strong, nonatomic) LSCategory* category;

@end
