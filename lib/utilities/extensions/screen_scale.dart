import '../theme/media.dart';

extension ScreenScale on num {
  double get w => MediaHelper.width * (toDouble() / 390);
  double get h => MediaHelper.height * (toDouble() / 844);
}
