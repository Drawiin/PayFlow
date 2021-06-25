import 'package:flutter/material.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_routes.dart';
import 'package:pay_flow/shared/values/app_strings.dart';
import 'package:pay_flow/shared/widget/bottom_sheet/bottom_sheet_widget.dart';
import 'package:pay_flow/shared/widget/goup_label_button/group_label_button_widget.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({Key? key}) : super(key: key);

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.insetInvoice,
          arguments: controller.status.barcode,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (context, value, child) {
              if (value.showCamera) {
                return Container(
                  child: controller.cameraController?.buildPreview(),
                );
              }
              return Container();
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: BackButton(
                  color: AppColors.background,
                ),
                title: Text(
                  AppStrings.barcodeScannerTitle,
                  style: AppTextStyles.buttonBackground,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              bottomNavigationBar: GroupLabelButtonWidget(
                  primaryLabel: AppStrings.barcodeScannerInsertCode,
                  secondaryLabel: AppStrings.barcodeScannerAddFromGallery,
                  primaryOnTap: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.insetInvoice),
                  secondaryOnTap: controller.scanWithImagePicker),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return RotatedBox(
                    quarterTurns: 1,
                    child: Material(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: BottomSheetWidget(
                            title: AppStrings.barcodeScannerErrorTitle,
                            subtitle: AppStrings.barcodeScannerErrorSubtitle,
                            primaryLabel: AppStrings.barcodeScannerInsertCode,
                            secondaryLabel:
                                AppStrings.barcodeScannerAddFromGallery,
                            primaryOnTap: () => controller.scanWithCamera(),
                            secondaryOnTap: () =>
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.insetInvoice),
                          )),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
