//
//  Category
//  NSString+myStringCategory.m
//  May7Example2
//
//  Search in YAhoo for any text
//
//  Created by Rama Rai on 2019-05-07.
//  Copyright © 2019 Rama Rai. All rights reserved.
//

#import "NSString+myStringCategory.h"

//Implementation of the static method

@implementation NSString (myStringCategory)

    +(NSData *)removeJsongP:(NSString*)content{
    
        //removing the extra characters from Yahoo API to make
        //it a valiud Json
        
        content = [content substringFromIndex:39];
        content = [content substringToIndex:content.length -2];
        
    //Returning the valid Json
    return [content dataUsingEncoding:NSUTF8StringEncoding];
    
}
@end
