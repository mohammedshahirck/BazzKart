import 'package:ecommerce/controller/providers/profile/profile_controller.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          Ksize.ksize20,
          Ksize.ksize20,
          Ksize.ksize20,
          Ksize.ksize20,
          Consumer<LogoutController>(builder: (context, value, child) {
            return ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                value.logOut(context);
              },
            );
          })
        ],
      )),
    );
  }
}
