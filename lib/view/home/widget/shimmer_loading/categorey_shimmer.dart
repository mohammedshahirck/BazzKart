import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class CategoreyShimmer extends StatelessWidget {
  const CategoreyShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Ksize.kWsize10,
                  ShimmerWidget.rectangle(
                      radius: BorderRadius.circular(15), height: 80, width: 80),
                ],
              ),
              Ksize.ksize10,
              Row(
                children: [
                  Ksize.kWsize10,
                  ShimmerWidget.rectangle(
                      radius: BorderRadius.circular(15), height: 15, width: 50),
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
        itemCount: 4);
  }
}
