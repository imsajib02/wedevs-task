import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/localizations.dart';
import '../../barrels/resources.dart';
import '../../barrels/utils.dart';
import '../../barrels/widgets.dart';
import '../../route/routes.dart';
import 'controller/auth_controller.dart';

class Login extends StatelessWidget {

  final _authController = Get.put(AuthController());

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _authController.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 58,
              ),
              child: Column(
                children: [

                  24.h,

                  Image.asset('assets/images/dokan.png',
                    height: 50,
                    width: 165,
                  ),

                  84.h,

                  Text(STR_SIGN_IN.tr,
                    style: TextStyles.headlineStyle,
                  ),

                  38.h,

                  CustomTextField(
                    controller: _usernameController,
                    hintText: STR_USERNAME.tr,
                    inputType: TextInputType.text,
                    prefixImagePath: 'assets/images/person.png',
                  ),

                  19.h,

                  Obx(() => CustomTextField(
                    controller: _passwordController,
                    hintText: STR_PASSWORD.tr,
                    inputType: TextInputType.visiblePassword,
                    obscureText: !_authController.isPasswordVisible.value,
                    prefixImagePath: 'assets/images/lock.png',
                    suffixIcon: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _authController.togglePasswordVisibility(),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 21, 23, 19),
                        child: SizedBox(
                          height: 20,
                          width: 23,
                          child: Icon(!_authController.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    validator: (value) {

                      if((value == null || value.isEmpty)) {
                        return STR_REQUIRED.tr;
                      }

                      if(value.length < 6) {
                        return STR_PASSWORD_LENGTH_SHORT.tr;
                      }

                      return null;
                    },
                  )),

                  18.h,

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(STR_FORGOT_PASSWORD.tr,
                      style: TextStyles.hintStyle.copyWith(
                        fontSize: 13,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),

                  59.h,

                  CustomButton(
                    text: STR_LOGIN.tr,
                    onTap: () {},
                  ),

                  40.h,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SocialButton(
                        imagePath: 'assets/images/facebook.png',
                      ),

                      14.w,

                      SocialButton(
                        imagePath: 'assets/images/google.png',
                      ),
                    ],
                  ),

                  52.h,

                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Get.offNamed(ROUTE_SIGNUP),
                    child: Text(STR_CREATE_NEW_ACCOUNT.tr,
                      style: TextStyles.hintStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF383C40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
