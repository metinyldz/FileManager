//
//  ViewController.h
//  FileManager
//
//  Created by Metin Yıldız on 3.07.2019.
//  Copyright © 2019 Metin Yıldız. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (strong, nonatomic) NSString *fileContent;
@property (strong, nonatomic) NSString *pathText;
@property (strong, nonatomic) NSURL *fileUrl;
@property (strong, nonatomic) NSURL *directoryUrl;
@property (strong, nonatomic) NSFileManager *fileManager;

@end

