import 'package:auth_healthcare_app/Utilities/AppColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  static InputDecoration textFieldInputDecor(
      {required String labelText,
      required IconData prefixIcon,
      IconData? suffixIcon}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.textFieldFillColor,
      labelText: labelText,
      labelStyle: const TextStyle(color: AppColors.textFieldLabelColor),
      suffixIcon: Icon(suffixIcon, color: AppColors.textFieldIconColor),
      prefixIcon: Icon(
        prefixIcon,
        color: AppColors.textFieldIconColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    );
  }
}
