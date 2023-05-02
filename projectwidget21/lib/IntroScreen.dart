import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:projectwidget21/home.dart';

class IntroScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }

}

class _IntroScreen extends State<IntroScreen>{

  @override
  Widget build(BuildContext context) {

    //this is a page decoration for intro screen
    PageDecoration pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color:Colors.black
      ), //tile font size, weight and color
      bodyTextStyle:TextStyle(fontSize: 19.0, color:Colors.black),
      //body text size and color

      //decription padding
      imagePadding: EdgeInsets.all(10), //image padding
      boxDecoration:BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
          ],
        ),
      ), //show linear gradient background of page
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      
      //main background of screen
      pages: [ //set your page view here
        PageViewModel(
          title: "Fractional shares",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/3.png'),
          decoration: pageDecoration,
        ),

        //add more screen here
      ],

      onDone: () => goHomepage(context), //go to home page on done
      onSkip: () => goHomepage(context), // You can override on skip
      showSkipButton: true,

      nextFlex: 0,
      skip: const Text('Skip', style: TextStyle(color: Colors.deepPurple),),
      next: const Icon(Icons.arrow_forward, color: Colors.deepPurple,),
      done: const Text('Getting Stated', style: TextStyle(
          fontWeight: FontWeight.w600, color:Colors.deepPurple
      ),),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Colors.deepPurple, //color of dots
        activeSize: Size(22.0, 10.0),
        //activeColor: Colors.white, //color of active dot
        activeShape: RoundedRectangleBorder( //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){
          return MyHomePage();
        }
        ), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      child: Image.asset('$assetName', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }
}