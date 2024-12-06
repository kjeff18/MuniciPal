import 'dart:math';

class BubbleSizeCalculator {
   
  static double getIconsize(int upvotes)
  {
  double baseIconSize = 50; 
  double maxIconSize = 100;
  double scaledSize = baseIconSize + (upvotes * 0.5);
  return scaledSize > maxIconSize ? maxIconSize : scaledSize;
  }
}