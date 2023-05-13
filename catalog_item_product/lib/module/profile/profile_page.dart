import 'package:catalog_item_product/utils/color_constant.dart';
import 'package:catalog_item_product/widget/profile_setting_options.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                  image: AssetImage("images/profileBackground.png"),
                  fit: BoxFit.cover,
                ))),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/profilePic.png"),
                          radius: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Miss John',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: AppColor.mainColor),
                        ),
                      ),
                      Text(
                        'Jorem ipsum dolor sit amet,',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.mainColor),
                      ),
                      Text(
                        'consectetur adipiscing elit.',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.mainColor),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.mainColor),
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.15,
              MediaQuery.of(context).size.height * 0.44,
              MediaQuery.of(context).size.width * 0.15,
              0),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileSettingOptions(
                icon: FontAwesomeIcons.user,
                name: 'Account',
                trailicon: FontAwesomeIcons.arrowRight,
              ),
              ProfileSettingOptions(
                icon: Icons.category_outlined,
                name: 'Saved Collections',
                trailicon: FontAwesomeIcons.arrowRight,
              ),
              ProfileSettingOptions(
                icon: Icons.key_sharp,
                name: 'Password',
                trailicon: FontAwesomeIcons.arrowRight,
              ),
              ProfileSettingOptions(
                icon: Icons.language_outlined,
                name: 'Language',
                trailicon: FontAwesomeIcons.arrowRight,
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
