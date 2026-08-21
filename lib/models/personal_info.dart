class PersonalInfo {
  String fullName;
  String email;
  String phone;
  String location;
  String linkedIn;
  String github;
  String website;
  String? photoPath; // local path for now

  PersonalInfo({
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.location = '',
    this.linkedIn = '',
    this.github = '',
    this.website = '',
    this.photoPath,
  });

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'location': location,
        'linkedIn': linkedIn,
        'github': github,
        'website': website,
        'photoPath': photoPath,
      };

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        fullName: json['fullName'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        location: json['location'] ?? '',
        linkedIn: json['linkedIn'] ?? '',
        github: json['github'] ?? '',
        website: json['website'] ?? '',
        photoPath: json['photoPath'],
      );

  PersonalInfo copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? location,
    String? linkedIn,
    String? github,
    String? website,
    String? photoPath,
  }) {
    return PersonalInfo(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      linkedIn: linkedIn ?? this.linkedIn,
      github: github ?? this.github,
      website: website ?? this.website,
      photoPath: photoPath ?? this.photoPath,
    );
  }
}
