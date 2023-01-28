// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponses _$BaseResponsesFromJson(Map<String, dynamic> json) =>
    BaseResponses()
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponsesToJson(BaseResponses instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CustomersResponses _$CustomersResponsesFromJson(Map<String, dynamic> json) =>
    CustomersResponses(
      id: json['id'] as String?,
      name: json['name'] as String?,
      numOfNotification: json['numOfNotification'] as int?,
    );

Map<String, dynamic> _$CustomersResponsesToJson(CustomersResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotification': instance.numOfNotification,
    };

ContactsResponses _$ContactsResponsesFromJson(Map<String, dynamic> json) =>
    ContactsResponses(
      phone: json['phone'] as String?,
      link: json['link'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ContactsResponsesToJson(ContactsResponses instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'link': instance.link,
      'email': instance.email,
    };

AuthenticationResponses _$AuthenticationResponsesFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponses(
      customer: json['customer'] == null
          ? null
          : CustomersResponses.fromJson(
              json['customer'] as Map<String, dynamic>),
      contacts: json['contacts'] == null
          ? null
          : ContactsResponses.fromJson(
              json['contacts'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponsesToJson(
        AuthenticationResponses instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };
