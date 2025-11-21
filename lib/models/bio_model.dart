class BioModel {
final bool status;
final String message;
  BioModel({required this.status, required this.message});
  factory BioModel.fromJson(Map<String, dynamic> json) {
    return BioModel(status: json["status"], message: json["message"]);
  }
}
