//
//  ViewController.m
//  WebViewLocalFiles
//
//  Created by Sufiyan Yasa on 3/6/13.
//  Copyright (c) 2013 Sufiyan Yasa. All rights reserved.
//
//

/**
 *  Implements a custom protocol load webviews with pre-shipped images.
 *  Images are stored in the resources bundle.
 *  Or may be stored in the documents folder (after background downloading).
 *
 */

#import "ViewController.h"
#import "NSURLImageProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Register our protocol with the url scheme of cpImg ( to change this, look at NSURLImageProtocol.h)
    [NSURLProtocol registerClass:[NSURLImageProtocol class]];
    
    [self prepareWebRequest];
}

- (void)prepareWebRequest{
    /**
     * Customize your URL request here.
     * A production example would be:
     *     
     * [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
     */

    
    NSString *imageTag = [NSString stringWithFormat:@"<img src=\"%@://image1.png\" />",kProtocolImageUrl];
    NSString *testHtml = [NSString stringWithFormat:@"<html><body>custom protocol<br/>%@<body></html>",imageTag];
    [self.webView loadHTMLString:testHtml baseURL:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
