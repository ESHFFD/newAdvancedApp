// ignore_for_file: public_member_api_docs, sort_constructors_first
class SliderObject {
  final String title;
  final String subtitle;
  final String image;
  SliderObject({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

class Customers {
  String id;
  String name;
  int numOfNotification;
  Customers({
    required this.id,
    required this.name,
    required this.numOfNotification,
  });
}

class Contacts {
  String phone;
  String email;
  String link;
  Contacts({
    required this.phone,
    required this.email,
    required this.link,
  });
}

class Authentication {
  Customers customers;
  Contacts contacts;
  Authentication({
    required this.customers,
    required this.contacts,
  });
}
