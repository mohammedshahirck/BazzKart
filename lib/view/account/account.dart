import 'package:ecommerce/controller/providers/profile/profile_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/account/widgets/profile_list_tile.dart';
import 'package:ecommerce/view/account/widgets/user_details_text.dart';
import 'package:ecommerce/view/address_view/address_view.dart';
import 'package:ecommerce/view/oder_history/order_history.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  const Account({super.key});
  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<ProfileController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userDetails.getUser();
    });

    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: AppBar(
          title: Column(
            children: [
              Text(
                'Profile',
                style: SafeGoogleFont(
                  'Metropolis',
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  height: 1.5,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Consumer<ProfileController>(builder: (context, value, child) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Ksize.ksize20,
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 213, 215, 216),
                          radius: 35,
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Color.fromARGB(255, 80, 156, 191),
                          ),
                        ),
                        Ksize.ksize20,
                      ],
                    ),
                    Ksize.kWsize10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserDetialsText(
                          result: value.userModel?.fullname ?? '',
                        ),
                        Ksize.ksize5,
                        UserDetialsText(
                          // title: "Email",
                          result: value.userModel?.email ?? "",
                        ),
                        Ksize.ksize5,
                        UserDetialsText(
                          // title: "Number",
                          result: value.userModel?.phone ?? "",
                        ),
                        Ksize.ksize5,
                      ],
                    ),
                  ],
                ),
              ),
              ProfileListTile(
                icon: FontAwesomeIcons.box,
                title: 'My orders',
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const OrderDetails();
                    },
                  ));
                },
              ),
              ProfileListTile(
                title: 'Shipping addresses',
                icon: FontAwesomeIcons.mapLocation,
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const AddressView();
                    },
                  ));
                },
              ),
              ProfileListTile(
                title: 'About Us',
                icon: FontAwesomeIcons.info,
                ontap: () {},
              ),
              Consumer<ProfileController>(builder: (context, value, child) {
                return ProfileListTile(
                  title: 'Logout',
                  // ignore: deprecated_member_use
                  icon: FontAwesomeIcons.signOut,
                  ontap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: const Text('LogOut'),
                        content: const Text('Are you sure to Logout?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'NO'),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              value.logOut(context);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ]),
          ),
        );
      }),
    );
  }
}
