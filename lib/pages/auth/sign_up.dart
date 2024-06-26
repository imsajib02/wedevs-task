import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/localizations.dart';
import '../../barrels/models.dart';
import '../../barrels/resources.dart';
import '../../barrels/utils.dart';
import '../../barrels/widgets.dart';
import '../../route/routes.dart';
import 'controller/auth_controller.dart';

class Signup extends StatelessWidget {

  final _controller = Get.find<AuthController>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _controller.formKey,
              child: Container(
                margin: const EdgeInsets.only(bottom: 54),
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [

                    52.h,

                    SizedBox(
                      height: 121,
                      width: 121,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [

                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 121,
                              width: 121,
                              decoration: BoxDecoration(
                                color: kWhite,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  const BoxShadow(
                                    color: kGreyish,
                                    offset: Offset(0, 2),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Image.asset('assets/images/person.png',
                            height: 31,
                            width: 25,
                          ),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  const BoxShadow(
                                    color: kGreyish,
                                    offset: Offset(0, 2),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                height: 20,
                                width: 23,
                                child: Icon(Icons.camera_alt,
                                  size: 15,
                                  color: kWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    52.h,

                    CustomTextField(
                      controller: _usernameController,
                      hintText: STR_USERNAME.tr,
                      inputType: TextInputType.text,
                      prefixImagePath: 'assets/images/person.png',
                      validator: (value) {

                        if((value == null || value.isEmpty)) {
                          return STR_REQUIRED.tr;
                        }

                        return null;
                      },
                    ),

                    19.h,

                    CustomTextField(
                      controller: _emailController,
                      hintText: STR_EMAIL.tr,
                      inputType: TextInputType.emailAddress,
                      prefixImagePath: 'assets/images/email.png',
                      validator: (value) {

                        if(value == null || value.isEmpty) {
                          return STR_REQUIRED.tr;
                        }

                        if(!GetUtils.isEmail(value)) {
                          return STR_INVALID_EMAIL.tr;
                        }

                        return null;
                      },
                    ),

                    19.h,

                    CustomTextField(
                      controller: _passwordController,
                      hintText: STR_PASSWORD.tr,
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      prefixImagePath: 'assets/images/lock.png',
                      validator: (value) {

                        if((value == null || value.isEmpty)) {
                          return STR_REQUIRED.tr;
                        }

                        if(value.length < minPasswordLength) {
                          return STR_PASSWORD_LENGTH_SHORT.tr;
                        }

                        return null;
                      },
                    ),

                    19.h,

                    CustomTextField(
                      controller: _confirmPasswordController,
                      hintText: STR_CONFIRM_PASSWORD.tr,
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      prefixImagePath: 'assets/images/lock.png',
                      validator: (value) {

                        if((value == null || value.isEmpty)) {
                          return STR_REQUIRED.tr;
                        }

                        if(value.length < minPasswordLength) {
                          return STR_PASSWORD_LENGTH_SHORT.tr;
                        }

                        if(value != _passwordController.text) {
                          return STR_CONFIRM_PASSWORD_MISMATCH.tr;
                        }

                        return null;
                      },
                    ),

                    78.h,

                    CustomButton(
                      text: STR_SIGNUP.tr,
                      onTap: () {

                        FocusScope.of(context).requestFocus(FocusNode());

                        _controller.validateSignupForm(
                          User(
                            username: _usernameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                    ),

                    39.h,

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

                    53.h,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(STR_ALREADY_SIGNED.tr,
                          style: TextStyles.hintStyle.copyWith(
                            fontWeight: FontWeight.w300,
                            color: kGreyishBlack,
                          ),
                        ),

                        8.w,

                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => Get.offNamed(ROUTE_LOGIN),
                          child: Text(STR_LOGIN.tr,
                            style: TextStyles.hintStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              color: kBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
