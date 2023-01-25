import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/detail_page/widget/product_over_title.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Details',
              style: SafeGoogleFont(
                'Metropolis',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.2575,
                color: Colors.black,
                // const Color(0xff222222),
              ),
            ),
            Ksize.ksize10,
            const SizedBox(
              width: double.infinity,
              child: Text(
                'An ideal pick for a casual wardrobe, this casual shirt is designed with a solid surface, spread collar and a patch pocket.',
              ),
            ),
            Ksize.ksize10,
            const OverViewDetails(
              data: 'Formal',
              title: 'Type',
            ),
            Ksize.ksize10,
            const OverViewDetails(title: 'Design', data: 'Solid'),
            Ksize.ksize10,
            const OverViewDetails(title: 'Sleeve Length', data: 'Full Sleeves'),
            Ksize.ksize10,
            const OverViewDetails(title: 'Fabric', data: 'Cotton Blend'),
            Ksize.ksize10,
            const OverViewDetails(title: 'Fit', data: 'Slim Fit')
          ],
        ),
      ),
    );
  }
}
