import 'package:ecommerce/constants/api_url.dart';
import 'package:ecommerce/controller/providers/order_details/order_details_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/ordered_product_details/widgets/order_cancel.dart';
import 'package:ecommerce/view/ordered_product_details/widgets/order_track.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderProductDetails extends StatelessWidget {
  const OrderProductDetails(
      {super.key, required this.orderId, required this.index1});
  final String orderId;
  final int index1;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OrderProvider>(context, listen: false)
          .getSingleOrder(orderId);
    });
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kcolors.bgcolor,
        title: const Text(
          'Order Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<OrderProvider>(
          builder: (context, value, child) {
            return value.loading == true || value.singleModel == null
                ? const LoadingWidget(color: Colors.black)
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height * .05,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Order ID  -  ${value.singleModel!.id.toUpperCase()}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Ksize.ksize20,
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Ksize.kWsize20,
                              SizedBox(
                                width: MediaQuery.of(context).size.height * .23,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Ksize.ksize30,
                                    Text(
                                        value.singleModel!.products[index1]
                                            .product.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    Ksize.ksize10,
                                    Text(
                                        "Qty :${value.singleModel!.products[index1].qty}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey)),
                                    Ksize.ksize10,
                                    Text(
                                        "Size :${value.singleModel!.products[index1].size}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey)),
                                    Ksize.ksize10,
                                    Text(
                                        "price :${value.singleModel!.products[index1].price}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey)),
                                  ],
                                ),
                              ),
                              Ksize.kWsize20,
                              Container(
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.height * .13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 233, 231, 231)
                                          .withOpacity(1),
                                ),
                                child: Image(
                                  height: 60,
                                  width: 100,
                                  image: NetworkImage(
                                      "http://${MainUrls.url}/products/${value.singleModel!.products[index1].product.image[0]}"),
                                ),
                              )
                            ],
                          ),
                        ),
                        Ksize.ksize20,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: value.singleModel!.orderStatus == 'CANCELED'
                              ? OrderCanceldStatusWidget(index: index1)
                              : OrderSucssesStatusWidget(index: index1),
                        ),
                        Ksize.ksize20,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Shopping Details",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                const Divider(),
                                Text(
                                  value.singleModel!.fullName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                Ksize.ksize5,
                                Text(
                                    '${value.singleModel!.address}\n${value.singleModel!.place}\n${value.singleModel!.state} - ${value.singleModel!.pin}\nPhone Number: ${value.singleModel!.phone}')
                              ],
                            ),
                          ),
                        ),
                        Ksize.ksize20,
                        Consumer<OrderProvider>(
                            builder: (context, value, child) {
                          return value.singleModel!.orderStatus == 'CANCELED'
                              ? const SizedBox()
                              : CustomElevateButton(
                                  size: 16,
                                  text: 'Cancel Order',
                                  onpressed: () {
                                    value.cancelOrder(orderId);
                                  },
                                );
                        }),
                        Ksize.ksize10,
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
