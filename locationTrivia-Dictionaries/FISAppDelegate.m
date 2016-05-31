//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}
/////////         1

- (NSString*) stringByTruncatingNameOfLocation: (NSDictionary*) location toLength: (NSUInteger) length {
    NSString *names = location[@"name"];
    NSString *stringByTruncatingNameOfLocation;
    if ([names length] >= length) {
        stringByTruncatingNameOfLocation = [names substringToIndex:length];
        
    }else { stringByTruncatingNameOfLocation = location[@"name"];
        
    }
    return stringByTruncatingNameOfLocation;
}

/////////          2

- (NSDictionary*) dictionaryForLocationWithName:(NSString*) name latitude: (CGFloat) latitude longitude:(CGFloat) longitude{
    NSNumber *latitudeNum = @(latitude);
    NSNumber *longitudeNum = @(longitude);
    NSDictionary *locationsWithName = @{ @"name" : name,
                                         @"latitude": latitudeNum,
                                         @"longitude": longitudeNum};
    return locationsWithName;
}

/////////          3

- (NSArray*) namesOfLocations: (NSArray*)locations{
    NSMutableArray *locationNames = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < [locations count]; i++) {
        [locationNames addObject:locations[i][@"name"]];
    }
    
    return locationNames;
}

/////////          4

- (BOOL) dictionaryIsValidLocation: (NSDictionary*) valid{
    BOOL *dictionaryIsValidLocation;
    if ([[valid allKeys] containsObject: @"name"] &&
         [[valid allKeys] containsObject: @"latitude"] &&
         [[valid allKeys] containsObject:@"longitude"] &&
        ([valid count] == 3)){
        
        return true;
    
    }else {
        return false;
    }

    return dictionaryIsValidLocation;
}


/////////          5

- (NSDictionary*)locationNamed: (NSString*) name inLocations: (NSArray*) locations{
    for (NSDictionary *key in locations) {
        if ([key[@"name"] isEqual: name]){
            return key;
        }
    }
            return nil;
}

@end
