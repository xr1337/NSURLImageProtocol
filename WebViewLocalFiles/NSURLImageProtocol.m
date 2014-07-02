//
//  NSURLImageProtocol.m
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

#import "NSURLImageProtocol.h"


@implementation NSURLImageProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request{
    if ([request.URL.scheme caseInsensitiveCompare:kProtocolImageUrl] == NSOrderedSame) {
        return YES;
    }
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request{
    return request;
}

- (void)startLoading{
    NSString *extension;
    NSString *imageName;
    [self extractImageName:&imageName extension:&extension];

    NSURLResponse *response =[[NSURLResponse alloc]initWithURL:self.request.URL
                                                      MIMEType:nil expectedContentLength:-1
                                              textEncodingName:nil];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:extension];
    NSData *data = [NSData dataWithContentsOfFile:imagePath];

    [[self client] URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [[self client] URLProtocol:self didLoadData:data];
    [[self client] URLProtocolDidFinishLoading:self];
}

/**
 * Extracts the image file name and path extension
 */
-(void)extractImageName:(NSString**)imageName extension:(NSString**)extension{
    NSString *urlString = self.request.URL.absoluteString;
    *extension = [urlString pathExtension];
    urlString = [urlString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@://",kProtocolImageUrl]
                                                     withString:@""];
    *imageName = [urlString stringByDeletingPathExtension];
}

- (void)stopLoading
{
    
}
@end
