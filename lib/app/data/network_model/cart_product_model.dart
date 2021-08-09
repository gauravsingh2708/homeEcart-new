class CartProduct {

  CartProduct({
    this.marketId,
    this.marketName,
    this.count,
    this.name,
    this.imageUrl,
    this.discountPrice,
    this.price,
    this.limit,
    this.isDeliverable,
    this.desc,
    this.weight,
  });

  /// Add super coin field

  CartProduct.fromJson(Map<String, dynamic> data) {
    id = data['id'] as String;
    marketId = data['MarketId'] as String;
    count = data['Count'] as int;
    limit = data['Limit'] as int;
    price = data['Price'] as double;
    discountPrice = data['DiscountPrice'] as double;
    name = data['Name'] as String;
    imageUrl = data['imageUrl'] as String;
    marketName = data['MarketName'] as String;
    desc = data['desc'] as String;
    weight = data['weight'] as double;
    isDeliverable = data['is_deliverable'] as bool;
  }

  String marketId;
  String id;
  int count;
  int limit;
  bool isDeliverable;
  double weight;
  double price;
  double discountPrice;
  String name;
  String imageUrl;
  String marketName;
  String desc;

  Map<String, dynamic> toJson(CartProduct product) {
    var data = <String, dynamic>{
      'MarketId': product.marketId,
      'MarketName': product.marketName,
      'Count': product.count,
      'Limit': product.limit,
      'Price': product.price,
      'DiscountPrice': product.discountPrice,
      'imageUrl': product.imageUrl,
      'Name': product.name,
      'desc':product.desc,
      'weight':product.weight,
      'id':product.id
    };
    return data;
  }
}
