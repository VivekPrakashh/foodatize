import 'package:flutter/material.dart';
import 'package:foodatize/accountdetail.dart';
import 'package:foodatize/addaddress.dart';
import 'package:foodatize/address.dart';
import 'package:foodatize/bookingdetail.dart';
import 'package:foodatize/cart.dart';
import 'package:foodatize/checkout.dart';
import 'package:foodatize/home.dart';
import 'package:foodatize/login.dart';
import 'package:foodatize/myaccount.dart';
import 'package:foodatize/orders.dart';
import 'package:foodatize/otp.dart';
import 'package:foodatize/otp2.dart';
import 'package:foodatize/signup.dart';
import 'package:foodatize/splash.dart';
import 'package:foodatize/thankyou.dart';
import 'package:foodatize/util/storage.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  runApp(const MyApp());
}

@override
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
        routes: {
          '/splash': (context) => const Splash(),
          '/login': (context) => const Login(),
          '/otp': (context) => const Otp(),
          '/otp2': (context) => const Otp2(),
          '/signup': (context) => const Signup(),
          '/home': (context) => const Home(),
          '/cart': (context) => const Cart(),
          '/address': (context) => const Address(),
          '/addaddress': (context) => const Addaddress(),
          '/checkout': (context) => const Checkout(),
          '/thankyou': (context) => const Thankyou(),
          '/orders': (context) => const Orders(),
          '/bookingdetail': (context) => const Bookingdetails(),
          '/myaccount': (context) => const Myaccount(),
          '/accountdetail': (context) => const Accountdetail(),
        });
  }
}
