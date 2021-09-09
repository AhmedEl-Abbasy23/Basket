import 'package:basket/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:basket/presentation/widgets/categories_widgets.dart';
import 'package:basket/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
                homeCubit.homeModel != null &&
                homeCubit.favoritesModel != null,
            widgetBuilder: (BuildContext context) =>
                categoriesView(homeCubit, context),
            fallbackBuilder: (BuildContext context) => const Center(
              child: CircularProgressIndicator(color: defaultColor),
            ),
          );
        });
  }
}
