class AppUtil {

  static int feetInchToCM(int feet, String inch) {
    int _in = int.parse(inch.replaceAll('"', ''));
    int totalInch = ((feet * 12) + _in);
    return (totalInch * 2.54).round();
  }
}