import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget greenIntroWidget() {
  return Container(
    width: Get.width,
    height: Get.height * 0.6,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/mask.png'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: SvgPicture.asset('assets/leaf icon.svg'),
        ),
        const SizedBox(
          height: 20,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: Get.height*.1,
          child: SvgPicture.asset('assets/green-taxi.svg'),
        ),
      ],
    ),
  );
}
