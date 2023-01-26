import 'package:adv_app/presentation/resources/color_management.dart';
import 'package:adv_app/presentation/resources/font_management.dart';
import 'package:adv_app/presentation/resources/styles_manager.dart';
import 'package:adv_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primaryColor: ColorManagement.primary,
      primaryColorLight: ColorManagement.primaryOpacity70,
      primaryColorDark: ColorManagement.darkPrimary,
      disabledColor: ColorManagement.error,
      //ripple
      splashColor: ColorManagement.primaryOpacity70,

      //card theme
      cardTheme: CardTheme(
        color: ColorManagement.white,
        shadowColor: ColorManagement.grey,
        elevation: AppSize.s4,
      ),

      //app theme

      //text theme
      textTheme: TextTheme(
          displayLarge: getBoldStyle(
              color: ColorManagement.darkGrey, fontSize: AppSize.s16),
          titleLarge: getRegularStyle(
              color: ColorManagement.lightGrey, fontSize: AppSize.s14),
          bodyLarge: getRegularStyle(color: ColorManagement.grey1),
          bodySmall: getRegularStyle(color: ColorManagement.grey)),

      //button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManagement.grey,
          buttonColor: ColorManagement.primary,
          splashColor: ColorManagement.primaryOpacity70),
      //elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManagement.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),

      //appBar thme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManagement.primary,
          shadowColor: ColorManagement.primaryOpacity70,
          elevation: AppSize.s4,
          titleTextStyle: getRegularStyle(
              color: ColorManagement.white, fontSize: FontSize.s16)),

      //input decoration
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        labelStyle: getRegularStyle(color: ColorManagement.darkGrey),
        errorStyle: getRegularStyle(color: ColorManagement.error),
        hintStyle: getRegularStyle(color: ColorManagement.grey1),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManagement.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManagement.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManagement.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManagement.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8)),
      ));
}
