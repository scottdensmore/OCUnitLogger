#OCUnitLogger
OCUnitLogger is a drop in set of classes to allow you to convert the OCUnit output into something your builder server can consume based on JUnit output.

## Setup
Copy OCUnitToJUnitLogger.m, GDataXMLNode.h and GDataXMLNode.m from the Logger directory to your UnitTest project. GDataXMLNode.h and GDataXMLNode.m come from the Google Objective C client. The output will be put at build\ocunit.xml. GDataXMLNode is used so it can be put in iOS projects.

## Samples
A Mac sample that is based on the [bowling game tests](http://www.objectmentor.com/resources/articles/xpepisode.htm).

## External Code
* [Google Objective C client](http://code.google.com/p/gdata-objectivec-client/)
 
## More on Unit Tests for iOS / Mac
* [Sample Mac Application from Cocoa With Love](http://cocoawithlove.com/2009/12/sample-mac-application-with-complete.html)
* [Refactored iOS App with Tests](http://www.dribin.org/dave/blog/archives/2010/01/18/refactored_mac_iphone_app_with_tests/)
* [Chris Hanson's unit testing articles](http://eschatologist.net/blog/?tag=unit-testing)