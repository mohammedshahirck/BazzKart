import 'package:ecommerce/model/otp_enum_screen/otp_screen_enum.dart';
import 'package:ecommerce/model/signup_model/sign_up_model.dart';
import 'package:ecommerce/widgets/loading.dart';
import 'package:ecommerce/controller/providers/otp/otp_controller.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.model, required this.screenCheck});

  final SignUpModel model;
  final OtpScreenEnum screenCheck;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OtpController otpController;
  @override
  void initState() {
    otpController = Provider.of<OtpController>(context, listen: false);
    otpController.changeTimer();
    otpController.timeRemaining = 59;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Code has been sent to',
                      // style: AppTextStyles.textStyle3,
                    ),
                    Text(
                      widget.model.email!,
                      // style: AppTextStyles.textStyle3,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Consumer<OtpController>(builder: (context, values, _) {
                      return OtpTextField(
                        numberOfFields: 4,
                        showFieldAsBox: true,
                        filled: true,
                        fieldWidth: 70,
                        borderRadius: BorderRadius.circular(15),
                        autoFocus: true,
                        borderWidth: 1.5,
                        clearText: values.clear,
                        onSubmit: (String code) => values.setCode(code),
                      );
                    }),
                    const SizedBox(
                      height: 35,
                    ),
                    Consumer<OtpController>(builder: (context, values, _) {
                      return values.timeRemaining != 0
                          ? Text('Resend code in ${values.timeRemaining}s')
                          : TextButton(
                              onPressed: () => values.setResendVisibility(
                                  true, context, widget.model.email!),
                              child: const Text(
                                'Resend OTP',
                                // style: TextStyle(color: AppColors.whiteColor),
                              ),
                            );
                    }),
                    // AppSizedBoxes.sizedboxH50,
                    Consumer<OtpController>(builder: (context, values, _) {
                      return values.loading == true
                          ? const LoadingWidget()
                          : CustomElevateButton(
                              text: 'Verify',
                              onpressed: () => values.verifyCode(
                                  context, widget.model, widget.screenCheck),
                              size: 15,
                            );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    OtpController().timer?.cancel();
    super.dispose();
  }
}
