//
//  UDTAppDelegate.h
//  URL Drag Tester
//
//  Created by Mike on 26/10/2012.
//  Copyright (c) 2012 Karelia Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface UDTAppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTableView *tableView;
@property (assign) IBOutlet NSArrayController *arrayController;

- (IBAction)addURL:(NSButton *)sender;
@end
