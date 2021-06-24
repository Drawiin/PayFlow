import 'package:flutter/cupertino.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/values/app_dimens.dart';
import 'package:pay_flow/shared/widget/divider/divider_widget.dart';
import 'package:pay_flow/shared/widget/label_button/label_button_widget.dart';

class GroupLabelButtonWidget extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnTap;
  final VoidCallback secondaryOnTap;

  const GroupLabelButtonWidget(
      {Key? key,
      required this.primaryLabel,
      required this.secondaryLabel,
      required this.primaryOnTap,
      required this.secondaryOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: AppDimens.heightButton,
      child: Row(
        children: [
          Expanded(
            child: LabelButtonWidget(label: primaryLabel, onTap: primaryOnTap, primary: true,),
          ),
          DividerWidget(),
          Expanded(
            child:
                LabelButtonWidget(label: secondaryLabel, onTap: secondaryOnTap),
          ),
        ],
      ),
    );
  }
}
