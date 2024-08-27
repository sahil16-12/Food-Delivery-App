import 'package:flutter/material.dart';
import 'package:flutterproject/components/my_current_location.dart';
import 'package:flutterproject/components/my_description_box.dart';
import 'package:flutterproject/components/my_food_tile.dart';
import 'package:flutterproject/components/my_sliver_app_bar.dart';
import 'package:flutterproject/models/food.dart';
import 'package:flutterproject/models/restaurant.dart';
import 'package:provider/provider.dart';
import '../components/my_current_location.dart';
import '../components/my_drawer.dart';
import '../components/my_tab_bar.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort  out and return a list of food items that belong to a specific caategory
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){
          final food = categoryMenu[index];

          return FoodTile(
              food: food,
              onTap: () {}
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                //my current location
                const MyCurrentLocation(),
                //Description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(builder: (context,restaurant,child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
        ),
        ),
      ),
    );
  }
}
