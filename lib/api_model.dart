class CatInfo {
  Status? status;
  String? sId;
  String? user;
  String? text;
  int? iV;
  String? source;
  String? updatedAt;
  String? type;
  String? createdAt;
  bool? deleted;
  bool? used;

  CatInfo(
      {this.status,
      this.sId,
      this.user,
      this.text,
      this.iV,
      this.source,
      this.updatedAt,
      this.type,
      this.createdAt,
      this.deleted,
      this.used});

  CatInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    sId = json['_id'];
    user = json['user'];
    text = json['text'];
    iV = json['__v'];
    source = json['source'];
    updatedAt = json['updatedAt'];
    type = json['type'];
    createdAt = json['createdAt'];
    deleted = json['deleted'];
    used = json['used'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status?.toJson();
    }
    data['_id'] = sId;
    data['user'] = user;
    data['text'] = text;
    data['__v'] = iV;
    data['source'] = source;
    data['updatedAt'] = updatedAt;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['deleted'] = deleted;
    data['used'] = used;
    return data;
  }
}

class Status {
  bool? verified;
  int? sentCount;

  Status({this.verified, this.sentCount});

  Status.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    sentCount = json['sentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['verified'] = verified;
    data['sentCount'] = sentCount;
    return data;
  }
}
