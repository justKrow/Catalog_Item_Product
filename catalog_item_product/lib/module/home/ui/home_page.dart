import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/color_constant.dart';
import '../../../widget/brand_row.dart';
import '../../../widget/category_row_list.dart';
import '../../../widget/product_card.dart';

class HomePagetest extends StatefulWidget {
  const HomePagetest({
    super.key,
  });

  @override
  State<HomePagetest> createState() => _HomePagetestState();
}

class _HomePagetestState extends State<HomePagetest> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Choose',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    'Brand',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.mainColor,
                      foregroundColor: AppColor.appBlack,
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const [
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainColor,
                        foregroundColor: AppColor.appBlack,
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [
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
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Flexible(
                        child: ProductCard(
                            imageUrl: 'images/airpod.png',
                            brandTitle: 'Apple',
                            productName: 'airpod'),
                      ),
                      Flexible(
                        child: ProductCard(
                            imageUrl: 'images/airpodmax.png',
                            brandTitle: 'Apple',
                            productName: 'Airpod Max'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Flexible(
                        child: ProductCard(
                            imageUrl: 'images/electricalwatch.png',
                            brandTitle: 'Apple',
                            productName: 'Electrical watch'),
                      ),
                      Flexible(
                        child: ProductCard(
                            imageUrl: 'images/airjordon.png',
                            brandTitle: 'NIKE',
                            productName: 'Air Jordon'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Flexible(
                        child: ProductCard(
                            imageUrl: 'images/standardmouth.png',
                            brandTitle: 'Hydro Flask',
                            productName: 'Standard Mouth'),
                      ),
                      Flexible(
                        child: ProductCard(
                            imageUrl: 'images/nikon.png',
                            brandTitle: 'NIKON',
                            productName: 'NIKON F4'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Flexible(
                        child: ProductCard(
                            imageUrl: 'images/gojoglasses.png',
                            brandTitle: 'DAILY WEAR',
                            productName: "Gojo's glasses"),
                      ),
                      Flexible(
                        child: ProductCard(
                            imageUrl: 'images/redbubble.png',
                            brandTitle: 'CLINIQUE',
                            productName: 'Red Bubble'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ]),
    );
  }
}
