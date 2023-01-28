import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponses {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

class CustomersResponses {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'numOfNotification')
  int? numOfNotification;
}

class ContactsResponses {
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'link')
  String? link;
  @JsonKey(name: 'email')
  String? email;
}

class AuthenticationResponses extends BaseResponses {
  @JsonKey(name: 'customer')
  CustomersResponses? customer;
  @JsonKey(name: 'contacts')
  ContactsResponses? contacts;
}
