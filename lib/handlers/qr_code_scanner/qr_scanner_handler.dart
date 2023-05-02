import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../routers/navigator.dart';
import '../../routers/routers.dart';
import '../permission_handler.dart';

class QrScannerHanler {
  Future<String> scanQrCode() async {
    if (await PermissionHandler().checkCameraPermission()) {
      Barcode code = await CustomNavigator.push(Routes.qrScannerCode);
      return code.code ?? "";
    }
    return "";
  }
}
