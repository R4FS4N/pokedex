class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;

  Pokemon({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
  });

  // fromJson
  // toJson
  // Pokemon.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   num = json['num'];
  //   name = json['name'];
  //   img = json['img'];
  // }
  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['img'] = img;

    return data;
  }
}
