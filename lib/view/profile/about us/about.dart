import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Kcolors.bgcolor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Ksize.ksize40,
                      Text(
                        'Welcome to BAZZKART,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Ksize.ksize20,
                      Text(
                        '''Welcome to Bazzkart, the leading online destination for fashion lovers everywhere. Our goal is to bring you the latest in fashion trends and styles from around the world, all in one convenient and easy-to-use platform. Whether you're looking for the latest streetwear trends or want to upgrade your formalwear collection, we've got you covered.

We're passionate about fashion and believe that everyone should have access to the latest styles and designs, no matter where they live or what their budget is. That's why we work with top designers and brands to bring you the latest and greatest in fashion, all at affordable prices.

With Bazzkart shop from anywhere, at any time. Our user-friendly app makes it easy to find exactly what you're looking for, whether you're on the go or at home. You can browse our curated collections, or search for specific items using our powerful search tool. We also offer fast and free shipping, so you can get your new clothes as soon as possible.

At Bazzkart, we're committed to providing the best possible shopping experience for our customers. That's why we offer a 30-day return policy, so you can shop with confidence. And if you need help or have any questions, our friendly customer support team is always here to assist you.

So what are you waiting for? Download Bazzkart now and start shopping the latest fashion trends and styles today!
 ''',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          letterSpacing: .6,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Varsion 1.0.0",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Developed By shahir C K",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
