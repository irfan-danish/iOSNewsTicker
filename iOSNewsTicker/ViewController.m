//
//  ViewController.m
//  iOSNewsTicker
//
//  Created by Irfan DANISH on 12/01/2013.
//  Copyright (c) 2013 Irfan DANISH. All rights reserved.
//

#import "ViewController.h"
#define kTagAppend 200

@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                               target:self
                                             selector:@selector(updateScroller:)
                                             userInfo:nil
                                              repeats:YES];
    
    allNews = [[NSMutableArray alloc] init];
    NSMutableDictionary *news1 = [[NSMutableDictionary alloc] init];
    [news1 setObject:@"1 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news1 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news1];
    
    NSMutableDictionary *news2 = [[NSMutableDictionary alloc] init];
    [news2 setObject:@"2 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news2 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news2];
    
    NSMutableDictionary *news3 = [[NSMutableDictionary alloc] init];
    [news3 setObject:@"3 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news3 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news3];
    
    NSMutableDictionary *news4 = [[NSMutableDictionary alloc] init];
    [news4 setObject:@"4 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news4 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news4];
    
    NSMutableDictionary *news5 = [[NSMutableDictionary alloc] init];
    [news5 setObject:@"5 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news5 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news5];
    
    NSMutableDictionary *news6 = [[NSMutableDictionary alloc] init];
    [news6 setObject:@"6 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news6 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news6];
    
    NSMutableDictionary *news7 = [[NSMutableDictionary alloc] init];
    [news7 setObject:@"7 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news7 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news7];
    
    NSMutableDictionary *news8 = [[NSMutableDictionary alloc] init];
    [news8 setObject:@"8 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news8 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news8];
    
    NSMutableDictionary *news9 = [[NSMutableDictionary alloc] init];
    [news9 setObject:@"9 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news9 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news9];
    
    NSMutableDictionary *news10 = [[NSMutableDictionary alloc] init];
    [news10 setObject:@"10 Lorem ipsum dolor sit amet, consectetur adipiscing elit" forKey:@"title"];
    [news10 setObject:@"http://www.svetainnovations.com/" forKey:@"link"];
    [allNews addObject:news10];
    
    
    [self.scrollview setContentSize:CGSizeMake(296, 24 * [allNews count])];
    [self.scrollview setScrollEnabled:YES];
    int i = 0;
    for (NSMutableDictionary *n in allNews) {
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10, i * 24, 286, 24)];
        l.text = [NSString stringWithFormat:@"%@",[n valueForKey:@"title"]];
        l.textColor = [UIColor whiteColor];
        l.backgroundColor = [UIColor clearColor];
        l.font = [UIFont fontWithName:@"Helvetica Neue" size:16.0];
        [l setTag:(i+kTagAppend)];
        l.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToNewsDetail:)];
        [l addGestureRecognizer:gesture];
        [self.scrollview addSubview:l];
        i++;
    }
    
    currentNews = 0;
    
}

- (void)updateScroller:(NSTimer*)theTimer
{
    if (currentNews < ([allNews count] -1)) {
        currentNews++;
    }else {
        currentNews = 0;
    }
    [self.scrollview scrollRectToVisible:[self.view viewWithTag:(currentNews+kTagAppend)].frame animated:YES];
}

-(void) goToNewsDetail:(UITapGestureRecognizer *)tapGesture
{
    int itemIndex = ([tapGesture view].tag) - kTagAppend;
    NSMutableDictionary *news = [allNews objectAtIndex:itemIndex];
    NSURL *url = [NSURL URLWithString:[news valueForKey:@"link"]];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
