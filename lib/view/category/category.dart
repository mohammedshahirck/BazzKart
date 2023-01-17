import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categorys extends StatelessWidget {
  static const catRoute = "/category";
  const Categorys({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    final arg = ModalRoute.of(context)?.settings.arguments as String;
    final productCategory =
        Provider.of<HomeProductController>(context, listen: false)
            .findByCategory(arg);
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: AppBar(
        backgroundColor: Kcolors.bgcolor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Consumer<HomeProductController>(
            builder: (context, value, child) {
              return productCategory.isEmpty
                  ? const Center(child: LoadingWidget(color: Colors.black))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1,
                          childAspectRatio: 1.1 / 2,
                        ),
                        itemBuilder: (context, index) => ProductCard(
                            ffem: ffem,
                            fem: fem,
                            image:
                                "http://172.16.4.134:5005/products/${productCategory[index].image[0]}",
                            name: productCategory[index].name,
                            price:
                                "${(productCategory[index].price) - (productCategory[index].discountPrice)}",
                            offer: productCategory[index].offer.toString(),
                            rating: productCategory[index].rating,
                            argument: productCategory[index].id),
                        itemCount: productCategory.length,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
