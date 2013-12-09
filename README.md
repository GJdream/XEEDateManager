<a href="https://xeetech.com">![Alt text](/images/xee_01.png)</a> 

XEEDateManager
==============

XEEDateManager is a singleton class used to quickly generate descriptive string from a given date.

It converts NSDate objects into strings such as: "2 days from now", "3 weeks ago", "2 minutes from now", "7 months ago".
It uses XEEPluralizer for correct pluralization of words in various languages.


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



Contact
================

Follow XEETech on Twitter (<a href="https://twitter.com/XEE_Tech">XEE Tech</a>).

Connect with us on LinkedIn (<a href="http://www.linkedin.com/company/xee-tech">@XEE_Tech</a>).


License
================
XEEPluralizer is available under the MIT license. See the LICENSE file for more info.
