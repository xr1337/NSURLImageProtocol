NSURLImageProtocol
==================

An example of a customer NSURLProtocol which allows UIWebView to reference local images store in the resource bundle.
Instead of downloading the resources over the network.

This example only supports image resources such as png and jpeg files.

Setup 
========
To add this example in your project, please copy the files below to your local project.

- NSURLImageProtocol.h
- NSURLImageProtocol.m

To register this protocol, it is important to add the following to your Viewcontroller.m or Appdelegate.m

[NSURLProtocol registerClass:[NSURLImageProtocol class]];

This would ensure that the custom protocol will be referenced.

Customization
==============

The protocol scheme used in this example is 'cpimg', though you can change this to any type that you like.
Please look at the definition in NSURLImageProtocol.h 

Limitations
=============

Only supports images, tested with png and jpgs.

HTML Content
=============

All your HTML content will need to be updated to support local image loading.
Example:
(before)
<img src="http://www.test.com/image1.png"/>

(after)
<img src="cpimg://image.png"/>



