//
//  UDTAppDelegate.m
//  URL Drag Tester
//
//  Created by Mike on 26/10/2012.
//  Copyright (c) 2012 Karelia Software. All rights reserved.
//

#import "UDTAppDelegate.h"

@implementation UDTAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Handful of starter URLs
    [[self arrayController] addObject:[NSURL fileURLWithPath:NSHomeDirectory()]];
    
    [[self arrayController] addObject:[[NSFileManager defaultManager] URLForDirectory:NSDesktopDirectory
                                                                             inDomain:NSUserDomainMask
                                                                    appropriateForURL:nil
                                                                               create:NO
                                                                                error:NULL]];
    
    // Turn on drag support
    [[self tableView] setDraggingSourceOperationMask:NSDragOperationCopy forLocal:NO];
}

- (void)addURL:(NSButton *)sender;
{
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseDirectories:YES];
    [panel setCanChooseFiles:YES];
    [panel setAllowsMultipleSelection:YES];
    
    [panel beginSheetModalForWindow:[self window] completionHandler:^(NSInteger result) {
        
        if (result == NSFileHandlingPanelOKButton)
        {
            [[self arrayController] addObjects:[panel URLs]];
        }
    }];
}

- (BOOL)tableView:(NSTableView *)tableView writeRowsWithIndexes:(NSIndexSet *)rowIndexes toPasteboard:(NSPasteboard *)pboard;
{
    NSArray *urls = [[[self arrayController] arrangedObjects] objectsAtIndexes:rowIndexes];
    [pboard clearContents];
    return [pboard writeObjects:urls];
}

@end
