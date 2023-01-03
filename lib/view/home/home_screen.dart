import 'package:ecommerce/controller/providers/home/home_controller.dart';
import 'package:ecommerce/controller/providers/profile/profile_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/home/widget/carosoul_builder.dart';
import 'package:ecommerce/view/home/widget/category_slider.dart';
import 'package:ecommerce/view/home/widget/home_title.dart';
import 'package:ecommerce/view/home/widget/product_slider.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).getCategories();
    });
    // final homeProvider = Provider.of<HomeController>(context, listen: false);
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ba',
                    style: GoogleFonts.hurricane(
                        fontSize: 50, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'zz',
                    style:
                        GoogleFonts.knewave(fontSize: 30, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 32,
                )),
          ],
          elevation: 0,
          backgroundColor: Kcolors.bgcolor,
        ),
      ),
      // PreferredSize(
      //   preferredSize: const Size(double.infinity, 70),
      //   child: AppBar(
      //     actions: [
      //       IconButton(
      //           onPressed: () {},
      //           icon: const Icon(
      //             Icons.shopping_bag_outlined,
      //             color: Colors.black,
      //             size: 32,
      //           )),
      //     ],
      //     elevation: 0,
      //     backgroundColor: Kcolors.bgcolor,
      //   ),
      // ),
      // drawer: Drawer(
      //     child: Column(
      //   children: [
      //     Ksize.ksize80,
      //     Consumer<LogoutController>(builder: (context, value, child) {
      //       return ListTile(
      //         leading: const Icon(Icons.logout),
      //         title: const Text('Log Out'),
      //         onTap: () {
      //           value.logOut(context);
      //         },
      //       );
      //     })
      //   ],
      // )),
      backgroundColor: Kcolors.bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<HomeController>(
            builder: (context, value, child) {
              return value.isLoading == true
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      width: double.infinity,
                      child: const Center(
                          child: LoadingWidget(
                        color: Colors.black,
                      )))
                  : value.carousalList.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: const Center(
                            child: LoadingWidget(
                              color: Colors.black,
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Ksize.ksize20,
                            const SizedBox(
                              height: 120,
                              child: CategorySlider(),
                            ),
                            // Ksize.ksize20,
                            const CarousalBuilder(),
                            Padding(
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: Column(
                                children: [
                                  SideTitle(
                                    ffem: ffem,
                                    fem: fem,
                                    text: 'New',
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'You\'ve never seen it before!',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ProductList(
                              ffem: ffem,
                              fem: fem,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: Column(children: [
                                SideTitle(
                                  ffem: ffem,
                                  fem: fem,
                                  text: 'Sale',
                                ),
                              ]),
                            ),
                            ProductList(
                              ffem: ffem,
                              fem: fem,
                            ),
                          ],
                        );
            },
          ),
        ),
      ),
    );
  }
}
