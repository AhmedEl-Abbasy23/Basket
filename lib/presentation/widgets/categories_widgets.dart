import 'package:basket/data/models/categories_model.dart';
import 'package:flutter/material.dart';

import 'general_widgets.dart';

Widget categoriesView(homeCubit, context) => ListView.separated(
  physics: const BouncingScrollPhysics(),
  itemBuilder: (context, index) => categoryItem(
      homeCubit.categoriesModel!.data.categories[index], context),
  separatorBuilder: (context, index) => myDivider(),
  itemCount: homeCubit.categoriesModel!.data.categories.length,
);

Widget categoryItem(CategoriesData model, context) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  child: Row(
    children: [
      Image(
        image: NetworkImage(model.image),
        height: 120.0,
        width: 120.0,
      ),
      const SizedBox(width: 10.0),
      Expanded(
        child: Row(
          children: [
            Text(
              model.name,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    ],
  ),
);