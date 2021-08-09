class UserModel{

  UserModel({this.name,this.email,this.phone});

  UserModel.fromJson(Map<String, dynamic> data){
    uid = data['uid'] as String;
    name = data['name'] as String;
    email = data['email'] as String;
    phone = data['phone'] as String;
    isMerchant = data['is_market'] as bool;
    lat = data['lat'] as double;
    long = data['long'] as double;
    address = data['address'] as String;
  }

  String uid;
  String name = ' ';
  String email = ' ';
  String phone;
  String address;
  bool isMerchant;
  double lat;
  double long;

  Map<String,dynamic> toJson(UserModel user){
    var data = <String,dynamic>{};
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['phone'] = user.phone;
    data['is_market'] = user.isMerchant;
    data['lat'] = user.lat;
    data['long'] = user.long;
    data['address'] = user.address;
    return data;
  }

}