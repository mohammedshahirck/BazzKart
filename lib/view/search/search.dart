import 'package:ecommerce/controller/providers/home/home_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/gridview_products.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kcolors.bgcolor,
        elevation: 0,
        title: CupertinoSearchTextField(
          autofocus: true,
          backgroundColor: Colors.grey.withOpacity(0.4),
          style: const TextStyle(color: Colors.black),
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          suffixIcon: const Icon(
            CupertinoIcons.xmark_circle_fill,
            color: Colors.grey,
          ),
          onChanged: (value) => {
            homeProvider.debouncer.run(() {
              homeProvider.searchProducts(value);
            })
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Ksize.ksize10,
            Consumer<HomeController>(
              builder: (context, values, _) {
                return values.isLoading == true
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: const Center(
                          child: LoadingWidget(
                            color: Colors.black,
                          ),
                        ),
                      )
                    : values.productList.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 1.3,
                            width: double.infinity,
                            child: const Center(
                              child: Text('No prouducts found'),
                            ),
                          )
                        : const GridViewProducts(
                            physics: NeverScrollableScrollPhysics(),
                          );
              },
            )
          ],
        ),
      ),
    );
  }
}
