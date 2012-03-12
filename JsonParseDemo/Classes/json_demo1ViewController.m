#import "json_demo1ViewController.h"
#import "JSON.h"
#import "jsonResult.h"

#define kLatestKivaLoansURL @"http://api.kivaws.org/v1/loans/search.json?status=fundraising"

@implementation json_demo1ViewController

@synthesize responseData;
@synthesize result;

-(void)loadData
{
	self.responseData = [NSMutableData data];
	
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kLatestKivaLoansURL]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[connection release];
	self.responseData = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [connection release];
	
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	self.responseData = nil;
	
    self.result = [jsonResult jsonOutput: responseString];
        
	//set the text to the label
	label.text = [NSString stringWithFormat:@"Loan Name: %@\n Loan Status: %@\n Country: %@ \n Funded Amount: $%.2f\n Basket Amount: $%.2f\n  ",
                  result.name,result.loan_status,result.country,result.fundedAmount
                  ]; 
}

@end
