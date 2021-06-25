import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_dimens.dart';
import 'package:pay_flow/shared/values/app_strings.dart';
import 'package:pay_flow/shared/widget/invoice_list/invoice_list_widget.dart';

class ExtractScreen extends StatefulWidget {
  ExtractScreen({Key? key}) : super(key: key);

  @override
  _ExtractScreenState createState() => _ExtractScreenState();
}

class _ExtractScreenState extends State<ExtractScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimens.paddingSmall,
                horizontal: AppDimens.paddingSmall),
            child: Row(
              children: [
                Text(AppStrings.extractTitle,
                    style: AppTextStyles.titleBoldHeading),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
            child: InvoiceListWidget(
              key: UniqueKey(),
            ),
          )
        ],
      ),
    );
  }
}
