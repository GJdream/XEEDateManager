//
//  DateManager.h
//  Vasizubi
//
//  Created by Andrija Cajic on 6/14/13.
//  Copyright (c) 2013 Andrija Cajic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XEEPluralizer.h"

/**
 Singleton class used to quickly preform various date operations.
 */
@interface XEEDateManager : NSObject {
    XEEPluralizer* _pluralizerMinutes;
    XEEPluralizer* _pluralizerHours;
    XEEPluralizer* _pluralizerDays;
    XEEPluralizer* _pluralizerWeeks;
    XEEPluralizer* _pluralizerMonths;
}

@property (nonatomic, strong) NSDate* today;
@property (nonatomic, strong) NSDateFormatter* dateFormatter;
@property (nonatomic, strong) NSCalendar* calendar;

+(instancetype)sharedManager;

/**
 Refreshes the value of @property today (sets it to current time).
 */
-(void) refreshTime;

/**
 @return e.g. "Just now", "2 minutes from now", "7 hours ago", "3 days from now", ...
 */
-(NSString*) descriptiveTimeForDate:(NSDate*)date;

/**
 @return e.g. "2 minutes", "7 hours", "3 days", "5 weeks", ...
 */
-(NSString*) descriptiveTimeForTimeInterval:(NSTimeInterval)timeInterval;

@end
