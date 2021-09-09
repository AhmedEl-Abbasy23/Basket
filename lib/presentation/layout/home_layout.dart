import 'package:basket/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:basket/presentation/widgets/bottom_nav_bar_items.dart';
import 'package:basket/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final HomeCubit hCubit = HomeCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 60.0,
                elevation: 3.0,
                title: Row(
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      size: 28.0,
                      color: defaultColor,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      'Basket',
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: defaultColor),
                    ),
                  ],
                ),
              ),
              body: hCubit.screens[hCubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: hCubit.currentIndex,
                onTap: (index){
                  hCubit.changeIndex(index);
                },
                items: bottomNavigationBarItems,
              ),
            ),
          );
        },
      ),
    );
  }
}
