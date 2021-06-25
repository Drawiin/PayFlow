import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_images.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_dimens.dart';
import 'package:pay_flow/shared/values/app_strings.dart';
import 'package:pay_flow/shared/widget/invoice_list/invoice_list_controller.dart';

class InvoiceInfoWidget extends StatefulWidget {
  InvoiceInfoWidget({Key? key}) : super(key: key);

  @override
  _InvoiceInfoWidgetState createState() => _InvoiceInfoWidgetState();
}

class _InvoiceInfoWidgetState extends State<InvoiceInfoWidget> {
  final controller = InvoiceListController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingSmall),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.logoMini,
                width: 56,
                height: 34,
                color: AppColors.background,
              ),
              Container(
                width: 1,
                height: 32,
                color: AppColors.background,
              ),
              ValueListenableBuilder<List<InvoiceModel>>(
                valueListenable: controller.invoicesNotifier,
                builder: (_, invoices, __) => Text.rich(
                  TextSpan(
                    text: AppStrings.invoiceInfoYouHave,
                    style: AppTextStyles.captionBackground,
                    children: [
                      TextSpan(
                        text:
                            "${invoices.length} ${AppStrings.invoiceInfoYInvoices}\n",
                        style: AppTextStyles.captionBoldBackground,
                      ),
                      TextSpan(
                        text: AppStrings.invoiceForPaying,
                        style: AppTextStyles.captionBackground,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
