class Address {
  final int id;
  final int customerId;
  final String? firstName;
  final String? lastName;
  final String? company;
  final String? address1;
  final String? address2;
  final String? city;
  final String? province;
  final String country;
  final String? zip;
  final String? phone;
  final String name;
  final String? provinceCode;
  final String countryCode;
  final String countryName;
  final bool isDefault;

  Address({
    required this.id,
    required this.customerId,
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.province,
    required this.country,
    this.zip,
    this.phone,
    required this.name,
    this.provinceCode,
    required this.countryCode,
    required this.countryName,
    required this.isDefault,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      customerId: json['customer_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      company: json['company'],
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      province: json['province'],
      country: json['country'],
      zip: json['zip'],
      phone: json['phone'],
      name: json['name'],
      provinceCode: json['province_code'],
      countryCode: json['country_code'],
      countryName: json['country_name'],
      isDefault: json['default'],
    );
  }
}

class Customer {
  final int id;
  final String email;
  final String createdAt;
  final String updatedAt;
  final String? firstName;
  final String? lastName;
  final int ordersCount;
  final String state;
  final String totalSpent;
  final int? lastOrderId;
  final String? note;
  final bool verifiedEmail;
  final String? multipassIdentifier;
  final bool taxExempt;
  final String tags;
  final String? lastOrderName;
  final String currency;
  final String? phone;
  final List<Address> addresses;
  final dynamic taxExemptions;
  final dynamic emailMarketingConsent;
  final dynamic smsMarketingConsent;
  final String adminGraphqlApiId;
  final Address? defaultAddress;

  Customer({
    required this.id,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    this.firstName,
    this.lastName,
    required this.ordersCount,
    required this.state,
    required this.totalSpent,
    this.lastOrderId,
    this.note,
    required this.verifiedEmail,
    this.multipassIdentifier,
    required this.taxExempt,
    required this.tags,
    this.lastOrderName,
    required this.currency,
    this.phone,
    required this.addresses,
    required this.taxExemptions,
    required this.emailMarketingConsent,
    this.smsMarketingConsent,
    required this.adminGraphqlApiId,
    this.defaultAddress,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      ordersCount: json['orders_count'],
      state: json['state'],
      totalSpent: json['total_spent'],
      lastOrderId: json['last_order_id'],
      note: json['note'],
      verifiedEmail: json['verified_email'],
      multipassIdentifier: json['multipass_identifier'],
      taxExempt: json['tax_exempt'],
      tags: json['tags'],
      lastOrderName: json['last_order_name'],
      currency: json['currency'],
      phone: json['phone'],
      addresses: (json['addresses'] as List<dynamic>).map((e) => Address.fromJson(e)).toList(),
      taxExemptions: json['tax_exemptions'],
      emailMarketingConsent: json['email_marketing_consent'],
      smsMarketingConsent: json['sms_marketing_consent'],
      adminGraphqlApiId: json['admin_graphql_api_id'],
      defaultAddress: json['default_address'] != null ? Address.fromJson(json['default_address']) : null,
    );
  }
}
