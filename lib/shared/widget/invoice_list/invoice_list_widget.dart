import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model.dart';
import 'package:pay_flow/shared/widget/invoice_list/invoice_list_controller.dart';
import 'package:pay_flow/shared/widget/invoice_tile/invoice_tile_widget.dart';

class InvoiceListWidget extends StatefulWidget {
  InvoiceListWidget({Key? key}) : super(key: key);

  @override
  _InvoiceListWidgetState createState() => _InvoiceListWidgetState();
}

class _InvoiceListWidgetState extends State<InvoiceListWidget> {
  final controller = InvoiceListController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<InvoiceModel>>(
      valueListenable: controller.invoicesNotifier,
      builder: (_, invoices, __) => Column(
        children: invoices.map((e) => InvoiceTileWidget(data: e)).toList(),
      ),
    );
  }
}
