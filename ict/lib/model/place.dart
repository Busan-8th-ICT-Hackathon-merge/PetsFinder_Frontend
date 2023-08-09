class Place {
  String? id;
  String? name;
  List<int>? locate;
  String? address;
  String? category;
  String? phoneNumber;
  String? homepageUrl;
  List<String>? operatingHours;

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    locate = json['locate'];
    address = json['address'];
    category = json['category'];
    phoneNumber = json['phoneNumber'];
    homepageUrl = json['homepageUrl'];
    operatingHours = json['operatingHours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['locate'] = locate;
    data['address'] = address;
    data['category'] = category;
    data['phoneNumber'] = phoneNumber;
    data['homepageUrl'] = homepageUrl;
    data['operatingHours'] = operatingHours;
    return data;
  }
}
