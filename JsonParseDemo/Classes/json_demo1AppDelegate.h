//
//  json_demo1AppDelegate.h
//  json_demo1
//
//  Created by Marin Todorov on 2/24/11.
//  Copyright 2011 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class json_demo1ViewController;

@interface json_demo1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    json_demo1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet json_demo1ViewController *viewController;

@end

