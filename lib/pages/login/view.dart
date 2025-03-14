import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  // 主视图
  Widget _buildView(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160.w,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'welcome',
                style: 12.w4(color: Colors.orange),
              ),
              Text(
                'login',
                style: 26.w4(
                    color: Colors.white, fontFamily: FontFamily.fOswaldBold),
              ),
              SizedBox(
                height: 20.w,
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.w), topRight: Radius.circular(8.w)),
          ),
          child: PageView(
            children: [
              Container(
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('游客登录')),
                    ElevatedButton(onPressed: () {}, child: Text('谷歌登录'))
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text('login2'),
                    Text('enter the code'),
                    PinCodeTextField(
                      controller: TextEditingController(),
                      appContext: context,
                      length: 6,
                      enableActiveFill: true,
                      mainAxisAlignment: MainAxisAlignment.center,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 10.w),
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.orange,
                      onCompleted: (value) {
                        print(value);
                      },
                      animationType: AnimationType.fade,
                      cursorHeight: 20.w,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(6),
                          borderWidth: 0,
                          fieldHeight: 50,
                          fieldWidth: 40,
                          selectedBorderWidth: 0,
                          selectedColor: Colors.transparent,
                          inactiveColor: Colors.transparent,
                          activeColor: Colors.transparent,
                          activeBorderWidth: 0,
                          activeFillColor: AppColors.cF2F2F2,
                          inactiveFillColor: AppColors.cF2F2F2,
                          selectedFillColor: AppColors.cF2F2F2),
                    ),
                  ],
                ),
              ),
              Center(child: Text('login3'))
            ],
          ),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Container(
          color: Colors.black,
          child: SafeArea(
            child: Stack(
              children: [
                _buildView(context),
                Positioned(
                    left: 20.w,
                    top: 4.w,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.w,
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
