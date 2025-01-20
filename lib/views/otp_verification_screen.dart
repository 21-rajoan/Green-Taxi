import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:green_taxi_app/utils/app_colors.dart';
import 'package:green_taxi_app/widgets/green_intro_widget.dart';

import '../widgets/otp_verification_widget.dart';
import '../widgets/otp_verification_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _State();
}

class _State extends State<OtpVerificationScreen> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


            Stack(
              children: [
                greenIntroWidget(),
                Positioned(
                  top: 60,
                  left: 30,
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(Icons.arrow_back, color: AppColors.whiteColor,size: 20,),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 50,
            ),

            otpVerificationWidget(),
          ],
        ),
      ),
    );
  }
}