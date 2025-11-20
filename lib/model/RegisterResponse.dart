/// message : "User created successfully"
/// data : {"email":"amr222222222@gmail.com","password":"$2b$10$35aRQeeVsH9ozqA.ZE1xPuvVR9WzoreNpqY4cUVgiv/YgF8FQA4Iq","name":"amr mustafa","phone":"+201141209334","avaterId":1,"_id":"691f5a506340be552b9a0e09","createdAt":"2025-11-20T18:13:36.365Z","updatedAt":"2025-11-20T18:13:36.365Z","__v":0}

class RegisterResponse {
  RegisterResponse({
    this.message,
    this.data,});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// email : "amr222222222@gmail.com"
/// password : "$2b$10$35aRQeeVsH9ozqA.ZE1xPuvVR9WzoreNpqY4cUVgiv/YgF8FQA4Iq"
/// name : "amr mustafa"
/// phone : "+201141209334"
/// avaterId : 1
/// _id : "691f5a506340be552b9a0e09"
/// createdAt : "2025-11-20T18:13:36.365Z"
/// updatedAt : "2025-11-20T18:13:36.365Z"
/// __v : 0

class Data {
  Data({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,});

  Data.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}