import 'package:catalog_item_product/config/routes/context_ext.dart';
import 'package:catalog_item_product/data/search_data.dart';
import 'package:catalog_item_product/module/home/bloc/home_bloc.dart';
import 'package:catalog_item_product/module/home/widget/product_card.dart';
import 'package:catalog_item_product/module/search/bloc/search_bloc.dart';
import 'package:catalog_item_product/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

final TextEditingController searchController = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<SearchBloc>().add(SearchInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(color: AppColor.appBlack, fontSize: 24),
        ),
        backgroundColor: AppColor.mainColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.back();
            },
            icon: Icon(
              FontAwesomeIcons.arrowLeftLong,
              color: AppColor.appBlack,
              size: 20,
            )),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ListTile(
              tileColor: AppColor.mainColor,
              leading: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 16,
              ),
              title: TextField(
                  controller: searchController,
                  cursorColor: AppColor.darkBlueColor,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Search for Product',
                  ),
                  onChanged: (query) {
                    context.read<SearchBloc>().add(SearchTypingEvent(query));
                  }),
              trailing: TextButton(
                  onPressed: () {
                    context.read<SearchBloc>().add(SearchClickedEvent());
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(color: AppColor.darkBlueColor),
                  )),
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchInitialState) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.mainColor),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const ListTile(
                          leading: Icon(
                            Icons.trending_up,
                            size: 20,
                          ),
                          title: Text(
                            'NIKE',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const ListTile(
                          leading: Icon(
                            Icons.trending_up,
                            size: 20,
                          ),
                          title: Text(
                            'Sneakers',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const ListTile(
                          leading: Icon(
                            Icons.trending_up,
                            size: 20,
                          ),
                          title: Text(
                            'Shirts',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is SearchTypingState) {
                return BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    final typingState = state as SearchTypingState;
                    if (searchList.isEmpty) {
                      return const Center(
                        child: Text('No item matches your description'),
                      );
                    }
                    if (typingState.query.isEmpty) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.mainColor),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const ListTile(
                                leading: Icon(
                                  Icons.trending_up,
                                  size: 20,
                                ),
                                title: Text(
                                  'NIKE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const ListTile(
                                leading: Icon(
                                  Icons.trending_up,
                                  size: 20,
                                ),
                                title: Text(
                                  'Sneakers',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const ListTile(
                                leading: Icon(
                                  Icons.trending_up,
                                  size: 20,
                                ),
                                title: Text(
                                  'Shirts',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        context.read<SearchBloc>().add(SearchClickedEvent());
                      },
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: searchList.map((data) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                tileColor: AppColor.mainColor,
                                leading: Text(
                                  data.brandTitle.toString(),
                                ),
                                title: Text(data.productName.toString()),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              }
              if (state is SearchLoadedState) {
                if (searchList.isEmpty) {
                  return const Center(
                    child: Text('No item matches your description'),
                  );
                }
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  children: searchList.map((data) {
                    return ProductCard(
                      productDataModel: data,
                      homeBloc: HomeBloc(),
                    );
                  }).toList(),
                );
              }
              return const Center();
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          )
        ],
      ),
    ));
  }
}
