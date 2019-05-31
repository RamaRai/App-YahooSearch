//
//  Model
//  YHooSearch.h
//  May7Example2 Obj C
//
//  Search in YAhoo for any text
//  Glitch - Search Text entered must be without space
//
//  Created by Rama Rai on 2019-05-07.
//  Copyright © 2019 Rama Rai All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//Declaring the protocol before using it
@protocol YHsearchdelegate;


//Interface for public declaration
@interface YHooSearch : NSObject

//Contract to delegate as property
@property(nonatomic)id<YHsearchdelegate>delagate;

-(void)getInformationWithSearchkey:(NSString*)search;


@end


//Protocol body or method declaration to be implemented
@protocol YHsearchdelegate

-(void)yhSearchDidFishWithData:(NSArray*)data;

@end

NS_ASSUME_NONNULL_END
