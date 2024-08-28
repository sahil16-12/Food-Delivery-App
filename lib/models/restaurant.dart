import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{

  final List<Food> _menu = [
    //burgers
    Food(
      name: "Cheesy Burger",
      description: "A crispy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "https://images.pexels.com/photos/580612/pexels-photo-580612.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 269,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Patty", price: 60),

      ],
    ),
    Food(
      name: "Veg Burger",
      description: "A crispy potato patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "https://images.pexels.com/photos/4109132/pexels-photo-4109132.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 199,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
      ],
    ),
    Food(
      name: "Chicken Burger",
      description: "A crispy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "https://images.pexels.com/photos/1108117/pexels-photo-1108117.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 245,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Patty", price: 60),

      ],
    ),
    Food(
      name: "Classic Burger",
      description: "A crispy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 149,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Patty", price: 60),
      ],
    ),
    Food(
      name: "Hamburger",
      description: "A crispy patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "https://images.pexels.com/photos/3616956/pexels-photo-3616956.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 169,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),

      ],
    ),


    //salads
    Food(
      name: "vegetable salad",
      description: "A vibrant mix of crisp lettuce, juicy tomatoes, crunchy cucumbers, and sweet bell peppers, tossed with your choice of dressing. Light, refreshing, and full of flavor.",
      imagePath: "https://images.pexels.com/photos/257816/pexels-photo-257816.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 589,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra veggies", price: 130),
      ],
    ),
    Food(
      name: "mixed salad",
      description: "A vibrant mix of crisp lettuce, juicy tomatoes, crunchy cucumbers, and sweet bell peppers, tossed with your choice of dressing. Light, refreshing, and full of flavor.",
      imagePath: "https://images.pexels.com/photos/8980435/pexels-photo-8980435.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 789,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra veggies", price: 130),
      ],
    ),
    Food(
      name: "salad of pasta",
      description: "A vibrant mix of crisp lettuce, juicy tomatoes, crunchy cucumbers, and sweet bell peppers, tossed with your choice of dressing. Light, refreshing, and full of flavor.",
      imagePath: "https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 900,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 90),
      ],
    ),

    //pizzas
    Food(
      name: "Margherita",
      description: "A timeless favorite featuring a golden, crispy crust topped with a rich tomato sauce and a generous layer of melted mozzarella cheese. Perfectly simple, yet irresistibly delicious.",
      imagePath: "https://images.pexels.com/photos/20115306/pexels-photo-20115306/free-photo-of-top-view-of-a-pizza-margherita.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 419,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 68),

      ],
    ),
    Food(
      name: "Four Cheese Pizza",
      description: "A timeless favorite featuring a golden, crispy crust topped with a rich tomato sauce and a generous layer of melted mozzarella cheese. Perfectly simple, yet irresistibly delicious.",
      imagePath: "https://images.pexels.com/photos/2762942/pexels-photo-2762942.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 780,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 68),

      ],
    ),
    Food(
      name: "Pepproni Pizza",
      description: "A timeless favorite featuring a golden, crispy crust topped with a rich tomato sauce and a generous layer of melted mozzarella cheese. Perfectly simple, yet irresistibly delicious.",
      imagePath: "https://images.pexels.com/photos/4109111/pexels-photo-4109111.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 565,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "Extra Pepproni", price: 177),

      ],
    ),
    Food(
      name: "Chicken Pizza",
      description: "A timeless favorite featuring a golden, crispy crust topped with a rich tomato sauce and a generous layer of melted mozzarella cheese. Perfectly simple, yet irresistibly delicious.",
      imagePath: "https://images.pexels.com/photos/27819674/pexels-photo-27819674/free-photo-of-a-pizza-and-other-food-on-a-table-with-a-plate-of-salad.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 345,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "lettuce", price: 60),

      ],
    ),
    Food(
      name: "Double Cheese Pizza",
      description: "A timeless favorite featuring a golden, crispy crust topped with a rich tomato sauce and a generous layer of melted mozzarella cheese. Perfectly simple, yet irresistibly delicious.",
      imagePath: "https://images.pexels.com/photos/367915/pexels-photo-367915.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 526,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
      ],
    ),

    //dessert
    Food(
      name: "Gulab Jamun",
      description: "Soft, melt-in-your-mouth dumplings soaked in a warm, fragrant syrup infused with cardamom and rose water.",
      imagePath: "https://images.pexels.com/photos/15014919/pexels-photo-15014919/free-photo-of-bowl-of-gulab-jamun.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 480,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
      ],
    ),
    Food(
      name: "Jalebi",
      description: "Soft, melt-in-your-mouth dumplings soaked in a warm, fragrant syrup infused with cardamom and rose water.",
      imagePath: "https://images.pexels.com/photos/5831655/pexels-photo-5831655.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 480,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
      ],
    ),
    Food(
      name: "Tiramisu",
      description: "A rich and moist chocolate cake layered with creamy chocolate frosting, topped with a drizzle of chocolate ganache. Indulgence in every bite.",
      imagePath: "https://images.pexels.com/photos/1854652/pexels-photo-1854652.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 1280,
      category: FoodCategory.desserts,
      availableAddons: [
      ],
    ),
    Food(
      name: "Choclate Ice Cream",
      description: "Soft, melt-in-your-mouth dumplings soaked in a warm, fragrant syrup infused with cardamom and rose water.",
      imagePath: "https://images.pexels.com/photos/2846337/pexels-photo-2846337.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 90,
      category: FoodCategory.desserts,
      availableAddons: [
      ],
    ),
    Food(
      name: "Kesar Kulfi",
      description: "Soft, melt-in-your-mouth dumplings soaked in a warm, fragrant syrup infused with cardamom and rose water.",
      imagePath: "https://media.istockphoto.com/id/657073780/photo/rajwari-or-rajwadi-sweet-kesar-badam-pista-kulfi-or-ice-cream-candy.jpg?b=1&s=612x612&w=0&k=20&c=cmtXTE7uqAWI-fxYR_YX1KRkFHZ3SbXuQs3hFwgg6Gs=",
      price: 180,
      category: FoodCategory.desserts,
      availableAddons: [
      ],
    ),
    //drinks
    Food(
      name: "Coke",
      description: "Cool and refreshing, our selection of cold drinks offers the perfect way to quench your thirst. Enjoy a variety of chilled beverages that complement any meal.",
      imagePath: "https://images.pexels.com/photos/3819969/pexels-photo-3819969.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 120,
      category: FoodCategory.drinks,
      availableAddons: [
      ],
    ),
    Food(
      name: "Sprite",
      description: "Cool and refreshing, our selection of cold drinks offers the perfect way to quench your thirst. Enjoy a variety of chilled beverages that complement any meal.",
      imagePath: "https://images.pexels.com/photos/17650220/pexels-photo-17650220/free-photo-of-can-of-sprite-on-white-background.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 120,
      category: FoodCategory.drinks,
      availableAddons: [
      ],
    ),
    Food(
      name: "Mango MilkShake",
      description: "Cool and refreshing, our selection of cold drinks offers the perfect way to quench your thirst. Enjoy a variety of chilled beverages that complement any meal.",
      imagePath: "https://images.pexels.com/photos/17200460/pexels-photo-17200460/free-photo-of-mango-cocktail-set-next-to-cut-up-mango-fruit.jpeg?auto=compress&cs=tinysrgb&w=600",
      price: 370,
      category: FoodCategory.drinks,
      availableAddons: [
      ],
    ),
    Food(
      name: "Mango Lassi",
      description: "Cool and refreshing, our selection of cold drinks offers the perfect way to quench your thirst. Enjoy a variety of chilled beverages that complement any meal.",
      imagePath: "https://media.istockphoto.com/id/889603060/photo/glass-of-mango-lassi-view-from-above-north-indian-food.jpg?b=1&s=612x612&w=0&k=20&c=ZSffZy91tcw6zMGdXVnhzIKXZwX5UaG9XYvvUMibzcc=",
      price: 90,
      category: FoodCategory.drinks,
      availableAddons: [
      ],
    ),


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