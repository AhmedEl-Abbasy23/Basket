import 'package:basket/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:basket/data/models/favorites_model.dart';
import 'package:basket/presentation/widgets/favorites_widgets.dart';
import 'package:basket/presentation/widgets/general_widgets.dart';
import 'package:basket/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit fCubit = HomeCubit.get(context);
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
                fCubit.homeModel != null && fCubit.favoritesModel != null,
            widgetBuilder: (BuildContext context) =>
                favoritesView(fCubit.favoritesModel!, context),
            fallbackBuilder: (BuildContext context) => const Center(
              child: CircularProgressIndicator(color: defaultColor),
            ),
          );
        });
  }
}

/*Widget favoritesView(FavoritesModel favoritesModel, context) =>
    favoritesModel.favoritesData.favourites.isNotEmpty
        ? ListView.separated(
            itemBuilder: (context, index) => favoriteItem(
                favoritesModel.favoritesData.favourites[index].products,
                context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: favoritesModel.favoritesData.favourites.length,
          )
        : buildEmpty(
            icon: Icons.favorite,
            text: 'text',
          );*/
