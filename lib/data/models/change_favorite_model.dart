class FavoritesChangeModel {
  late bool status;
  late String message;

  FavoritesChangeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
