#import "Foundation/Foundation.h"

#import "SharedLibraries/Product.h"

@interface ProductListViewController : UIViewController {
	NSArray<Product *> *_products;
}

@property(retain, nonatomic, readwrite) NSArray<Product *> *products; //@synthesize products=_products

@end
