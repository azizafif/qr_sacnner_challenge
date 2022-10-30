class AppConstants {
  AppConstants._();

//? CONTROL VIEW
  static const String scannnerTab = 'Scanner';
  static const String historyTab = 'History';

//? SCANNER TAB
  static const String scannerTabTitle = "Scan QR code";
  static const String scannerTabDescription =
      "Place the qr code inside the frame to scan. \nPlease avoid shaking to get results quikly";

//? HISTORY TAB
  static const String historyTabTitle = "Scanning History";
  static const String historyTabDescription =
      "The app will keep all your scanned codes history \nstored locally in your phone";
  static const String historyTabNoData = "No qr code scanned!";
}
