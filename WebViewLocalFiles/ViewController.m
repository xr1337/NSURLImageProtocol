//
//  ViewController.m
//  WebViewLocalFiles
//
//  Created by Sufiyan Yasa on 3/6/13.
//  Copyright (c) 2013 Sufiyan Yasa. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
