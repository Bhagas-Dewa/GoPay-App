class ContactModel {
  final String name;
  final String phoneNumber;
  final bool isInvited;
  final bool hasGoPay;

  ContactModel({
    required this.name,
    required this.phoneNumber,
    this.isInvited = false,
    this.hasGoPay = false,
  });

  ContactModel copyWith({
    String? name,
    String? phoneNumber,
    bool? isInvited,
    bool? hasGoPay,
  }) {
    return ContactModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isInvited: isInvited ?? this.isInvited,
      hasGoPay: hasGoPay ?? this.hasGoPay,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'isInvited': isInvited,
      'hasGoPay': hasGoPay,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      isInvited: map['isInvited'] ?? false,
      hasGoPay: map['hasGoPay'] ?? false,
    );
  }

  @override
  String toString() {
    return 'ContactModel(name: $name, phoneNumber: $phoneNumber, isInvited: $isInvited, hasGoPay: $hasGoPay)';
  }
}

// Contoh data kontak untuk digunakan di TabviewUndang
class ContactData {
  static List<ContactModel> getSampleContacts() {
    return [
      ContactModel(
        name: 'Yogi galon',
        phoneNumber: '+628120356789',
        hasGoPay: true,
      ),
      ContactModel(
        name: 'Abie from padang',
        phoneNumber: '+628120356789',
        hasGoPay: true,
      ),
      ContactModel(
        name: 'Budi Santoso',
        phoneNumber: '+628123456789',
        hasGoPay: false,
      ),
      ContactModel(
        name: 'Dewi Putri',
        phoneNumber: '+628234567890',
        hasGoPay: true,
        isInvited: true,
      ),
      ContactModel(
        name: 'Eko Prasetyo',
        phoneNumber: '+628345678901',
        hasGoPay: false,
      ),
      ContactModel(
        name: 'Bambang Pamungkas',
        phoneNumber: '+628345672092',
        hasGoPay: false,
      ),
      ContactModel(
        name: 'Prabowo Subianto',
        phoneNumber: '+628645674577',
        hasGoPay: false,
      ),
      ContactModel(
        name: 'Joko Widodo',
        phoneNumber: '+6283456782211',
        hasGoPay: false,
      ),
    ];
  }
}