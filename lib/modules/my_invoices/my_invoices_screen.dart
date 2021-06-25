import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_dimens.dart';
import 'package:pay_flow/shared/values/app_strings.dart';
import 'package:pay_flow/shared/widget/invoice_info/invoice_info_widget.dart';
import 'package:pay_flow/shared/widget/invoice_list/invoice_list_widget.dart';

class MyInvoicesScreen extends StatefulWidget {
  MyInvoicesScreen({Key? key}) : super(key: key);

  @override
  _MyInvoicesScreenState createState() => _MyInvoicesScreenState();
}

class _MyInvoicesScreenState extends State<MyInvoicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: AppDimens.heightInvoiceInfo,
            child: Stack(
              children: [
                Container(
                  height: AppDimens.sizeInvoiceCard,
                  color: AppColors.primary,
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: InvoiceInfoWidget(
                    key: UniqueKey(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimens.paddingSmall,
                horizontal: AppDimens.paddingSmall),
            child: Row(
              children: [
                Text(AppStrings.myInvoicesTitle,
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
