import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    this.title,
    this.icon,
  }) : super(key: key);
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        children: [
          Ksize.ksize20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title ?? '',
                      // 'My Bag',
                      style: SafeGoogleFont(
                        'Metropolis',
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        height: 1.5,
                        color: Colors.black,

                        // const Color(0xff222222),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
