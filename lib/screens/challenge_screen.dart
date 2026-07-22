import 'dart:math';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}


class _ChallengeScreenState extends State<ChallengeScreen> {

  String challenge = "Tap the button for today's challenge 💡";


  final List<String> challenges = [

    "Learn something new today 📚",
    "Drink more water 💧",
    "Take a 15 minute walk 🚶",
    "Organize your workspace 🗂️",
    "Try a new recipe 🍳",
    "Read a few pages of a book 📖",
    "Call someone you care about 📞",
    "Practice a new skill ✨",

  ];


  void getChallenge() {

    final random = Random();

    setState(() {

      challenge = challenges[random.nextInt(challenges.length)];

    });

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF7F3E8),


      appBar: AppBar(

        title: const Text(
          "Daily Challenge 💡",
        ),

        backgroundColor:
            const Color(0xff8FAF9A),

      ),


      body: Center(

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,


          children: [


            Container(

              width: 320,

              padding:
                  const EdgeInsets.all(30),


              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(25),


                boxShadow: const [

                  BoxShadow(

                    blurRadius: 10,

                    color: Colors.black12,

                  )

                ],

              ),


              child: Text(

                challenge,

                textAlign: TextAlign.center,


                style: const TextStyle(

                  fontSize: 22,

                  fontWeight:
                      FontWeight.bold,

                ),

              ),

            ),



            const SizedBox(height: 30),



            ElevatedButton(

              onPressed: getChallenge,


              style: ElevatedButton.styleFrom(

                backgroundColor:
                    const Color(0xff8FAF9A),


                padding:
                    const EdgeInsets.symmetric(

                      horizontal: 40,

                      vertical: 15,

                    ),

              ),


              child: const Text(

                "Get Challenge 🎯",

                style: TextStyle(

                  color: Colors.white,

                  fontSize: 18,

                ),

              ),

            )


          ],

        ),

      ),

    );

  }

}