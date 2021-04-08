class SliderModel{
  SliderModel({this.id,this.imageUrl});

  SliderModel.fromJson(Map<String,dynamic> data){
    id = data['Id'] as int ;
    imageUrl = data['ImageUrl'] as String;
  }

  int id;
  String imageUrl;
}

class BannerModel{
  BannerModel({this.id,this.imageUrl});

  BannerModel.fromJson(Map<String,dynamic> data){
    id = data['Id'] as int ;
    imageUrl = data['ImageUrl'] as String;
    toShow = data['ToShow'] as bool;
  }

  int id;
  String imageUrl;
  bool toShow;
}