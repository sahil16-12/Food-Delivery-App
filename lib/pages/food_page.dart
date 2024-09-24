import 'package:flutter/material.dart';
import 'package:flutterproject/components/my_button.dart';
import 'package:flutterproject/main.dart';
import 'package:flutterproject/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
class FoodPage extends StatefulWidget
{
  final Food food;
  final Map<Addon,bool> selectedAddons = {};
  FoodPage({
    super.key,
    required this.food
  }){
    //initialize selected addons to be false
    for(Addon addon in food.availableAddons)
      {
        selectedAddons[addon] = false;
      }
  }
  @override
  State<FoodPage> createState() => _FoodPageState();
}
class _FoodPageState extends State<FoodPage>
{

  //method to add to cart
  void addToCart(Food food,Map<Addon,bool> selectedAddons){
    //close the current food page to go v=back to menu
    Navigator.pop(context);

    //format the selected Addons
    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food,currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children: [
        //scaffold UI
        Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //food image
                  Image.network(widget.food.imagePath),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //food name
                        Text(
                          widget.food.name,
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ) ,
                        ),

                        // food price
                        Text(
                          '₹${widget.food.price}',
                          style:TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary
                          ) ,
                        ),

                        const SizedBox(height: 10),

                        // food description
                        Text(
                          widget.food.description,
                          style:TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary
                          ) ,
                        ),

                        const SizedBox(height: 10),
                        Divider(color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(height: 10),

                        //addons

                        Text(
                          "Add-ons",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.secondary),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context,index)
                            {
                              //get individual addon
                              Addon addon = widget.food.availableAddons[index];

                              //return check box UI
                              return CheckboxListTile(
                                title: Text(addon.name),
                                subtitle: Text(
                                  '₹${addon.price}',
                                  style: TextStyle(
                                      color:Theme.of(context).colorScheme.primary
                                  ),
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value ){
                                  setState(() {
                                    widget.selectedAddons[addon] = value! ;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                  ),
                  //button -> add to cart

                  MyButton(
                    onTap: () => addToCart(widget.food,widget.selectedAddons),
                    text: "Add to Cart",
                  ),

                  const SizedBox(height:25),
                ],
              ),
            )
        ),

        //back Button
       SafeArea(
           child: Opacity(
               opacity: 0.6,
               child: Container(
                 margin: const EdgeInsets.only(left: 25),
                 decoration: BoxDecoration(
                   color: Theme.of(context).colorScheme.secondary,
                   shape: BoxShape.circle,
                 ),
                 child: IconButton(
                   icon: const Icon(Icons.arrow_back_ios_rounded),
                   onPressed:() => Navigator.pop(context),
                 ),
               ),
           ),
       ),
      ],
    );
  }
}