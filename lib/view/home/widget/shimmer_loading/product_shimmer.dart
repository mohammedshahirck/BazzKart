import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangle(
                      radius: BorderRadius.circular(10),
                      height: 200,
                      width: 170),
                  Ksize.ksize10,
                  ShimmerWidget.rectangle(
                      radius: BorderRadius.circular(5), height: 16, width: 100),
                  Ksize.ksize5,
                  ShimmerWidget.rectangle(
                      radius: BorderRadius.circular(5), height: 10, width: 80),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Ksize.kWsize10;
          },
          itemCount: 10),
    );
  }
}
