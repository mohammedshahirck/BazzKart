import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/home/home_controller.dart';
import 'package:ecommerce/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarousalBuilder extends StatelessWidget {
  const CarousalBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, values, child) {
      return values.carousalList.isEmpty
          ? CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return const ShimmerWidget.rectangle(
                    height: 200, width: double.infinity);
              },
              options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 18 / 150,
                  height: 200,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInQuint,
                  onPageChanged: (index, reason) {
                    values.carosoul(index);
                  },
                  initialPage: values.activeindex
                  // enlargeCenterPage: true,
                  ),
            )
          : CarouselSlider.builder(
              itemCount: values.carousalList.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: double.infinity,
                  // child: Image.network(img[index])
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://${MainUrls.url}/carousals/${values.carousalList[index].imagePath}"),
                      fit: BoxFit.cover,
                    ),
                    // shape: BoxShape.circle,
                  ),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 18 / 150,
                  height: 200,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInQuint,
                  onPageChanged: (index, reason) {
                    values.carosoul(index);
                  },
                  initialPage: values.activeindex
                  // enlargeCenterPage: true,
                  ),
            );
    });
  }
}
