
import '../share/size_fit.dart';

extension IntFit on int {
  double get px{
    return LQSizeFit.setPx(toDouble());
  }

  double get rpx {
    return LQSizeFit.setRpx(toDouble());
  }
}