import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_dimens.dart';

class LabelButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool primary;

  const LabelButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.primary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.heightButton,
      child: TextButton(
          onPressed: onTap,
          child: Text(
            label,
            style: primary
                ? AppTextStyles.buttonPrimary
                : AppTextStyles.buttonHeading,
          )),
    );
  }
}
