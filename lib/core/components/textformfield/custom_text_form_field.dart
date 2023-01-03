import 'package:flutter/material.dart';

import '../../constants/color/app_colors.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    void Function(String)? onChanged,
    TextEditingController? controller,
    super.key,
  }) : super(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.softGrey,
          ),
          textCapitalization: TextCapitalization.characters,
          autofocus: true,
          onChanged: onChanged,
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search',
            fillColor: AppColors.grey,
            filled: true,
            hintStyle: TextStyle(
              color: AppColors.softGrey,
              fontFamily: 'regular',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.whiteGrey,
            ),
            errorStyle: TextStyle(
              color: AppColors.orange,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 1.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1.0,
              ),
            ),
          ),
        );
}
