class FavoritesModel {
  late bool status;
  late FavoritesDataModel favoritesData;

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    favoritesData = FavoritesDataModel.fromJson(json['data']);
  }
}

class FavoritesDataModel {
  List<FavoritesData> favourites = [];

  FavoritesDataModel.fromJson(Map<String, dynamic> json) {
    for (var item in json['data']) {
      favourites.add(FavoritesData.fromJson(item));
    }
  }
}

class FavoritesData {
  late int id;
  late FavoriteProducts products;

  FavoritesData.fromJson(Map<String, dynamic> json){
    products = FavoriteProducts.fromJson(json['product']);
  }
}

class FavoriteProducts {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late String description;

  FavoriteProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
