import 'package:flutter/material.dart';

import '../utils/color_constant.dart';

class BrandRow extends StatelessWidget {
  const BrandRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            4,
            (index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                          ),
                          color: AppColor.mainColor,
                          image: const DecorationImage(
                            image: AssetImage('images/logo.png'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                        color: Color(0xff03447e),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Brand Name',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.mainColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                )));
  }
}
