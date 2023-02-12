import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/detail_page/widget/detail_page_details.dart';
import 'package:ecommerce/view/detail_page/widget/product_description.dart';
import 'package:ecommerce/view/detail_page/widget/product_image_view.dart';
import 'package:ecommerce/view/detail_page/widget/sizechart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/add_buy_cart.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeNames = "/detail_page";
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadProduct =
        Provider.of<HomeProductController>(context, listen: false)
            .findById(productId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProductController>(context, listen: false).sizechart0();
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // const Color.fromARGB(255, 233, 231, 231).withOpacity(1),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 233, 231, 231).withOpacity(1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductImageView(loadProduct: loadProduct),
              DetailPageDetails(loadProduct: loadProduct),
              Ksize.ksize5,
              Container(
                color: Colors.white,
                height: 100,
                width: double.infinity,
                child: SizeChartWidget(loadProduct: loadProduct),
              ),
              Ksize.ksize5,
              ProductDescription(
                loadProduct: loadProduct,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          AddBuyAndCart(loadProduct: loadProduct, productId: productId),
    );
  }
}
