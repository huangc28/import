#import "SharedLibraries/HttpUtil.h"

#import "ProductListViewController.h"

@implementation ProductListViewController
@synthesize products;

- (void) viewDidLoad {
	[super viewDidLoad];

	UIScrollView *prodView = [
		[UIScrollView alloc] initWithFrame:CGRectMake(
			0,
			80,
			[[UIScreen mainScreen] applicationFrame].size.width,
			[[UIScreen mainScreen] applicationFrame].size.height
		)
	];

	self.view	= prodView;

	// We need to observe changes of product list. If product list changes,
	// we should rerender product list in view.
	[
		[NSNotificationCenter defaultCenter]
			addObserver:self
				 selector:@selector(productsObserver:)
						 name:@"notifyProductsUpdate"
					 object:nil
	];

	// Fetch inventory status by bundleID
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
	[self fetchInventoryAndReact: bundleIdentifier];
}

- (void) productsObserver:(NSNotification *) notification {
	NSLog(@"DEBUG* trigger products observer");
	if ([[notification name] isEqualToString:@"notifyProductsUpdate"]) {
		NSDictionary *userInfo = notification.userInfo;
		NSArray * nProds = [userInfo objectForKey:@"products"];

		NSLog(@"DEBUG* products~~* %@", nProds);
	}
}

- (void) dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void) fetchInventoryAndReact:(NSString *)bundleID {
	// Request remote API for jwt token. If auth success, retrieve inventory info.
	[
		[HttpUtil sharedInstance]
			fetchInventory: bundleID

		completedHandler: ^(NSData *data, NSURLResponse *response, NSError *error){
			if (error) {
				NSLog(@"DEBUG* error %@", error);
			}

			NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;

			NSError *parseError = nil;
			NSDictionary *responseDictionary = [
				NSJSONSerialization
					JSONObjectWithData:data
					options:0
					error:&parseError
			];

			if (httpResponse.statusCode == 200) {
				// @TODO: handle the case where no inventory in response.
				// Normalize
				NSMutableArray<Product *> *prods = [[NSMutableArray alloc] init];
				NSArray *inventory = responseDictionary[@"inventory"];

				for (NSDictionary *prod in inventory) {

					// Initialize Product class.
					NSString *prodName = (NSString *)prod[@"prod_name"];
					NSString *prodID = (NSString *)prod[@"prod_id"];
					NSNumber *price = (NSNumber *)prod[@"price"];
					NSNumber *quantity = (NSNumber *)prod[@"quantity"];

					Product *prod = [
						[Product alloc]
							initWithProdName: prodName
											  prodID: prodID
												 price: price
											quantity: quantity
					];


					[prods addObject: prod];
				}


				// Add products to controller property "products".
				self.products = [[NSArray alloc] initWithArray: prods];

				// Notify observer to update products views.
				NSDictionary *nProds = [NSDictionary dictionaryWithObject:self.products forKey:@"products"];

				NSLog(@"DEBUG* products about to be notify %@", nProds);

				[
					[NSNotificationCenter defaultCenter]
						postNotificationName:@"notifyProductsUpdate"
													object:self
												userInfo: nProds
				];
			}
	}];
}

@end
