import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/view/detail_page/widget/product_over_title.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.loadProduct,
  }) : super(key: key);
  final ProductModel loadProduct;
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
            SizedBox(
              width: double.infinity,
              child: Text(loadProduct.description),
            ),
            Ksize.ksize10,
            OverViewDetails(
                title: 'Type', data: loadProduct.details.ram.toString()),
            Ksize.ksize10,
            OverViewDetails(
                title: 'Design',
                data: loadProduct.details.processor.toString()),
            Ksize.ksize10,
            OverViewDetails(
                title: 'Sleeve Length',
                data: loadProduct.details.rearCam.toString()),
            Ksize.ksize10,
            OverViewDetails(
                title: 'Fabric', data: loadProduct.details.display.toString()),
            Ksize.ksize10,
            OverViewDetails(
                title: 'Fit', data: loadProduct.details.battery.toString())
          ],
        ),
      ),
    );
  }
}
