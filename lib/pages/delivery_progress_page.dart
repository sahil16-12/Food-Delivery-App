import 'package:flutter/material.dart';
import 'package:flutterproject/components/my_cart_tile.dart';
import 'package:flutterproject/components/my_receipt.dart';
import 'package:flutterproject/models/restaurant.dart';
import 'package:flutterproject/services/database/firestore.dart';
import 'package:provider/provider.dart';
class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          MyReceipt()
        ],
      ),
    );
  }

  //custom Bottom Nav Bar - Message / call delivery Driver
  Widget _buildBottomNavBar(BuildContext context)
  {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
            topLeft:Radius.circular(40),
            topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of Driver

          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.person),
            ),
          ),

          const SizedBox(width: 10,),

          //driver Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mitch koko",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                  "Driver",
                  style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              //message button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(width: 10,),

              //call button

              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),
              ),

            ],
          )


        ],
      ),

    );
  }
}
