class ScannedQrCodeModel {
  int? id;
  String? qrContent;
  DateTime? scannedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qrContent': qrContent,
      'scannedAt': scannedAt,
    };
  }

  ScannedQrCodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qrContent = json['qrContent'];
    scannedAt = json['scannedAt'];
  }
}
