import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReloadWishlist extends StatelessWidget {
  const ReloadWishlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/common/wishlist.png'),
          ),
          Ksize.ksize10,
          Text(
            'Your Wishlist is empty !',
            style: GoogleFonts.aladin(
                fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
          ),
          Ksize.ksize10,
          const Text('Tap on ❤️ to start saving all your '),
          const Text('favorites'),
        ],
      ),
    );
  }
}
