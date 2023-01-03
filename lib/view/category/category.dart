import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/home/home_product.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categorys extends StatelessWidget {
  static const catRoute = "/category";
  const Categorys({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as String;
    final productCategory =
        Provider.of<HomeProductController>(context, listen: false)
            .findByCategory(arg);
    return Scaffold(
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
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 190,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 250,
                                childAspectRatio: 1 / 2),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              RouteNames.productDetailPage,
                              arguments: productCategory[index].id,
                            );
                          },
                          child: Container(
                            width: 140,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade100,
                                style: BorderStyle.solid,
                                strokeAlign: StrokeAlign.inside,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Colors.red[50],
                                      child: Image.network(
                                        "http://${MainUrls.baseUrl}/products/${productCategory[index].image[index]}",
                                        width: 120,
                                        height: 120,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWithFamily(
                                        title: productCategory[index].name,
                                        ls: 0,
                                        colors: Colors.indigo,
                                        fontwght: FontWeight.bold,
                                        fontsz: 18,
                                        textalign: TextAlign.justify,
                                        maxline: 1,
                                        ws: -1,
                                      ),
                                      Ksize.ksize10,
                                      TextTitle(
                                          title:
                                              "₹ ${productCategory[index].discountPrice.toStringAsFixed(1)}",
                                          ls: 0,
                                          colors: Colors.black,
                                          fontwght: FontWeight.normal,
                                          fontsz: 16,
                                          textalign: TextAlign.justify,
                                          maxline: 1),
                                      Ksize.ksize10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Titlete(
                                            title:
                                                " ₹ ${productCategory[index].price}"
                                                    .toString(),
                                            ls: 0,
                                            colors: Colors.grey,
                                            fontwght: FontWeight.normal,
                                            fontsz: 17,
                                            textalign: TextAlign.justify,
                                            maxline: 1,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, bottom: 10),
                                            child: TextTitle(
                                                title:
                                                    "${productCategory[index].offer}%"
                                                        .toString(),
                                                ls: 0,
                                                colors: Colors.red,
                                                fontwght: FontWeight.normal,
                                                fontsz: 17,
                                                textalign: TextAlign.justify,
                                                maxline: 1),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
