import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/home/home_controller.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/category/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, value, child) {
      return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        padding: const EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        itemCount: value.categoryList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Categorys.catRoute,
                  arguments: value.carousalList[index].id);
            },
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                            "http://${MainUrls.url}/category/${value.categoryList[index].image}"),
                        fit: BoxFit.cover),
                  ),
                ),
                Ksize.ksize10,
                Text(value.categoryList[index].name),
              ],
            ),
          );
        },
      );
    });
  }
}
