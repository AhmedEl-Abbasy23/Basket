import 'package:basket/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:basket/data/models/favorites_model.dart';
import 'package:basket/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import 'general_widgets.dart';

Widget favoritesView(FavoritesModel favoritesModel, context) =>
    favoritesModel.favoritesData.favourites.isNotEmpty
        ? ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => favoriteItem(
              favoritesModel.favoritesData.favourites[index].products,
              context,
            ),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: favoritesModel.favoritesData.favourites.length,
          )
        : buildEmpty(
            icon: Icons.favorite,
            text: 'Favorites list is empty, try to add some products.',
          );

Widget favoriteItem(FavoriteProducts model, BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                image: NetworkImage(model.image),
                height: 120.0,
                width: 120.0,
                fit: BoxFit.contain,
              ),
              if (model.discount != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(fontSize: 8.0, color: Colors.white),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      height: 1.1,
                      fontFamily: 'CairoBold',
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    model.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 1.0,
                      color: Colors.black38,
                      fontFamily: 'CairoSemiBold',
                    ),
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Price: ',
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.black87),
                          children: [
                            TextSpan(
                              text: '${model.price.round()}  ',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: model.discount != 0
                                    ? Colors.green
                                    : Colors.black,
                              ),
                            ),
                            if (model.discount != 0)
                              TextSpan(
                                text: '${model.oldPrice.round()}',
                                style: const TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // HomeCubit.get(context).changeFavorites(model.id);
                            },
                            icon: const CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.add_shopping_cart,
                                color: defaultColor,
                                size: 24.0,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              HomeCubit.get(context).changeFavorites(model.id);
                            },
                            icon: Icon(
                              HomeCubit.get(context)
                                          .favoriteProducts[model.id] ??
                                      false
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 24.0,
                              color: defaultColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
