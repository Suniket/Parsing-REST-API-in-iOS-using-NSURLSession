# Parsing-REST-API-in-iOS-using-NSURLSession

Reusable component classes are ConnectionManager.h,ConnectionManager.m. Just add these classes in your project you are ready to parse HTTP GET/POST web services also download files from server in your app. 

Folder Structure :-
ReusableParserCode- 
Common Utils - Common utility methods
Classes - FunctionUtil.h, FunctionUtil.m
Network Manager - Parsing using NSURLSession
Classes - ConnectionManager.h,ConnectionManager.m
ViewControllers - ViewControllers/Screens of app
Classes - ViewController.h, ViewController.m
Main.storyboard - Storyboard file for iPhone app.


Blocks :-
Blocks have two great features:
	1	They can be executed in a later time, and not when the code of the scope they have been implemented is being executed.
	2	Their usage leads eventually to a much cleaner and tidier code writing, as they can be used instead of delegate methods, written just in one place and not spread to many files.
Focusing even more on the second feature, blocks offer a nice solution for creating callbacks instead of delegates, as they are declared and implemented directly to the point of the code where they are invoked. Using blocks, there is no need to adopt protocols, or implementing delegate methods that lead to much more code in a class. The best thing though, is that the callback procedure can directly access and use any variables existing locally in the scope where the block has been defined, so the need of passing data like we do in callback methods is eliminated. However, blocks cannot totally replace delegates as they cannot be used for every purpose. The best practice is to make combination of both, and that can be achieved both by following some simple rules and using the experience obtained in time.
Blocks are objects, so they can be stored to NSArray or NSDictionary data structures, as well as to be returned from methods, even to be assigned to variables.
Two facts are sure for every developer, even if someone has no idea about blocks. First off, it’s certain that every one has used blocks, even without knowing it. That’s because Apple has adopted blocks especially as completion handlers to many important, commonly used methods. Secondarily, thankfully or not, you don’t need to have deep knowledge on block programming in order to use them, just to understand how they work.
Blocks have just one weird characteristic, and that’s the way they are written. If you are new to all these, don’t worry, as after a couple of days of using and writing blocks, you will get used to it like everything else in Objective-C.
In this tutorial I’m aiming at two goals: To clarify all these things I just presented using code, and, above all to show you how blocks can be used in practice, by demonstrating practical examples, so they can make your programming life easier. If you don’t do any block programming yet, I wish after having finished this tutorial to start doing so. Follow documentation.


NSURLSession :- 
NSURLSession History - 
I have explained how use NSURLSession API to make HTTP requests. NSURLSession class is introduced in iOS 7 and OS X v10.9.  NSURLSession is  replacement for NSURLConnection and this API gives your app the ability to perform background downloads when your app is in background.

Overview of NSURLSession - 
NSURLSession is the key object responsible for sending and receiving HTTP requests. You create it via NSURLSessionConfiguration, which comes in three flavors:
	•	defaultSessionConfiguration: Creates a default configuration object that uses the disk-persisted global cache, credential and cookie storage objects.
	•	ephemeralSessionConfiguration: Similar to the default configuration, except that all session-related data is stored in memory. Think of this as a “private” session.
	•	backgroundSessionConfiguration: Lets the session perform upload or download tasks in the background. Transfers continue even when the app itself is suspended or terminated.
NSURLSessionConfiguration also lets you configure session properties such as timeout values, caching policies and additional HTTP headers. Refer to the documentation for a full list of configuration options.

NSURLSessionTask is an abstract class that denotes a task object. A session creates a task, which does the actual work of fetching data and downloading or uploading files.
There are three types of concrete session tasks in this context:
	•	NSURLSessionDataTask: Use this task for HTTP GET requests to retrieve data from servers to memory.
	•	NSURLSessionUploadTask: Use this task to upload a file from disk to a web service, typically via a HTTP POST or PUT method.
	•	NSURLSessionDownloadTask: Use this task to download a file from a remote service to a temporary file location.

You can also suspend, resume and cancel tasks. NSURLSessionDownloadTask has the additional ability to pause for future resumption.
Generally, NSURLSession returns data in two ways: via a completion handler when a task finishes either successfully or with an error, or by calling methods on a delegate that you set upon session creation.


