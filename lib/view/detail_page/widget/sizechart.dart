import 'package:ecommerce/model/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/home/home_product.dart';

class SizeChartWidget extends StatelessWidget {
  const SizeChartWidget({
    Key? key,
    required this.loadProduct,
  }) : super(key: key);

  final ProductModel loadProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Select Size",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
        Consumer<HomeProductController>(builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                  loadProduct.size.length,
                  (index) => GestureDetector(
                        onTap: () =>
                            value.sizeSelect(index, loadProduct.size[index]),
                        child: Card(
                            elevation: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    color: value.sizeChartIndex == index
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              height: 30,
                              width: 30,
                              child: Center(
                                  child: Text(
                                loadProduct.size[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                            )),
                      )),
            ],
          );
        }),
      ],
    );
  }
}
