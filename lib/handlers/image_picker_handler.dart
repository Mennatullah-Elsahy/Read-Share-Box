import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:read_share_box/handlers/permission_handler.dart';

class ImagePickerHandler {
  ImagePicker _picker = ImagePicker();

  Future<File?> pickGalleryImage() async {
    // if (await PermissionHandler().checkGalleryPermission()) {
    var file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      return File(file.path);
    } else {
      return null;
    }
    // } else {
    //   return null;
    // }
  }

  Future<File?> pickCameraImage() async {
    if (await PermissionHandler().checkCameraPermission()) {
      var file = await _picker.pickImage(source: ImageSource.camera);
      if (file != null) {
        return File(file.path);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
