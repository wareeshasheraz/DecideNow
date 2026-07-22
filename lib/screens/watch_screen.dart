import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';


class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}


class _WatchScreenState extends State<WatchScreen> {
  final StreamController<int> selected =
      StreamController<int>();

  int? selectedIndex;


  final List<Map<String, String>> movies = [
  {"name": "Action", "emoji": "💥"},
  {"name": "Comedy", "emoji": "😂"},
  {"name": "Horror", "emoji": "👻"},
 {"name": "Adventure", "emoji": "🗺️"},
  {"name": "Anime", "emoji": "🎌"},
  {"name": "Sci-Fi", "emoji": "🚀"},
];


  void spinWheel() {

    final result =
        Random().nextInt(movies.length);


    selected.add(result);


    Future.delayed(
      const Duration(seconds: 3),
      () {

        setState(() {

          selectedIndex = result;

        });

      },
    );

  }



  @override
  void dispose() {

    selected.close();

    super.dispose();

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xffF7F3E8),


      appBar: AppBar(

        title: const Text(
          "What Should I Watch? 🎬",
        ),

        backgroundColor:
            const Color(0xff8FAF9A),

      ),



      body: Column(

        mainAxisAlignment:
            MainAxisAlignment.center,


        children: [


          SizedBox(

            height: 280,


            child: FortuneWheel(

              selected:
                  selected.stream,


              items: [

                for (var movie in movies)

                  FortuneItem(

                    child: Center(

                      child: Text(

                        "${movie["emoji"]} ${movie["name"]}",

                        style:
                        const TextStyle(

                          fontSize: 18,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),

                    ),

                  ),

              ],

            ),

          ),



          const SizedBox(height: 25),



          Container(

            width: 230,

            padding:
                const EdgeInsets.symmetric(

                  vertical: 12,

                  horizontal: 12,

                ),


           decoration: BoxDecoration(
  color: const Color(0xFFE8F4EA),
  borderRadius: BorderRadius.circular(22),
  border: Border.all(
    color: const Color(0xFF8FAF9A),
    width: 1.5,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 12,
      offset: const Offset(0, 5),
    ),
  ],
),


            child: selectedIndex == null

                ? const Column(

                    children: [

                      Text(

                        "🤔",

                        style:
                        TextStyle(

                          fontSize: 35,

                        ),

                      ),

                      Text(

                        "Spin to decide",

                        style:
                        TextStyle(

                          fontSize: 18,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),

                    ],

                  )


                : Column(

                    children: [

                      const Text(

                        "Your Choice 🎬",

                        style:
                        TextStyle(

                          fontSize: 18,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),


                      const SizedBox(height: 5),


                      Text(

                        movies[selectedIndex!]["emoji"] ?? "",

                        style:
                        const TextStyle(

                          fontSize: 38,

                        ),

                      ),


                      Text(

                        movies[selectedIndex!]["name"] ?? "",

                        style:
                        const TextStyle(

                          fontSize: 19,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),

                    ],

                  ),

          ),



          const SizedBox(height: 25),



          ElevatedButton(

            onPressed: spinWheel,


            style: ElevatedButton.styleFrom(

              backgroundColor:
                  const Color(0xff8FAF9A),

              padding:
              const EdgeInsets.symmetric(

                horizontal: 45,

                vertical: 14,

              ),

              shape:
              RoundedRectangleBorder(

                borderRadius:
                BorderRadius.circular(30),

              ),

            ),


            child: const Text(

              "SPIN 🎡",

              style:
              TextStyle(

                color: Colors.white,

                fontSize: 18,

              ),

            ),

          )

        ],

      ),

    );

  }

}