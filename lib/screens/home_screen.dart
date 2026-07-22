import 'package:flutter/material.dart';

import 'food_screen.dart';
import 'outfit_screen.dart';
import 'watch_screen.dart';
import 'places_screen.dart';
import 'study_screen.dart';


import 'package:decidenow/screens/music_screen.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});


  

   final List<Map<String, dynamic>> options = const [
  {
    "title": "Food",
    "subtitle": "What should I eat?",
    "icon": Icons.restaurant,
    "screen": FoodScreen(),
  },
  {
    "title": "Outfit",
    "subtitle": "Choose my style",
    "icon": Icons.checkroom,
    "screen": OutfitScreen(),
  },
  {
    "title": "Watch",
    "subtitle": "Pick a movie",
    "icon": Icons.movie,
    "screen": WatchScreen(),
  },
  {
    "title": "Places",
    "subtitle": "Where to go?",
    "icon": Icons.location_on,
    "screen": GoScreen(),
  },
  {
    "title": "Study",
    "subtitle": "What should I study?",
    "icon": Icons.school,
    "screen": StudyScreen(),
  },
  {
    "title": "Music",
    "subtitle": "What should I listen to?",
    "icon": Icons.music_note,
    "screen": MusicScreen(),
  },

  ];



  void navigate(BuildContext context, String title) {


    Widget? screen;


    if (title == "Food") {
      screen = const FoodScreen();
    }

    else if (title == "Outfit") {
      screen = const OutfitScreen();
    }

    else if (title == "Watch") {
      screen = const WatchScreen();
    }

    else if (title == "Places") {
      screen = const GoScreen();
    }
   else if (title == "Study") {
  screen = const StudyScreen();
}

    else if (title == "Music") {
      screen = const MusicScreen();
    }

    

    

    if (screen != null) {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen!,
        ),
      );

    }

  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF7F3E8),


      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(20),


          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,


            children: [


              const Text(

                "DecideNow 🌿",

                style: TextStyle(

                  fontSize: 32,

                  fontWeight: FontWeight.bold,

                  color: Color(0xff4E6B58),

                ),

              ),


              const SizedBox(height: 8),


              const Text(

                "Make decisions easier, faster and smarter ✨",

                style: TextStyle(

                  fontSize: 16,

                  color: Colors.grey,

                ),

              ),



              const SizedBox(height: 25),



              Container(

                width: double.infinity,

                padding: const EdgeInsets.all(20),


                decoration: BoxDecoration(

                  color: Color(0xff8FAF9A),

                  borderRadius:
                      BorderRadius.circular(25),

                ),


                child: const Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,


                  children: [

                    Text(

                      "Welcome 👋",

                      style: TextStyle(

                        fontSize: 24,

                        fontWeight:
                            FontWeight.bold,

                        color: Colors.white,

                      ),

                    ),


                    SizedBox(height: 8),


                    Text(

                      "Your personal decision assistant 🌿",

                      style: TextStyle(

                        fontSize: 16,

                        color: Colors.white,

                      ),

                    ),

                  ],

                ),

              ),



              const SizedBox(height: 25),



              Expanded(

                child: GridView.builder(

                  itemCount: options.length,


                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(

                    crossAxisCount: 2,

                    crossAxisSpacing: 15,

                    mainAxisSpacing: 15,

                  ),


                  itemBuilder: (context,index){


                    return InkWell(

                      onTap: (){

                        navigate(
                          context,
                          options[index]["title"],
                        );

                      },


                      borderRadius:
                          BorderRadius.circular(25),


                      child: Container(

                        decoration: BoxDecoration(

                          color: Colors.white,

                          borderRadius:
                              BorderRadius.circular(25),


                          boxShadow: const [

                            BoxShadow(

                              blurRadius: 8,

                              color: Colors.black12,

                            )

                          ],

                        ),


                        child: Column(

                          mainAxisAlignment:
                              MainAxisAlignment.center,


                          children: [


                            Icon(

                              options[index]["icon"],

                              size: 45,

                              color:
                                  Color(0xff8FAF9A),

                            ),


                            const SizedBox(height: 12),


                            Text(

                              options[index]["title"],

                              style: const TextStyle(

                                fontSize: 18,

                                fontWeight:
                                    FontWeight.bold,

                              ),

                            ),


                            const SizedBox(height: 5),


                            Text(

                              options[index]["subtitle"],

                              textAlign:
                                  TextAlign.center,

                              style: const TextStyle(

                                fontSize: 12,

                                color:
                                    Colors.grey,

                              ),

                            ),

                          ],

                        ),

                      ),

                    );

                  },

                ),

              )


            ],

          ),

        ),

      ),

    );

  }

}