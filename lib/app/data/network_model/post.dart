import 'package:homeecart/app/utils/string_constant.dart';

class ProductPost{
  ProductPost({this.id,this.title,this.subTitle,this.type,this.productList,this.hide});

  ProductPost.fromJson(Map<String, dynamic> data){
    id = data[AppConstants.id] as int;
    title = data[AppConstants.title] as String;
    subTitle = data[AppConstants.subTitle] as String;
    productList = data[AppConstants.productList] as List<int>;
    type = data[AppConstants.type] as String;
    hide = data[AppConstants.hide] as bool;
  }

  int id;
  String title;
  String subTitle;
  String type;
  bool hide;
  List<int> productList;

}