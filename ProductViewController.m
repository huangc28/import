#import "ProductViewController.h"

#import "SharedLibraries/ProductViewElementCreator.h"

@interface ProductViewController ()
@end

@implementation ProductViewController

- (instancetype)initWithData:(Product *)product {
	self = [super init];

	if (self) {
		self.data = product;
	}

	return self;
}

- (void) viewDidLoad {
	[super viewDidLoad];

	NSLog(@"DEBUG* product view controller viewDidLoad");
	@try {
		self.view = self.createProdRow;
	}
	@catch (NSException *exception) {
	   NSLog(@"DEBUG* exception %@", exception.reason);
	}
}

- (UIStackView *) createProdRow {
	UIStackView *row = [ProductViewElementCreator createRow];

	// Product name.
	UILabel *nameLabel = [ProductViewElementCreator createLabel:self.data.prodName];

	// Price.
	UILabel *priceLabel = [
		ProductViewElementCreator
			createLabel:[[NSString alloc]initWithFormat: @"%@", self.data.price]
	];

	// Quantity.
	UILabel *quantityLabel = [
		ProductViewElementCreator
			createLabel:[[NSString alloc]initWithFormat: @"%@", self.data.quantity]
	];

	//UILabel *prodNameLabel = [[UILabel alloc] init];
	//prodNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
	//prodNameLabel.text = @"名稱";
	//[row addArrangedSubview:prodNameLabel];

	//UILabel *priceLabel = [[UILabel alloc] init];
	//priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
	//priceLabel.text = @"價格";
	//[row addArrangedSubview:priceLabel];

	//UILabel *quantityLabel = [[UILabel alloc] init];
	//quantityLabel.translatesAutoresizingMaskIntoConstraints = NO;
	//quantityLabel.text = @"數量";
	//[row addArrangedSubview:quantityLabel];


	[row addArrangedSubview:nameLabel];
	[row addArrangedSubview:priceLabel];
	[row addArrangedSubview:quantityLabel];

	return row;
}

@end
