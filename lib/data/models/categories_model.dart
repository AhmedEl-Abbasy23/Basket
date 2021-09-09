class CategoriesModel {
  late bool status;
  late dynamic message;
  late CategoriesDataModel data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = CategoriesDataModel.fromJson(json['data']);
  }
}

class CategoriesDataModel {
  List<CategoriesData> categories = [];

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    for (var item in json['data']) {
      categories.add(CategoriesData.fromJson(item));
    }
  }
}

class CategoriesData {
  late int id;
  late String name;
  late String image;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
