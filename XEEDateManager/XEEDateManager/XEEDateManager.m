//
//  DateManager.m
//  Vasizubi
//
//  Created by Andrija Cajic on 6/14/13.
//  Copyright (c) 2013 Andrija Cajic. All rights reserved.
//

#import "XEEDateManager.h"

@implementation XEEDateManager

static XEEDateManager* dateManager;

+(instancetype) sharedManager
{
    if (!dateManager) {
        dateManager = [[XEEDateManager alloc] init];
    }
    return dateManager;
}

-(id) init
{
    if (self = [super init]) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _calendar = [NSCalendar currentCalendar];
        
        [self refreshTime];
        
        _pluralizerMinutes = [[XEEPluralizer alloc ] initWithWordForms:@{
                                                                         kXEEPluralizerFormSingular : NSLocalizedString(@"minuteSingular", @"singular"),
                                                                         kXEEPluralizerFormPaucal : NSLocalizedString(@"minutePaucal", @"paucal"),
                                                                         kXEEPluralizerFormPlural : NSLocalizedString(@"minutePlural", @"plural")
                                                                         }];
        
        _pluralizerHours = [[XEEPluralizer alloc ] initWithWordForms:@{
                                                                       kXEEPluralizerFormSingular : NSLocalizedString(@"hourSingular", @"singular"),
                                                                       kXEEPluralizerFormPaucal : NSLocalizedString(@"hourPaucal", @"paucal"),
                                                                       kXEEPluralizerFormPlural : NSLocalizedString(@"hourPlural", @"plural")
                                                                       }];
        _pluralizerDays = [[XEEPluralizer alloc ] initWithWordForms:@{
                                                                      kXEEPluralizerFormSingular : NSLocalizedString(@"daySingular", @"singular"),
                                                                      kXEEPluralizerFormPaucal : NSLocalizedString(@"dayPaucal", @"paucal"),
                                                                      kXEEPluralizerFormPlural : NSLocalizedString(@"dayPlural", @"plural")
                                                                      }];
        _pluralizerWeeks = [[XEEPluralizer alloc ] initWithWordForms:@{
                                                                       kXEEPluralizerFormSingular : NSLocalizedString(@"weekSingular", @"singular"),
                                                                       kXEEPluralizerFormPaucal : NSLocalizedString(@"weekPaucal", @"paucal"),
                                                                       kXEEPluralizerFormPlural : NSLocalizedString(@"weekPlural", @"plural")
                                                                       }];
        _pluralizerMonths = [[XEEPluralizer alloc ] initWithWordForms:@{
                                                                        kXEEPluralizerFormSingular : NSLocalizedString(@"monthSingular", @"singular"),
                                                                        kXEEPluralizerFormPaucal : NSLocalizedString(@"monthPaucal", @"paucal"),
                                                                        kXEEPluralizerFormPlural : NSLocalizedString(@"monthPlural", @"plural")
                                                                        }];
    }
    return self;
}

-(void) refreshTime
{
    self.today = [NSDate date];
}

-(NSString*) descriptiveTimeForDate:(NSDate*)date
{
    NSTimeInterval difference = date.timeIntervalSince1970 - self.today.timeIntervalSince1970;
    NSString* descriptiveTimeString;
    if (abs(difference) < 60) {
        return NSLocalizedString(@"Just now", @"Moment in time that is within a minute from exact current time.");
    }
    
    if (difference < 0) {
        descriptiveTimeString = [NSString stringWithFormat:NSLocalizedString(@"%@ ago", @"'%@' denotes some time interval like '5 days'. In that case this would evaluate into '5 days ago'"), [self descriptiveTimeForTimeInterval:difference]];
    } else {
        descriptiveTimeString = [NSString stringWithFormat:NSLocalizedString(@"%@ from now", @"'%@' denotes some time interval like '5 days'. In that case this would evaluate into '5 days from now'"), [self descriptiveTimeForTimeInterval:difference]];
    }
    return descriptiveTimeString;
}

-(NSString*) descriptiveTimeForTimeInterval:(NSTimeInterval)timeInterval
{
    timeInterval = abs(timeInterval);
    timeInterval /= 60;
    
    if (abs(timeInterval) < 50) {
        int minuteNum = (int)round(timeInterval);
        return [_pluralizerMinutes pluralizedSyntagmForQuantity:minuteNum];
    }
    
    timeInterval /= 60;
    
    if (abs(timeInterval) < 15) {
        int hourNum = (int)round(timeInterval);
        return [_pluralizerHours pluralizedSyntagmForQuantity:hourNum];
    }
    
    timeInterval /= 24;
    
    if (abs(timeInterval) < 8) {
        int dayNum = (int)round(timeInterval);
        return [_pluralizerDays pluralizedSyntagmForQuantity:dayNum];
    }
    
    if (abs(timeInterval) < 29) {
        int weekNum = (int)round(timeInterval/7);
        return [_pluralizerWeeks pluralizedSyntagmForQuantity:weekNum];
    }
    
    int monthNum = (int)round(timeInterval/30);
    return [_pluralizerMonths pluralizedSyntagmForQuantity:monthNum];
}

@end
