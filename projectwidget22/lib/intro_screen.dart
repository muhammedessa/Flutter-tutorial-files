import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:projectwidget22/home.dart';

class IntroScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();

  }
}

class _IntroScreen extends State<IntroScreen> {


  @override
  Widget build(BuildContext context) {

    PageDecoration pageDecoration = const PageDecoration(
      titleTextStyle:  TextStyle( fontSize: 28.0, fontWeight: FontWeight.w400, color: Colors.teal ),
      bodyTextStyle:TextStyle( fontSize: 19.0,  color: Colors.teal ),
      imagePadding: EdgeInsets.all(20),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1,0.5,0.7,0.9],
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
          ]
        )
      )

    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: intoImage('assets/images/1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: intoImage('assets/images/2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: intoImage('assets/images/3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: ()=> goHomePage(context),
      onSkip: ()=> goHomePage(context),
      showSkipButton: true,
      nextFlex: 0,
      skip: const Text('skip',style: TextStyle(color: Colors.deepOrange),),
      next: const Icon(Icons.arrow_forward,color: Colors.teal),
      done: const Text('Getting Started',style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w400),),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color:Colors.deepOrange,
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
      ),
    );

  }

  void goHomePage(context){
    Navigator.of(context)
        .pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){
          return MyHomePage();
        }
        ), (Route<dynamic> route) => false);
  }
}

Widget intoImage(String assetName){
  return Align(
    child: Image.asset('$assetName',width: 300,),
    alignment: Alignment.bottomCenter,
  );
}
