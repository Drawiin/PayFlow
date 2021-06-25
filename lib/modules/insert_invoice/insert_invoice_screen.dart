import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_flow/modules/insert_invoice/insert_invoice_controller.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_strings.dart';
import 'package:pay_flow/shared/widget/goup_label_button/group_label_button_widget.dart';
import 'package:pay_flow/shared/widget/input_text/input_text_widget.dart';

class InsertInvoiceScreen extends StatefulWidget {
  final String? barcode;

  const InsertInvoiceScreen({
    Key? key,
    this.barcode,
  }) : super(key: key);

  @override
  _InsertInvoiceScreenState createState() => _InsertInvoiceScreenState();
}

class _InsertInvoiceScreenState extends State<InsertInvoiceScreen> {
  final controller = InsertInvoiceController();

  final moneyInputTextController = MoneyMaskedTextController(
      leftSymbol: "R\$", initialValue: 0, decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final codeInputTextController = TextEditingController();

  @override
  void initState() {
    // if (widget.barcode != null) {
    //   codeInputTextController.text = widget.barcode ?? "";
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
                child: Text(
                  AppStrings.insertInvoiceTitle,
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: AppStrings.insertInvoiceFieldInvoiceName,
                      icon: Icons.description_outlined,
                      onChanged: (value) {
                        controller.onChange(name: value);
                      },
                      validator: controller.validateName,
                    ),
                    InputTextWidget(
                      controller: dueDateInputTextController,
                      label: AppStrings.insertInvoiceFieldDueDate,
                      icon: FontAwesomeIcons.timesCircle,
                      onChanged: (value) {
                        controller.onChange(dueDate: value);
                      },
                      validator: controller.validateDueDate,
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      label: AppStrings.insertInvoiceFieldValue,
                      icon: FontAwesomeIcons.wallet,
                      validator: (_) => controller
                          .validateValue(moneyInputTextController.numberValue),
                      onChanged: (value) {
                        controller.onChange(
                            value: moneyInputTextController.numberValue);
                      },
                    ),
                    InputTextWidget(
                      controller: codeInputTextController,
                      label: AppStrings.insertInvoiceFieldCode,
                      icon: FontAwesomeIcons.barcode,
                      validator: controller.validateCode,
                      onChanged: (value) {
                        controller.onChange(barcode: value);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          GroupLabelButtonWidget(
            enableSecondary: true,
            primaryLabel: "Cancelar",
            primaryOnTap: () {
              Navigator.pop(context);
            },
            secondaryLabel: "Cadastrar",
            secondaryOnTap: () async {
              await controller.register();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
