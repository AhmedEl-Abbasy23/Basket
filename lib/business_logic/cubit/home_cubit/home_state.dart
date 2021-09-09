part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

// General logic.
class HomeInitialState extends HomeState {}

class HomeChangeIndexState extends HomeState {}
class ProductCountPlusState extends HomeState {}
class ProductCountMinusState extends HomeState {}

// Home data.
class HomeDataLoadingState extends HomeState {}

class HomeDataErrorState extends HomeState {
  final String errorMsg;

  HomeDataErrorState(this.errorMsg);
}

class HomeDataSuccessState extends HomeState {
  final HomeModel homeModel;

  HomeDataSuccessState(this.homeModel);
}

// Categories data.

class CategoriesDataLoadingState extends HomeState {}

class CategoriesDataErrorState extends HomeState {
  final String errorMsg;

  CategoriesDataErrorState(this.errorMsg);
}

class CategoriesDataSuccessState extends HomeState {
  final CategoriesModel categoriesModel;

  CategoriesDataSuccessState(this.categoriesModel);
}

// Favorites.
class FavoritesChangeIconState extends HomeState {}

class FavoritesChangeDataLoadingState extends HomeState {}

class FavoritesChangeDataErrorState extends HomeState {
  final String errorMsg;

  FavoritesChangeDataErrorState(this.errorMsg);
}

class FavoritesChangeDataSuccessState extends HomeState {
  final FavoritesChangeModel favoritesChangeModel;

  FavoritesChangeDataSuccessState(this.favoritesChangeModel);
}

class FavoritesDataLoadingState extends HomeState {}

class FavoritesDataErrorState extends HomeState {
  final String errorMsg;

  FavoritesDataErrorState(this.errorMsg);
}

class FavoritesDataSuccessState extends HomeState {
  final FavoritesModel favoritesModel;

  FavoritesDataSuccessState(this.favoritesModel);
}
