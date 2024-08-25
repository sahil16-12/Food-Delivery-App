import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget{
  const MyCurrentLocation({super.key});
  
  void openLocationSearchBox(BuildContext context)
  {
    showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          title: Text("Your Location"),
          content: TextField(
            decoration: const InputDecoration(hintText: "search Address..."),
          ),
          actions: [

            //cancel
            MaterialButton(
              onPressed:()=> Navigator.pop(context),
              child: const Text('Cancel'),
            ),

            //save
            MaterialButton(
              onPressed:()=> Navigator.pop(context),
              child: const Text('Save'),
            ),
          ],
        ),
    );
  }
  
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now", 
            style:TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: ()=>openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Text(
                    "vaniyavad,Nadiad",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                //drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ]
            )
          ),  
        ],
      ) ,
    );
  }
}