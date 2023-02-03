import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/order_details/order_details_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/ordered_product_details/ordered_product_details.dart';
import 'package:ecommerce/widgets/bottom_nav.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, this.args});
  final dynamic args;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OrderProvider>(context, listen: false).getAllOrders();
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) {
                  return const BottomNav();
                },
              ), (route) => false);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Kcolors.bgcolor,
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Consumer<OrderProvider>(
        builder: (context, value, child) {
          return value.ordersList!.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Your Orders is empty!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: ,
                      //     foregroundColor: whiteColor,
                      //     elevation: 0,
                      //   ),
                      //   onPressed: () {
                      //     Navigator.pop(context);

                      //     Provider.of<BottomNavController>(context,
                      //             listen: false)
                      //         .gotoHomescreen();
                      //   },
                      //   child: const Text('Order Now'),
                      // ),
                      CustomElevateButton(
                        size: 18,
                        text: 'Order Now',
                        onpressed: () {},
                      )
                    ],
                  ),
                )
              : value.loading == true
                  ? const LoadingWidget(
                      color: Colors.black,
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: ListView.separated(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final deliveryDate = value.formatDate(
                              value.ordersList![index].deliveryDate.toString());
                          final canceledDate = value.formatCancelDate(
                              value.ordersList![index].cancelDate.toString());
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: value.ordersList![index].products.length,
                            itemBuilder: (context, index1) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return OrderProductDetails(
                                        index1: index1,
                                        orderId: value.ordersList![index].id,
                                      );
                                    },
                                  ));
                                },
                                child: Row(
                                  children: [
                                    Image(
                                      height: 70,
                                      width: 70,
                                      image: NetworkImage(
                                          "http://${MainUrls.url}/products/${value.ordersList![index].products[index1].product.image[0]}"),
                                    ),
                                    Ksize.kWsize10,
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .6,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .7,
                                            child: Text(
                                              value
                                                  .ordersList![index]
                                                  .products[index1]
                                                  .product
                                                  .name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            value.ordersList![index1]
                                                        .orderStatus ==
                                                    'CANCELED'
                                                ? 'Delivery Canceled on $canceledDate'
                                                : value.ordersList![index1]
                                                            .orderStatus ==
                                                        'delivered'
                                                    ? 'Delivered on $deliveryDate'
                                                    : 'Delivery on $deliveryDate',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: value.ordersList?.length ?? 0,
                      ),
                    );
        },
      ),
    );
  }
}
