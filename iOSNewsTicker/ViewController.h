//
//  ViewController.h
//  iOSNewsTicker
//
//  Created by Irfan DANISH on 12/01/2013.
//  Copyright (c) 2013 Irfan DANISH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *myTimer;
    NSMutableArray *allNews;
    NSInteger currentNews;
}
@property (retain, nonatomic) IBOutlet UIScrollView *scrollview;
@end
