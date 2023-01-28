// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponses {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class CustomersResponses {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'numOfNotification')
  int? numOfNotification;
  CustomersResponses({
    this.id,
    this.name,
    this.numOfNotification,
  });
  //from json
  factory CustomersResponses.fromJson(Map<String, dynamic> json) =>
      _$CustomersResponsesFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$CustomersResponsesToJson(this);
}

@JsonSerializable()
class ContactsResponses {
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'link')
  String? link;
  @JsonKey(name: 'email')
  String? email;
  ContactsResponses({
    this.phone,
    this.link,
    this.email,
  });
  //from json
  factory ContactsResponses.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponsesFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$ContactsResponsesToJson(this);
}

@JsonSerializable()
class AuthenticationResponses extends BaseResponses {
  @JsonKey(name: 'customer')
  CustomersResponses? customer;
  @JsonKey(name: 'contacts')
  ContactsResponses? contacts;
  AuthenticationResponses({
    this.customer,
    this.contacts,
  });

  //from json
  factory AuthenticationResponses.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponsesFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$AuthenticationResponsesToJson(this);
}
