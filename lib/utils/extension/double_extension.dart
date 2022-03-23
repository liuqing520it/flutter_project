
import '../share/size_fit.dart';

extension DubleFit on double{
  double get px{
    return LQSizeFit.setPx(this);
  }

  double get rpx{
    return LQSizeFit.setRpx(this);
  }
}
