class HomeModel {
  late bool status;
  late dynamic message;
  late HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] == null ? null : HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    for (var item in json['banners']) {
      banners.add(BannersModel.fromJson(item));
    }
    for (var item in json['products']) {
      products.add(ProductsModel.fromJson(item));
    }
  }
}

class BannersModel {
  late int id;
  late String image;

  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductsModel {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late String description;
  late List<dynamic> images;
  late bool inFavorites;
  late bool inCart;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
