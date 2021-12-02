#import "SharedLibraries/HttpUtil.h"
#import "SharedLibraries/ProductViewElementCreator.h"

#import "ProductListViewController.h"
#import "ProductViewController.h"

@interface ProductListViewController ()
@end

@implementation ProductListViewController
@synthesize products;

- (void) viewDidLoad {
	[super viewDidLoad];

	self.view = [
		[UIView alloc] initWithFrame: CGRectMake(
			0,
			80,
			[[UIScreen mainScreen] applicationFrame].size.width,
			[[UIScreen mainScreen] applicationFrame].size.height
		)
	];

	[self setupScrollView];
	[self setupProductStackView];

	UIStackView *headerRow = [self createHeaderRow];

	[self.prodsStackView addArrangedSubview:headerRow];
	[self setupLayout: self.scrollView prodsStackView:self.prodsStackView];
	// We need to observe changes of product list. If product list changes,
	// we should rerender product list in view.
	[
		[NSNotificationCenter defaultCenter]
			addObserver:self
				 selector:@selector(fetchProductsObserver:)
						 name:@"notifyProductsUpdate"
					 object:self
	];

	// Fetch inventory status by bundleID
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
	[self fetchInventoryAndReact: bundleIdentifier];
}

// @TODO rename to fetchProductsObserver.
- (void) fetchProductsObserver:(NSNotification *) notification {
	if ([[notification name] isEqualToString:@"notifyProductsUpdate"]) {
		NSDictionary *userInfo = notification.userInfo;
		NSArray * nProds = [userInfo objectForKey:@"products"];

		// Create list of product controller.
		NSLog(@"DEBUG* prodLength %lu", (unsigned long)[nProds count]);

		for (Product *prod in nProds) {
			NSLog(@"DEBUG* prod name %@", prod.prodName);
			NSLog(@"DEBUG* prod price %@", prod.price);
			NSLog(@"DEBUG* prod quantity %@", prod.quantity);

			// Initialize ProductViewController with product model.
			ProductViewController *prodViewController =	[
				[ProductViewController alloc]initWithData: prod
			];

			// Manually trigger "viewDidLoad" of prodViewController.
			[prodViewController view];

			// Append product view to product vertical stack view.
			[self.prodsStackView addArrangedSubview:prodViewController.prodView];
		}
	}
}

// @TODO remove subviews from properties.
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


				dispatch_async(dispatch_get_main_queue(), ^{
					[
						[NSNotificationCenter defaultCenter]
							postNotificationName:@"notifyProductsUpdate"
														object:self
													userInfo:nProds
					];
				});
			}
	}];
}

- (void) setupScrollView {
	self.scrollView = [[UIScrollView alloc]init];
	self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:self.scrollView];
}

// Setup a stack view container where product status will be listed row by row
// inside the scroll view. We use UIStackView to auto adjust the vertical layout
// of product list.
// [
//   prod info 1
//   prod info 2
//   prod info 3
// ]
- (void) setupProductStackView {
	self.prodsStackView = [[UIStackView alloc] init];
	self.prodsStackView.axis = UILayoutConstraintAxisVertical;
	self.prodsStackView.distribution = UIStackViewDistributionEqualSpacing;
	self.prodsStackView.spacing = 30;
  self.prodsStackView.translatesAutoresizingMaskIntoConstraints = NO;

	[self.scrollView addSubview:self.prodsStackView];
}

- (void) setupLayout:(UIScrollView *)scrollView
			prodsStackView:(UIStackView *)prodsStackView {

	[scrollView.topAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.topAnchor constant:20.0].active = YES;
  [scrollView.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor].active = YES;
	[scrollView.bottomAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.bottomAnchor].active = YES;
  [scrollView.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor].active = YES;

	[prodsStackView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
	[prodsStackView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
	[prodsStackView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
	[prodsStackView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;

}

- (UIStackView *) createHeaderRow {
	UIStackView *row = [ProductViewElementCreator createRow];

	UILabel *prodNameLabel = [[UILabel alloc] init];
	prodNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
	prodNameLabel.text = @"名稱";
	[row addArrangedSubview:prodNameLabel];

	UILabel *priceLabel = [[UILabel alloc] init];
	priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
	priceLabel.text = @"價格";
	[row addArrangedSubview:priceLabel];

	UILabel *quantityLabel = [[UILabel alloc] init];
	quantityLabel.translatesAutoresizingMaskIntoConstraints = NO;
	quantityLabel.text = @"數量";
	[row addArrangedSubview:quantityLabel];

	return row;
}

@end
