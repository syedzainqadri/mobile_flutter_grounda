class ErrorModel {
  String message = '';

  ErrorModel({required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'],
    );
  }
}
