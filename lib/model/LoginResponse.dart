/// message : "Success Login"
/// data : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MWY1YTUwNjM0MGJlNTUyYjlhMGUwOSIsImVtYWlsIjoiYW1yMjIyMjIyMjIyQGdtYWlsLmNvbSIsImlhdCI6MTc2MzY2NDI1MX0.wLTD0QuKScJqDYGZRY2YP65wnUN7rZxsCV4XOS0F5rY"

class LoginResponse {
  LoginResponse({
    this.message,
    this.data,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
  }
  String? message;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}