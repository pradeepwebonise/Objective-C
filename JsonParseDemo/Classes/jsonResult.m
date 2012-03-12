#import "jsonResult.h"

@implementation jsonResult 

@synthesize name;
@synthesize loan_status;
@synthesize country;
@synthesize fundedAmount;
@synthesize basket_amount;

+(jsonResult *)jsonOutput:(NSString *)responseString {
    jsonResult *result = [[jsonResult new] autorelease];
     NSArray* latestLoans = [(NSDictionary*)[responseString JSONValue] objectForKey:@"loans"];
	[responseString release];
	
	//choose a random loan
	NSDictionary* loan = [latestLoans objectAtIndex:0];
	
	//fetch the data
    
    result.name = [loan objectForKey:@"name"];
    result.loan_status = [loan objectForKey:@"status"]; 
	result.country = [(NSDictionary*)[loan objectForKey:@"location"] objectForKey:@"country"];
    result.basket_amount = [loan objectForKey:@"basket_amount"]; 
    result.fundedAmount = [loan objectForKey:@"funded_amount"];
    
    return result;
}

@end
