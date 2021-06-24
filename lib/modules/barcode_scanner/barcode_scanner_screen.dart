import 'package:flutter/material.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/values/app_strings.dart';
import 'package:pay_flow/shared/widget/bottom_sheet/bottom_sheet_widget.dart';
import 'package:pay_flow/shared/widget/goup_label_button_widget/group_label_button_widget.dart';

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
                  child: value.cameraController?.buildPreview(),
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
                  primaryOnTap: () {},
                  secondaryOnTap: () {}),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (context, value, child) {
              if (value.hasError) {
                return RotatedBox(
                  quarterTurns: 1,
                  child: Material(
                    child: BottomSheetWidget(
                      title: AppStrings.barcodeScannerErrorTitle,
                      subtitle: AppStrings.barcodeScannerErrorSubtitle,
                      primaryLabel: AppStrings.barcodeScannerInsertCode,
                      secondaryLabel: AppStrings.barcodeScannerAddFromGallery,
                      primaryOnTap: () {},
                      secondaryOnTap: () {},
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
