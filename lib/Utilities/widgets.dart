import 'package:auth_healthcare_app/Utilities/AppColors/app_colors.dart';
import 'package:flutter/material.dart';

var textFieldDecoration = InputDecoration(
  filled: true,
  fillColor: AppColors.textFieldFillColor,
  labelText: "Email",
  labelStyle: const TextStyle(color: Colors.black38),
  prefixIcon: const Icon(
    Icons.email_rounded,
    color: Colors.black38,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
);
