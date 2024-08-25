import 'package:flutter/material.dart';
import 'package:flutterproject/components/my_current_location.dart';
import 'package:flutterproject/components/my_description_box.dart';
import 'package:flutterproject/components/my_sliver_app_bar.dart';
import '../components/my_current_location.dart';
import '../components/my_drawer.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled)=>[
            MySliverAppBar(
                title: Text('title'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(indent: 25,endIndent: 25, color: Theme.of(context).colorScheme.secondary,),

                    //my current location
                    const MyCurrentLocation(),
                    //Description box
                    const MyDescriptionBox(),
                  ],
                ),
            ),
          ],
          body: Container(color: Colors.blue),
      ),
    );

  }
}