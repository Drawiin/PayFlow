import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_strings.dart';

class InvoiceTileWidget extends StatelessWidget {
  final InvoiceModel data;

  const InvoiceTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: AppTextStyles.titleListTile,
        ),
        subtitle: Text(
          "${AppStrings.invoiceTileDueDate} ${data.dueDate}",
          style: AppTextStyles.captionBody,
        ),
        trailing: Text.rich(TextSpan(
          text: AppStrings.symbolCurrencyCypher,
          style: AppTextStyles.trailingRegular,
          children: [
            TextSpan(
              text: "${data.value!.toStringAsFixed(2)}",
              style: AppTextStyles.trailingBold,
            ),
          ],
        )),
      ),
    );
  }
}
