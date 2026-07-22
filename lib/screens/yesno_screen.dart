import 'dart:math';
import 'package:flutter/material.dart';

class YesNoScreen extends StatefulWidget {
  const YesNoScreen({super.key});

  @override
  State<YesNoScreen> createState() => _YesNoScreenState();
}

class _YesNoScreenState extends State<YesNoScreen> {

  String answer = "Ask your question 🤔";


  final List<String> answers = [
    "YES ✅",
    "NO ❌",
    "Maybe 🤔",
    "Try Again 🔄",
  ];


  void decideAnswer() {

    final random = Random();

    setState(() {

      answer = answers[random.nextInt(answers.length)];

    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF7F3E8),

      appBar: AppBar(

        title: const Text(
          "Yes / No Decision 🎲",
        ),

        backgroundColor: const Color(0xff8FAF9A),

      ),


      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,


          children: [


            Container(

              padding: const EdgeInsets.all(35),

              margin: const EdgeInsets.all(20),


              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(30),


                boxShadow: const [

                  BoxShadow(

                    blurRadius: 10,

                    color: Colors.black12,

                  )

                ],

              ),


              child: Text(

                answer,

                textAlign: TextAlign.center,


                style: const TextStyle(

                  fontSize: 32,

                  fontWeight: FontWeight.bold,

                ),

              ),

            ),



            const SizedBox(height: 30),



            ElevatedButton(

              onPressed: decideAnswer,


              style: ElevatedButton.styleFrom(

                backgroundColor:
                    const Color(0xff8FAF9A),

                padding: const EdgeInsets.symmetric(

                  horizontal: 45,

                  vertical: 15,

                ),

              ),


              child: const Text(

                "Decide 🎲",

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