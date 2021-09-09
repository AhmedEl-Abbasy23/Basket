import 'package:basket/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:basket/data/models/home_model.dart';
import 'package:basket/shared/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget productsView(
  HomeModel homeModel,
  BuildContext context,
) =>
    Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 5.0,
              child: CarouselSlider(
                items: homeModel.data!.banners
                    .map(
                      (item) => Image(
                        image: NetworkImage(item.image),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 250.0,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.easeIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              'New Products',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.85,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                homeModel.data!.products.length,
                (index) =>
                    girdProductItem(homeModel.data!.products[index], context),
              ),
            ),
          ],
        ),
      ),
    );

Widget girdProductItem(ProductsModel model, BuildContext context) => Card(
      color: Colors.white,
      elevation: 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                image: NetworkImage(model.image),
                height: 200.0,
                width: double.infinity,
              ),
              Row(
                children: [
                  if (model.discount != 0)
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(fontSize: 8.0, color: Colors.white),
                      ),
                    ),
                  const Spacer(),
                  Align(
                    alignment: const Alignment(1.0, 0.0),
                    child: IconButton(
                      onPressed: () {
                        HomeCubit.get(context).changeFavorites(model.id);
                      },
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35.0,
                        child: Icon(
                          HomeCubit.get(context).favoriteProducts[model.id] ??
                                  false
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: defaultColor,
                          size: 23.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
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
                          size: 22.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                // Add and remove buttons.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context).countMinus();
                      },
                      icon: const Icon(Icons.remove, size: 22.0),
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      HomeCubit.get(context).count.toString(),
                      style: const TextStyle(
                          fontSize: 20.0, fontFamily: 'CairoSemiBold'),
                    ),
                    const SizedBox(width: 15.0),
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context).countPlus();
                      },
                      icon: const Icon(Icons.add, size: 22.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
