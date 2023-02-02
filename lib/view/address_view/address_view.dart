import 'package:ecommerce/controller/providers/address/add_address.dart';
import 'package:ecommerce/controller/providers/address_controller/addaddress.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/model/address/address_screen_enum.dart';
import 'package:ecommerce/view/address/address_screen.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/text_style.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController =
        Provider.of<AddressController>(context, listen: false);

    Provider.of<AddressProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addressController.getAllAddress();
    });
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Address',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Kcolors.bgcolor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Consumer2<AddressController, AddressProvider>(
            builder: (context, value, value2, _) {
          return value.isLoading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingWidget(color: Colors.black),
                  ),
                )
              : value.addressList.isEmpty
                  ? Column(
                      children: const [
                        Ksize.ksize5,
                        AddNewAddressBut(),
                      ],
                    )
                  : Column(
                      children: [
                        const AddNewAddressBut(
                          defualt: 'Default Address',
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, left: 20, top: 20),
                                child: InkWell(
                                  onTap: () {
                                    value.addressSelect(index);
                                  },
                                  child: Container(
                                    //
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 240, 240, 237),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        .22,
                                    child: Row(
                                      children: [
                                        Ksize.kWsize10,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Ksize.ksize10,
                                            Row(
                                              children: [
                                                Text(
                                                  value.addressList[index]
                                                      .fullName,
                                                  // value.addressList[index].fullName,
                                                  style: SafeGoogleFont(
                                                    'Metropolis',
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.2575,
                                                    color: Colors.black,
                                                    // const Color(0xff222222),
                                                  ),
                                                ),
                                                Ksize.kWsize10,
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              226,
                                                              225,
                                                              225),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  height: 30,
                                                  width: 60,
                                                  child: Center(
                                                      child: Text(value
                                                          .addressList[index]
                                                          .title)),
                                                ),
                                                Ksize.kWsize20,
                                              ],
                                            ),
                                            Ksize.ksize10,
                                            SizedBox(
                                              width: 300,
                                              child: Text(
                                                value
                                                    .addressList[index].address,
                                                // 'Cheloor Kalathil(H),Perinthattiri Po ,koottilangadi,Malappuram',
                                                style: const TextStyle(
                                                    color: Kcolors
                                                        .addressTextColor),
                                              ),
                                            ),
                                            Text(
                                              // 'Makkaraparamba',
                                              value.addressList[index].place,
                                              style: const TextStyle(
                                                  color:
                                                      Kcolors.addressTextColor),
                                            ),
                                            Text(
                                              '${value.addressList[index].place} :${value.addressList[index].pin}',
                                              style: const TextStyle(
                                                  color:
                                                      Kcolors.addressTextColor),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Mobile: ${value.addressList[index].phone}',
                                                  style: const TextStyle(
                                                      color: Kcolors
                                                          .addressTextColor),
                                                ),
                                                Ksize.kWsize20,
                                                OutlinedButton(
                                                  onPressed: () {
                                                    value2.toEditAddressScreen(
                                                        context,
                                                        AddressScreenEnum
                                                            .editAddressScreen,
                                                        value.addressList[index]
                                                            .id);
                                                  },
                                                  child: Row(
                                                    children: const [
                                                      Icon(Icons.edit,
                                                          size: 20,
                                                          color: Colors.black),
                                                      Text('Edit',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                    ],
                                                  ),
                                                ),
                                                Ksize.kWsize10,
                                                OutlinedButton(
                                                    onPressed: () {
                                                      value.deleteAddress(value
                                                          .addressList[index]
                                                          .id);
                                                      value.getAllAddress();
                                                    },
                                                    child: Row(
                                                      children: const [
                                                        Icon(Icons.delete,
                                                            size: 20,
                                                            color:
                                                                Colors.black),
                                                        Text(
                                                          'Remove',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                            index == value.selectIndex
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 226, 225, 225),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    height: 30,
                                                    width: 60,
                                                    child: Center(
                                                        child: Text('Defualt')),
                                                  )
                                                : const SizedBox()
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Ksize.ksize5;
                            },
                            itemCount: value.addressList.length),
                      ],
                    );
        }),
      )),
    );
  }
}

class AddNewAddressBut extends StatelessWidget {
  const AddNewAddressBut({
    Key? key,
    this.defualt,
  }) : super(key: key);
  final String? defualt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AddAddressScreen(
              addressScreenCheck: AddressScreenEnum.addAddressScreen,
              addressid: '',
            );
          },
        ));
      },
      child: Column(
        children: [
          Ksize.ksize10,
          Card(
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                children: const [
                  Ksize.kWsize10,
                  Text(
                    '+',
                    style: TextStyle(color: Colors.black),
                  ),
                  Ksize.kWsize10,
                  Text(
                    'Add a new address',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Ksize.ksize12,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 33),
                child: Text(
                  defualt ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
