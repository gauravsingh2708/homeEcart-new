class OrderModel{

  OrderModel({this.time,this.address,this.date,this.amount,this.productList});

  OrderModel.fromJson(Map<String,dynamic> data){
    time = data['time'] as String;
    date = data['date'] as String;
    address = data['address'] as String;
    amount = data['amount'] as double;
    productList = data['productList'] as List<Map<String,dynamic>>;
  }

  Map<String,dynamic> toMap(OrderModel model){
    Map<String,dynamic> data;
    data['time'] = model.time;
    data['date'] = model.date;
    data['address'] = model.address;
    data['amount'] = model.amount;
    data['productList'] = model.productList;
    return data;
  }

  String time;
  String date;
  String address;
  double amount;
  List< Map<String,dynamic> > productList;
}