<a href="https://xeetech.com">![Alt text](/images/xee_01.png)</a> 

XEEDateManager
==============

XEEDateManager is a class used to quickly generate descriptive string from a given date.


Usage
==============

```objc

for (int i = 0; i<10; i++) {
        NSTimeInterval timeInterval = arc4random() % 10000000 - 5000000.;
        NSDate* date = [NSDate dateWithTimeIntervalSinceNow:timeInterval];
        NSString* descriptiveDate = [[XEEDateManager sharedManager] descriptiveTimeForDate:date];
        NSLog(@"Described date %@ as: '%@'", date, descriptiveDate);
}

```
