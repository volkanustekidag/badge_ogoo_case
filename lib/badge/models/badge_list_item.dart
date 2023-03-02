import 'package:badge_case/badge/models/author.dart';
import 'package:badge_case/badge/models/badge.dart';
import 'package:badge_case/badge/models/related_person.dart';

class BagdeListItem {
  String? iD;
  List<RelatedPerson>? relatedPerson;
  String? praiseRating;
  String? message;
  List<Badge>? badge;
  List<Author>? author;
  String? created;

  BagdeListItem(
      {this.iD,
      this.relatedPerson,
      this.praiseRating,
      this.message,
      this.badge,
      this.author,
      this.created});

  BagdeListItem.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    if (json['RelatedPerson'] != null) {
      relatedPerson = <RelatedPerson>[];
      json['RelatedPerson'].forEach((v) {
        relatedPerson!.add(new RelatedPerson.fromJson(v));
      });
    }
    praiseRating = json['PraiseRating'];
    message = json['Message'];
    if (json['Badge'] != null) {
      badge = <Badge>[];
      json['Badge'].forEach((v) {
        badge!.add(new Badge.fromJson(v));
      });
    }
    if (json['Author'] != null) {
      author = <Author>[];
      json['Author'].forEach((v) {
        author!.add(new Author.fromJson(v));
      });
    }
    created = json['Created.'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    if (this.relatedPerson != null) {
      data['RelatedPerson'] =
          this.relatedPerson!.map((v) => v.toJson()).toList();
    }
    data['PraiseRating'] = this.praiseRating;
    data['Message'] = this.message;
    if (this.badge != null) {
      data['Badge'] = this.badge!.map((v) => v.toJson()).toList();
    }
    if (this.author != null) {
      data['Author'] = this.author!.map((v) => v.toJson()).toList();
    }
    data['Created'] = this.created;
    return data;
  }
}
