//
//  LSDataProvide.m
//  SkyNews
//
//  Created by Oleksandr Kurtsev on 24.05.17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSDataProvide.h"
#import "LSNewsItem.h"

#import <AFNetworking/AFImageDownloader.h>
#import <AFNetworking/AFNetworking.h>
#import <Ono/Ono.h>

@implementation LSDataProvide

+ (void)downloadData:(LSCategory*)category completion:(void(^)(NSArray *resultArray))completion {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:category.link]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSArray *result = [self newsArrayFromSN:filePath category:category];
        if (completion) {
            completion(result);
        }
        NSLog(@"%@", result);
    }];
    [downloadTask resume];
    
}

+   (NSArray*)newsArrayFromSN:(NSURL*)filePath category:(LSCategory *)category {
    
    NSError *error = nil;
    NSMutableArray *result = [NSMutableArray array];
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithData:[NSData dataWithContentsOfURL:filePath] error:&error];
    ONOXMLElement *channel = [document.rootElement firstChildWithTag:@"channel"];
    for (ONOXMLElement *element in channel.children) {
        if ([element.tag isEqualToString:@"item"]) {
            LSNewsItem *newsItem = [LSNewsItem new];
            newsItem.title =  [element firstChildWithTag:@"title"].stringValue;
            newsItem.newsDescription = [element firstChildWithTag:@"description"].stringValue;
            newsItem.dateCreateNews = [element firstChildWithTag:@"pubDate"].stringValue;
            newsItem.linkNews = [element firstChildWithTag:@"link"].stringValue;
            ONOXMLElement *url = [element firstChildWithTag:@"enclosure"];
            newsItem.imageLink = url.attributes[@"url"];
            newsItem.category = category;
            [result addObject:newsItem];
        }
    }
    return [result copy];
}

@end
