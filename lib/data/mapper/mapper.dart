import 'package:adv_app/app/extentions.dart';
import 'package:adv_app/data/responses/responses.dart';
import 'package:adv_app/domain/model.dart';

const EMPTY = '';
const ZERO = 0;

extension CustomersResponsesMapper on CustomersResponses? {
  Customers toDomain() {
    return Customers(
        id: this?.id?.orEmpty() ?? EMPTY,
        name: this?.name?.orEmpty() ?? EMPTY,
        numOfNotification: this?.numOfNotification?.orEmpty() ?? ZERO);
  }
}

extension ContactsResponsesMapper on ContactsResponses? {
  Contacts toDomain() {
    return Contacts(
        phone: this?.phone?.orEmpty() ?? EMPTY,
        email: this?.email?.orEmpty() ?? EMPTY,
        link: this?.link?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponsesMapper on AuthenticationResponses? {
  Authentication toDomain() {
    return Authentication(
        customers: this!.customer.toDomain(),
        contacts: this!.contacts.toDomain());
  }
}
