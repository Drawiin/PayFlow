import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String barcode;
  final String error;

  CameraController? cameraController;

  BarcodeScannerStatus({
    required this.isCameraAvailable,
    this.cameraController,
    this.barcode = "",
    this.error = "",
  });

  factory BarcodeScannerStatus.cameraAvailable(
          CameraController cameraController) =>
      BarcodeScannerStatus(
        isCameraAvailable: true,
        cameraController: cameraController,
      );

  factory BarcodeScannerStatus.error(String error) => BarcodeScannerStatus(
        error: error,
        isCameraAvailable: false,
      );

  factory BarcodeScannerStatus.barcode(String barcode) =>
      BarcodeScannerStatus(isCameraAvailable: false, barcode: barcode);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
