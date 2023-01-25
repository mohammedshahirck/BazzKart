import 'package:ecommerce/controller/providers/profile/profile_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/view/address_view/address_view.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
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

                  // const Color(0xff222222),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: ListView(children: [
        ListTile(
          title: Row(
            children: const [
              Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
              Ksize.kWsize20,
              Ksize.kWsize20,
              Text(
                'about us',
              ),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const AddressView();
              },
            ));
          },
          title: Row(
            children: const [
              Icon(
                Icons.add_location_alt_outlined,
                color: Colors.black,
              ),
              Ksize.kWsize20,
              Ksize.kWsize20,
              Text(
                'Address',
              ),
            ],
          ),
        ),
        Consumer<LogoutController>(builder: (context, value, child) {
          return ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 7, 7, 7),
                ),
                Ksize.kWsize20,
                Ksize.kWsize20,
                Text('Log Out'),
              ],
            ),
            onTap: () {
              value.logOut(context);
            },
          );
        }),
        ListTile(
          title: Row(
            children: const [
              Icon(
                Icons.settings,
                color: Colors.black,
              ),
              Ksize.kWsize20,
              Ksize.kWsize20,
              Text(
                'Settings',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
