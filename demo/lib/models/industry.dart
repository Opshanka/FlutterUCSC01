class Industry {
  late int id;
  late String name;
  late String logoUrl;

  Industry({
    required this.id,
    required this.name,
    required this.logoUrl});

  Industry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo_url'] = this.logoUrl;
    return data;
  }
}
