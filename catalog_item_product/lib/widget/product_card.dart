import 'package:card_swiper/card_swiper.dart';
import 'package:catalog_item_product/module/home/model/product_data_model.dart';
import 'package:catalog_item_product/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatefulWidget {
  final ProductDataModel productDataModel;

  const ProductCard({super.key, required this.productDataModel});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.productDataModel.imageUrl!),
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.015,
                right: MediaQuery.of(context).size.width * 0.03,
                child: IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? AppColor.darkBlueColor : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                ))
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.39,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.productDataModel.brandTitle!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(
                  widget.productDataModel.productName!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              )
            ],
          ),
        )
      ]),
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  child: Container(
                    color: AppColor.backGroundColor,
                    child: Column(children: [
                      ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              FontAwesomeIcons.arrowLeftLong,
                              size: 20,
                              color: AppColor.appBlack,
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(
                                      widget.productDataModel.imageUrl!),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                          itemCount: 3,
                          pagination: const SwiperPagination(),
                          viewportFraction: 0.8,
                          scale: 0.9,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Container(
                          margin: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.productDataModel.brandTitle!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: AppColor.darkBlueColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.productDataModel.productName!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32,
                                          color: AppColor.appBlack),
                                    ),
                                    IconButton(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        icon: isFav
                                            ? Icon(
                                                Icons.favorite,
                                                color: AppColor.darkBlueColor,
                                              )
                                            : Icon(
                                                Icons.favorite_border,
                                                color: AppColor.darkBlueColor,
                                              ),
                                        onPressed: () {
                                          setState(() {
                                            isFav = !isFav;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Color - ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: AppColor.appBlack),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon:
                                            const Icon(Icons.circle_outlined)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.circle_rounded,
                                          color: Colors.black,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.circle_rounded,
                                          color: Colors.blue,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.circle_rounded,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              });
            });
      },
    );
  }
}
