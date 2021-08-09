class MarketModel{

  MarketModel({this.name,this.desc,this.uid,this.address,this.image,this.lat,this.long});

  MarketModel.fromJson(Map<String,dynamic> data){
    name = data['name'] as String;
    desc = data['desc'] as String;
    uid = data['uid'] as String;
    address = data['address'] as String;
    image = data['image'] as String;
    lat = data['lat'] as double;
    long = data['long'] as double;
  }
  String uid;
  String name;
  String address;
  double lat;
  double long;
  String image;
  String desc;

  Map<String,dynamic> toJson(MarketModel market){
    var data = <String,dynamic> {};
    data['name'] = market.name;
    data['desc'] = market.desc;
    data['uid'] = market.uid;
    data['address'] = market.address;
    data['image'] = market.image;
    data['lat'] = market.lat;
    data['long'] = market.long;
    return data;
  }
}