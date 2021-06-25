import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model.dart';
import 'package:pay_flow/shared/values/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertInvoiceController {
  final formKey = GlobalKey<FormState>();
  InvoiceModel model = InvoiceModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? AppStrings.fieldErrorName : null;

  String? validateDueDate(String? value) =>
      value?.isEmpty ?? true ? AppStrings.fieldErrorDate : null;

  String? validateValue(double value) =>
      value == 0 ? AppStrings.fieldErrorValue : null;

  String? validateCode(String? value) =>
      value?.isEmpty ?? true ? AppStrings.fieldErrorInvoiceCode : null;

  void onChange(
      {String? name, String? dueDate, double? value, String? barcode}) {
    model = model.copyWith(
        name: name, dueDate: dueDate, value: value, barcode: barcode);
  }

  Future<void> saveInvoice() async {
    final instance = await SharedPreferences.getInstance();
    final invoices = instance.getStringList(AppStrings.keyInvoice) ?? <String>[];
    invoices.add(model.toJson());
    await instance.setStringList(AppStrings.keyInvoice, invoices);
    return;
  }

  Future<void> register() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveInvoice();
    }
  }
}
