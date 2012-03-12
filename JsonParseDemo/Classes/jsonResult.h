#import <Foundation/Foundation.h>

@interface jsonResult : NSObject {

    NSString* name;
    NSString* loan_status;
	NSString* country;
    NSNumber* fundedAmount;
	NSNumber* basket_amount;        
}

@property (retain, nonatomic) NSString* name;
@property (retain, nonatomic) NSString* loan_status;

@property (retain, nonatomic) NSString* country;
@property (retain, nonatomic) NSNumber* fundedAmount;
@property (retain, nonatomic) NSNumber* basket_amount;

@end
