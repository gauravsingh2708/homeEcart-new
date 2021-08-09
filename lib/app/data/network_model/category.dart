class Category{
  Category({
    this.id,
    this.name,
    this.imageUrl
});

  Category.fromJson(Map<String, dynamic> data){
    id = data['id'] as String;
    name = data['Name'] as String;
    imageUrl = data['ImageUrl'] as String;
  }

  String id;
  String name;
  String imageUrl;
  String market;

  Map<String,dynamic> toJson(Category category){
    var data = <String,dynamic>{};
    data['id'] = category.id;
    data['Name'] = category.name;
    data['ImageUrl'] = category.imageUrl;

    return data;
  }

}