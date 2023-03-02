class RelatedPerson {
  String? id;
  String? title;
  String? email;
  String? sip;
  String? picture;

  RelatedPerson({this.id, this.title, this.email, this.sip, this.picture});

  RelatedPerson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    email = json['email'];
    sip = json['sip'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['email'] = this.email;
    data['sip'] = this.sip;
    data['picture'] = this.picture;
    return data;
  }
}
