import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{

  final List<Food> _menu = [
    //burgers
    Food(
      name: "Double-Cheese-Burger",
      description: "A crispy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/double-cheese-burger.jpg",
      price: 169,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Patty", price: 60),

      ],
    ),
    Food(
      name: "Double-Cheese-Burger",
      description: "A crispy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/double-cheese-burger.jpg",
      price: 169,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Patty", price: 60),

      ],
    ),
    Food(
      name: "Double-Cheese-Burger",
      description: "A crispy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/double-cheese-burger.jpg",
      price: 169,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Patty", price: 60),

      ],
    ),
    Food(
      name: "Double-Cheese-Burger",
      description: "A crispy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/double-cheese-burger.jpg",
      price: 169,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Patty", price: 60),

      ],
    ),
    Food(
      name: "Double-Cheese-Burger",
      description: "A crispy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/double-cheese-burger.jpg",
      price: 169,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Patty", price: 60),

      ],
    ),

    //pizzas

    //salads

    //drinks

    //sides



  ];
/* G E T T E R S*/
List<Food> get menu => _menu;


/* OPERATIONS*/
//add to cart

//remove from cart

//get total price from cart

//get total number of items in cart

//clear cart


/* HELPERS*/

//generate a receipt

//format double value into money

//format list of addons into string summary

}