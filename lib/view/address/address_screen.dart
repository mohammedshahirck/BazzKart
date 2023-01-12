import 'package:ecommerce/controller/providers/address/add_address.dart';
import 'package:ecommerce/helpers/kcolors.dart';
import 'package:ecommerce/helpers/ksizedbox.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';
import 'package:ecommerce/widgets/text_style.dart';
import 'package:ecommerce/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({
    super.key,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.bgcolor,
      appBar: AppBar(
        title: Text(
          'ADDRESS',
          style: SafeGoogleFont(
            'Metropolis',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 1.2575,
            color: Colors.black,
            // const Color(0xff222222),
          ),
        ),
        elevation: 0,
        backgroundColor: Kcolors.bgcolor,
      ),
      body: Consumer<AddressController>(builder: (context, values, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'ADD NEW ADDRESS',
                    style: SafeGoogleFont(
                      'Metropolis',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.2575,
                      color: Colors.black,
                      // const Color(0xff222222),
                    ),
                  ),
                ),
                Ksize.ksize30,
                TextsField(
                  controller: values.namecontroller,
                  hintText: "Name *",
                  tiaction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  prefixicon: const Icon(Icons.person),
                  obscure: false,
                  validator: (value) {
                    return values.nameHouseandAreaValidator(
                        value, 'Pleas enter the name');
                  },
                ),
                Ksize.ksize20,
                TextsField(
                  controller: values.phoneNumberController,
                  prefixicon: const Icon(Icons.phone),
                  hintText: "Mobile *",
                  tiaction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  obscure: false,
                  validator: (value) {
                    return values.phoneNumberValidator(value);
                  },
                ),
                Ksize.ksize20,
                TextsField(
                  controller: values.pinCodeController,
                  prefixicon: const Icon(Icons.pin_drop_outlined),
                  hintText: "Pincode *",
                  tiaction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  obscure: false,
                  validator: (value) => values.pinValidation(value),
                ),
                Ksize.ksize20,
                TextsField(
                  controller: values.stateNameController,
                  prefixicon: const Icon(Icons.public),
                  hintText: "State *",
                  tiaction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  obscure: false,
                ),
                Ksize.ksize20,
                TextsField(
                  controller: values.homeAddressName,
                  prefixicon: const Icon(Icons.add_location_alt_rounded),
                  hintText: "Address (House No,Building,Street,Area) *",
                  tiaction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  obscure: false,
                ),
                Ksize.ksize20,
                TextsField(
                  controller: values.placeController,
                  prefixicon: const Icon(Icons.map_outlined),
                  hintText: "Place *",
                  tiaction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  obscure: false,
                ),
                Ksize.ksize20,
                TextsField(
                  controller: values.localityTown,
                  prefixicon: const Icon(Icons.local_activity_outlined),
                  hintText: "Locality/ Town *",
                  tiaction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  obscure: false,
                ),
                Ksize.ksize20,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => values.selectAddressType(),
                      child: Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: values.homeselect == true
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Home',
                              style: TextStyle(
                                color: values.homeselect == true
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Ksize.kWsize20,
                    GestureDetector(
                      onTap: () => values.selectAddressType(),
                      child: Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: values.homeselect == false
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Office',
                              style: TextStyle(
                                color: values.homeselect == false
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Ksize.ksize30,
                CustomElevateButton(
                  size: 18,
                  text: 'Save Address',
                  onpressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      values.addNewAddress(context);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
