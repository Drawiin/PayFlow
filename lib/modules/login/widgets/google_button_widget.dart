import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_images.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_dimens.dart';
import 'package:pay_flow/shared/values/app_strings.dart';

class GoogleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const GoogleButtonWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
            border: Border.fromBorderSide(BorderSide(color: AppColors.stroke))),
        height: AppDimens.sizeButtonHeight,
        child: Row(
          children: [
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.google),
                    SizedBox(
                      width: AppDimens.spacingDefault,
                    ),
                    Container(
                      height: AppDimens.sizeButtonHeight,
                      width: 1,
                      color: AppColors.stroke,
                    )
                  ],
                ),
                flex: 1),
            Expanded(
              child: Text(
                AppStrings.btnGoogle,
                style: AppTextStyles.buttonGray,
                textAlign: TextAlign.center,
              ),
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
