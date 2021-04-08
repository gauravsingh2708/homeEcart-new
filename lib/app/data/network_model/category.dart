class Category{
  Category({
    this.id,
    this.name,
    this.imageUrl
});

  Category.fromJson(Map<String, dynamic> data){
    id = data['Id'] as int;
    name = data['Name'] as String;
    imageUrl = data['ImageUrl'] as String;
  }

  int id;
  String name;
  String imageUrl;

}