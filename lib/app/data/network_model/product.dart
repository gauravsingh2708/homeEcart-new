class Product {

  Product({
    this.categoryId,
    this.marketId,
    this.marketName,
    this.categoryName,
    this.count,
    this.name,
    this.imageUrl,
    this.discountPrice,
    this.price,
    this.limit,
    this.purchasePrice,
    this.isDeliverable,
    this.desc,
    this.weight,
    this.coinValue,
    this.id
  });

  /// Add super coin field

  Product.fromJson(Map<String, dynamic> data) {
    id = data['id'] as String;
    categoryId = data['CategoryId'] as String;
    marketId = data['MarketId'] as String;
    count = data['Count'] as int;
    limit = data['Limit'] as int;
    price = data['Price'] as double;
    discountPrice = data['DiscountPrice'] as double;
    name = data['Name'] as String;
    imageUrl = data['imageUrl'] as String;
    marketName = data['MarketName'] as String;
    purchasePrice = data['PurchasedPrice'] as double;
    categoryName = data['CategoryName'] as String;
    desc = data['desc'] as String;
    weight = data['weight'] as double;
    isDeliverable = data['is_deliverable'] as bool;
  }

  String categoryId;
  String marketId;
  String id;
  int count;
  int limit;
  bool isDeliverable;
  double weight;
  double purchasePrice;
  double price;
  double discountPrice;
  String name;
  String imageUrl;
  String marketName;
  String categoryName;
  String desc;
  int coinValue;

  Map<String, dynamic> toJson(Product product) {
    var data = <String, dynamic>{
      'id' : product.id,
      'MarketId': product.marketId,
      'MarketName': product.marketName,
      'CategoryId': product.categoryId,
      'CategoryName': product.categoryName,
      'Count': product.count,
      'Limit': product.limit,
      'Price': product.price,
      'PurchasedPrice': product.purchasePrice,
      'DiscountPrice': product.discountPrice,
      'imageUrl': product.imageUrl,
      'Name': product.name,
      'desc':product.desc,
      'weight':product.weight
    };
    return data;
  }
}
