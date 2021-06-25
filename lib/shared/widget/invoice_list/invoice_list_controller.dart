import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model.dart';
import 'package:pay_flow/shared/values/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceListController {
  final invoicesNotifier = ValueNotifier<List<InvoiceModel>>(<InvoiceModel>[]);

  List<InvoiceModel> get invoices => invoicesNotifier.value;

  set invoices(List<InvoiceModel> value) => invoicesNotifier.value = value;

  InvoiceListController() {
    getInvoices();
  }

  void getInvoices() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList(AppStrings.keyInvoiceList);
      invoices = response!.map((e) => InvoiceModel.fromJson(e)).toList();
    } catch (e) {}
  }

  void dispose() {
    invoicesNotifier.dispose();
  }
}
