import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
          itemBuilder: (context, index) => Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ShimmerWidget.rectangle(height: 120, width: 120),
                    ],
                  ),
                  Ksize.kWsize10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ShimmerWidget.rectangle(height: 10, width: 180),
                      Ksize.ksize10,
                      ShimmerWidget.rectangle(height: 10, width: 90),
                      Ksize.ksize10,
                      ShimmerWidget.rectangle(height: 10, width: 150),
                      Ksize.ksize10,
                      ShimmerWidget.rectangle(
                        height: 10,
                        width: 160,
                      ),
                    ],
                  ),
                ],
              ),
          separatorBuilder: (context, index) => Ksize.ksize10,
          itemCount: 5),
    );
  }
}
