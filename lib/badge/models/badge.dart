class Badge {
  int? id;
  String? title;
  int? lookupId;
  String? lookupValue;
  bool? isSecretFieldValue;
  int? count;
  double? avarageRating;

  Badge({
    this.id,
    this.title,
    this.lookupId,
    this.lookupValue,
    this.isSecretFieldValue,
    this.count,
    this.avarageRating,
  });

  Badge.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    lookupId = json['lookupId'];
    lookupValue = json['lookupValue'];
    isSecretFieldValue = json['isSecretFieldValue'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Title'] = this.title;
    data['lookupId'] = this.lookupId;
    data['lookupValue'] = this.lookupValue;
    data['isSecretFieldValue'] = this.isSecretFieldValue;
    data['count'] = this.count;
    return data;
  }
}
