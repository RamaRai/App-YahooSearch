//
//  Category
//  NSString+myStringCategory.h
//  May7Example2
//
//  Search in YAhoo for any text
//
//  Created by Rama Rai on 2019-05-07.
//  Copyright © 2019 Rama Rai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (myStringCategory)

//User defined , to add more functionality to object, by adding method to Class

//Static method when it has +

+(NSData*)removeJsongP:(NSString*)content;

@end

NS_ASSUME_NONNULL_END
