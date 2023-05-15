import 'package:catalog_item_product/module/home/bloc/home_bloc.dart';
import 'package:catalog_item_product/module/search/ui/search_page.dart';
import 'package:catalog_item_product/utils/color_constant.dart';
import 'package:catalog_item_product/module/home/widget/brand_row.dart';
import 'package:catalog_item_product/module/home/widget/category_row_list.dart';
import 'package:catalog_item_product/module/home/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadingSuccessfulState:
            final successState = state as HomeLoadingSuccessfulState;
            return Scaffold(
                body: SafeArea(
                    child: ListView(children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Choose',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          'Brand',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.mainColor,
                            foregroundColor: AppColor.appBlack,
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Text(
                                'See all',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                FontAwesomeIcons.arrowRight,
                                size: 15,
                              ),
                            ],
                          ))
                    ],
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: BrandRow(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.mainColor,
                            foregroundColor: AppColor.appBlack,
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Text(
                                'See all',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                FontAwesomeIcons.arrowRight,
                                size: 15,
                              ),
                            ],
                          ))
                    ],
                  ),
                  const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryRowList(
                            cateIcon: Icons.category_outlined,
                            cateLabel: 'all',
                          ),
                          CategoryRowList(
                            cateIcon: FontAwesomeIcons.shoePrints,
                            cateLabel: 'shoe',
                          ),
                          CategoryRowList(
                            cateIcon: FontAwesomeIcons.shoePrints,
                            cateLabel: 'shoe',
                          ),
                          CategoryRowList(
                            cateIcon: FontAwesomeIcons.shoePrints,
                            cateLabel: 'shoe',
                          ),
                          CategoryRowList(
                            cateIcon: FontAwesomeIcons.shoePrints,
                            cateLabel: 'shoe',
                          ),
                          CategoryRowList(
                            cateIcon: FontAwesomeIcons.shoePrints,
                            cateLabel: 'shoe',
                          ),
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Products',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    shrinkWrap: true,
                    children: successState.products.map((data) {
                      return ProductCard(
                        productDataModel: data,
                        homeBloc: homeBloc,
                      );
                    }).toList(),
                  )
                ],
              ),
            ])));
          case HomeErrorState:
            return const Scaffold(
                body: Center(
                    child: Text(
              'Error',
              style: TextStyle(color: Colors.black),
            )));
          default:
            return const SizedBox(
              child: Text('Hi'),
            );
        }
      },
    );
  }
}
