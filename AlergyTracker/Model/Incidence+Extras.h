//
//  Incidence+Extras.h
//  AlergyTracker
//
//  Created by Emily Toop on 27/03/2015.
//  Copyright (c) 2015 Radical Robot. All rights reserved.
//

#import "Incidence.h"

@interface Incidence(Extras)

@property (nonatomic, readonly) NSString * displayName;

+(NSArray<NSString *>*)getTopIncidents;
+(NSArray<NSString *>*)getTopIncidentsWithLimit:(NSUInteger)limit;

@end
