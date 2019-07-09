//
//  ViewController.m
//  FileManager
//
//  Created by Metin Yıldız on 3.07.2019.
//  Copyright © 2019 Metin Yıldız. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _pathText = @"/Users/metinyildiz/Desktop/";
    _directoryUrl = [NSURL fileURLWithPath:@"/Users/metinyildiz/Desktop/TestDirectory"];
    _fileUrl = [NSURL fileURLWithPath:@"/Users/metinyildiz/Desktop/Test123.txt"];
    _fileManager = [NSFileManager defaultManager];
    
    //[self checkFileExist];
    //[self checkFileContent];
    //[self createFile:@"This is a content in that file":@"TestFile4.txt"];
    //[self removeFile:@""];
    [self createDirectory:@"Test Directory"];
    //[self removeDirectory:@"New Test"];
    //[self checkDirectoryExist];
    
}

-(BOOL) checkFileExist {

    if ([_fileManager fileExistsAtPath:[_fileUrl path]] == YES) {
        return YES;
    } else {
        return NO;
    }

}

-(BOOL) checkFileContent {
    _fileContent = [NSString stringWithContentsOfURL:_fileUrl encoding:NSUTF8StringEncoding error:nil];
    
    if (_fileContent == nil || [_fileContent length] == 0) {
        return NO;
    } else {
        return YES;
    }

}

-(void) createFile:(NSString *)content:(NSString *) fileName {
    
    _fileUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@",_pathText,fileName]];

    if (![self checkFileExist] == YES) {
        NSLog(@"File creates.");
        [_fileManager createFileAtPath:[_fileUrl path] contents:content attributes:nil];
    } else {
        NSLog(@"File already exist.");
    }
    
}

-(void) removeFile:(NSString *) fileName {
    
    _fileUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@",_pathText,fileName]];
    
    if ([self checkFileExist] == YES) {
        NSLog(@"File deletes.");
        [_fileManager removeItemAtPath:[_fileUrl path] error:nil];
    } else {
        NSLog(@"File not found.");
    }
    
}

-(void) createDirectory:(NSString *)directoryName {
    
    _directoryUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@",_pathText,directoryName]];
    if (![self checkDirectoryExist] == YES) {
        NSLog(@"Directory creates.");
        [_fileManager createDirectoryAtPath:[_directoryUrl path] withIntermediateDirectories:NO attributes:nil error:nil];
    } else {
        NSLog(@"Directory already exists.");
    }

}

-(void) removeDirectory:(NSString *)directoryName {
    _directoryUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@",_pathText,directoryName]];
    if ([self checkDirectoryExist] == YES) {
        NSLog(@"Directory removes.");
        [_fileManager removeItemAtPath:[_directoryUrl path] error:nil];
    } else {
        NSLog(@"Directory not found.");
    }
    
}

-(BOOL) checkDirectoryExist {
    
    if([_fileManager fileExistsAtPath:[_directoryUrl path] isDirectory:NO]){
        return YES;
    } else {
        return NO;
    }
    
}

@end
