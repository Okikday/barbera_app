import 'package:flutter/material.dart';
import 'package:barbera_app/getting_started/intro_screen.dart';
import 'package:barbera_app/main.dart';

class BarberaSplashScreen extends StatefulWidget {
  const BarberaSplashScreen({super.key});

  @override
  State<BarberaSplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<BarberaSplashScreen> {
  late bool isPassed;

  @override
  void initState() {
    super.initState();
    isPassed = false;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 750), () async{
      
     if(isPassed == false){
      // ignore: use_build_context_synchronously
       Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroScreen()));
     }
      isPassed = true;
    });
    
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        runApp(const MyApp());
        debugPrint("Back to MainApp");
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: SizedBox(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                    image: AssetImage("assets/barbera/images/barbera_logo.png"),
                    fit: BoxFit.contain,
                    
                  )
              
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}