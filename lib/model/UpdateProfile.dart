/// message : "Profile updated successfully"

class Updateprofile {
  Updateprofile({
    this.message,});

  Updateprofile.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}