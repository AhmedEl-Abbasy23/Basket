import 'package:basket/data/models/categories_model.dart';
import 'package:basket/data/models/change_favorite_model.dart';
import 'package:basket/data/models/favorites_model.dart';
import 'package:basket/data/models/home_model.dart';
import 'package:basket/data/web_services/dio_web_services.dart';
import 'package:basket/presentation/screens/categories_screen.dart';
import 'package:basket/presentation/screens/favorites_screen.dart';
import 'package:basket/presentation/screens/products_screen.dart';
import 'package:basket/shared/constants/constants.dart';
import 'package:basket/shared/constants/strings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(HomeChangeIndexState());
  }

  int count = 1;

  void countPlus() {
    count++;
    emit(ProductCountPlusState());
  }

  void countMinus() {
    for (count; count > 0; count--) {}

    emit(ProductCountMinusState());
  }

  List<Widget> screens = const [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  HomeModel? homeModel;
  Map<int, bool> favoriteProducts = {};

  void getHomeData() {
    emit(HomeDataLoadingState());
    WebServices.getData(url: home, token: token).then((value) {
      if (value.data != null) {
        homeModel = HomeModel.fromJson(value.data);
        // Add all products to favorites if (inFavorite = true).
        for (var element in homeModel!.data!.products) {
          favoriteProducts.addAll({element.id: element.inFavorites});
        }
        emit(HomeDataSuccessState(homeModel!));
        getCategoriesData();
      }
    }).catchError((error) {
      emit(HomeDataErrorState(error.toString()));
      print(error.toString());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    emit(CategoriesDataLoadingState());
    WebServices.getData(url: categories, token: token).then((value) {
      if (value.data != null) {
        categoriesModel = CategoriesModel.fromJson(value.data);
        emit(CategoriesDataSuccessState(categoriesModel!));
        getFavorites();
      }
    }).catchError((error) {
      emit(CategoriesDataErrorState(error.toString()));
      print(error.toString());
    });
  }

  bool? changeNullBoolean(prodId) {
    // if product id = null, make value false.
    favoriteProducts[prodId] ?? false
        // if product id = false leave it false.
        ? favoriteProducts[prodId] = false
        // if product id = false leave it true.
        : favoriteProducts[prodId] = true;
    return favoriteProducts[prodId];
  }

  FavoritesChangeModel? favoritesChangeModel;

  void changeFavorites(int productId) {
    changeNullBoolean(productId);
    emit(FavoritesChangeIconState());

    WebServices.postData(
      url: favorites,
      data: {'product_id': productId},
      token: token,
    ).then((value) {
      favoritesChangeModel = FavoritesChangeModel.fromJson(value.data);
      if (!favoritesChangeModel!.status) {
        changeNullBoolean(productId);
      } else {
        getFavorites();
      }
      emit(FavoritesChangeDataSuccessState(favoritesChangeModel!));
    }).catchError((error) {
      changeNullBoolean(productId);
      emit(FavoritesChangeDataErrorState(error.toString()));
      print(error.toString());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(FavoritesDataLoadingState());

    WebServices.getData(url: favorites, token: token).then(
      (value) {
        favoritesModel = FavoritesModel.fromJson(value.data);
        emit(FavoritesDataSuccessState(favoritesModel!));
      },
    ).catchError(
      (error) {
        print(error.toString());
        FavoritesDataErrorState(error.toString());
      },
    );
  }
}
