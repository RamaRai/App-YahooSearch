//
//  Model
//  May7Example2  Obj C
//
//  Search in YAhoo for any text
//
//  Created by Rama Rai on 2019-05-07.
//  Copyright © 2019 Rama Rai. All rights reserved.
//

#import "YHooSearch.h"
#import "NSString+myStringCategory.h"

@implementation YHooSearch

//Search using Yahoo for the text search

-(void)getInformationWithSearchkey:(NSString*)search{
    
    //string of url of the api ...yahoo api link
    //Glitch - search must be without space or any characters
    NSString *url = [NSString stringWithFormat: @"http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=%@&region=1&lang=en&callback=YAHOO.Finance.SymbolSuggest.ssCallback", search];

    //Converting the string into url
    NSURL *yhUrl = [NSURL URLWithString:url];
    
    //Multi threading to fetch the information
    
    //Creating a queue(thread) with label
    dispatch_queue_t myQ = dispatch_queue_create("titleOfmyQ", nil);
    
    //Code for the thread body(block) to run
    dispatch_async(myQ, ^{
        
         //Initialize the error to null
         NSError *err = NULL;
        
        //Creating a string with url content and returning valueof error if there is any error
         NSString *content =  [NSString stringWithContentsOfURL:yhUrl encoding:NSUTF8StringEncoding error:&err];
        
        //Removing extra characters from url and validating the Json by calling from category and Converting url into Data and
         NSData *data =   [NSString removeJsongP:content];
        
        //Validated Json is serialized to convert it into Dictionary
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
        
        //Json (Dictionary) taking the index from the keypath and returning the result
        NSArray *result = [json valueForKeyPath:@"ResultSet.Result"];
        
        // If there is No error then fetch the result else nothing happens
        if(err == NULL){
            //call back UI (join main thread) with the array
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delagate yhSearchDidFishWithData:result];
            });
        }
    });
    
    
    
    
//need my document folder
//write to that url
    
//    NSFileManager *fm = [NSFileManager defaultManager];
//   NSArray *paths =  [fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
//    NSURL *documentPath = [paths lastObject];
//
//   NSURL *filePath = [documentPath URLByAppendingPathComponent:@"myarrya.plist"];
//
//    [result writeToURL:filePath atomically:YES];
//
//    NSLog(@"%@",documentPath);
    
//    NSLog(@"%@",contact);
    
    //append the url with search key
    // go fetch information in next thread
    // make sure its good json
    // go back to main thread and update table view
    
}

@end
