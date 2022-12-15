import 'dart:developer';
import 'package:ecommerce/controller/providers/profile/profile_controller.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log('homescreen');
    return Scaffold(
      appBar: AppBar(
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
      backgroundColor: Kcolors.bgcolor,
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
