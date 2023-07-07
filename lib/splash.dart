import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage(
                  'assets/splash1.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage(
                  'assets/splash2.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage(
                  'assets/splash3.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              child: Text(
                'Craftted By Cybertize Tecnologies Pvt. Ltd',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
