import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../barrels/localizations.dart';
import '../../../barrels/models.dart';
import '../../../barrels/repositories.dart';
import '../../../barrels/utils.dart';

class AuthController extends GetxController {

  var isPasswordVisible = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _authRepo = getIt<AuthRepository>();

  void togglePasswordVisibility() => isPasswordVisible.toggle();

  void validateSignupForm(User user) {

    if(formKey.currentState!.validate()) {
      _signup(user);
    }
  }

  Future<void> _signup(User user) async {

    try {
      var response = await _authRepo.createUserAccount(user);

      var jsonData = json.decode(response.body);

      if((response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created || response.statusCode == HttpStatus.accepted)
        && jsonData['code'] == HttpStatus.ok) {

        _showSnackBar(STR_SUCCESS.tr, jsonData['message']);
        return;
      }

      _showSnackBar(STR_FAILED.tr, jsonData['message'], isErrorMsg: true);

    } on AppException catch(error) {
      _showSnackBar(STR_FAILED.tr, error.message!, isErrorMsg: true);

    } catch(error) {
      _showSnackBar(STR_FAILED.tr, STR_UNKNOWN_ERROR.tr, isErrorMsg: true);
    }
  }

  void _showSnackBar(String title, message, {bool isErrorMsg = false}) {

    Get.snackbar(title, message,
      margin: EdgeInsets.all(15),
      duration: const Duration(milliseconds: 3500),
      colorText: isErrorMsg ? Colors.white : null,
      backgroundColor: isErrorMsg ? Colors.redAccent : null,
    );
  }
}