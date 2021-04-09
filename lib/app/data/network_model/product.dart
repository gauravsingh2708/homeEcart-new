class Product {
  Product(
      {this.id,
      this.categoryId,
      this.marketId,
      this.count,
      this.name,
      this.imageUrl,
      this.discountPrice,
      this.marketName,
      this.price,
      this.limit,
      this.purchasePrice,
      this.categoryName});

  Product.fromJson(Map<String, dynamic> data) {
    id = data['Id'] as int;
    categoryId = data['CategoryId'] as int;
    marketId = data['MarketId'] as int;
    count = data['Count'] as int;
    limit = data['Limit'] as int;
    price = data['Price'] as double;
    discountPrice = data['DiscountPrice'] as double;
    name = data['Name'] as String;
    imageUrl = data['imageUrl'] as String;
    marketName = data['MarketName'] as String;
    purchasePrice = data['PurchasedPrice'] as double;
    categoryName = data['CategoryName'] as String;
  }

  int id;
  int categoryId;
  int marketId;
  int count;
  int limit;
  double purchasePrice;
  double price;
  double discountPrice;
  String name;
  String imageUrl;
  String marketName;
  String categoryName;

  Map<String, dynamic> toJson(Product product) {
    var data = <String, dynamic>{
      'Id':product.id,
      'MarketId': 1,
      'MarketName': 'HomeEcart',
      'CategoryId': product.categoryId,
      'CategoryName':product.categoryName,
      'Count': product.count,
      'Limit': product.limit,
      'Price' : product.price,
      'PurchasedPrice': product.price,
      'DiscountPrice': product.discountPrice,
      'imageUrl': product.imageUrl,
      'Name': product.name
    };
    return data;
  }
}
