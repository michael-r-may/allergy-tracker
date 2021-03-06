//
//  DataManager.h
//  AllergyTracker
//
//  Created by Emily Toop on 18/05/2015.
//  Copyright (c) 2015 Radical Robot. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Incidence.h"
#import "Interaction.h"
#import <MagicalRecord/MagicalRecord.h>


@interface DataManager : NSObject

+(void)setup;
+(void)cleanup;

+(BOOL)isFirstRun;

+(NSInteger)numberOfIncidentsWithName:(NSString*)name betweenDate:(NSDate*)startDate endDate:(NSDate*)endDate;
+(NSInteger)numberOfSelectedSymptoms;

+(NSArray *)allIncidents;
+(NSArray*)companionItemsForIncidenceWithName:(NSString*)name;

+(void)saveIncidence:(Incidence*)incidence withCompletion:(MRSaveCompletionHandler)completion;

@end
