import 'package:ecommerce/controller/providers/splash.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController =
        Provider.of<SplashController>(context, listen: false);
    splashController.checkLogin(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ba',
                  style:
                      GoogleFonts.hurricane(fontSize: 130, color: Colors.white),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'zz',
                  style: GoogleFonts.knewave(fontSize: 70, color: Colors.white),
                ),
              ],
            ),
            const LoadingWidget(),
            Ksize.ksize20,
            Ksize.ksize20,
          ],
        ),
      )),
    );
  }
}
