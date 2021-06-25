import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_dimens.dart';
import 'package:pay_flow/shared/widget/goup_label_button/group_label_button_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnTap;
  final VoidCallback secondaryOnTap;

  const BottomSheetWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.primaryLabel,
      required this.secondaryLabel,
      required this.primaryOnTap,
      required this.secondaryOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppDimens.paddingMedium),
                child: Text.rich(
                  TextSpan(
                    text: title,
                    style: AppTextStyles.titleBoldHeading,
                    children: [
                      TextSpan(
                          text: "\n$subtitle",
                          style: AppTextStyles.titleRegularHeading),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 1,
                color: AppColors.lightGrey,
              ),
              GroupLabelButtonWidget(
                  primaryLabel: primaryLabel,
                  secondaryLabel: secondaryLabel,
                  primaryOnTap: primaryOnTap,
                  secondaryOnTap: secondaryOnTap)
            ],
          )
        ],
      ),
    );
  }
}
