class RegUsers {
  String uid;
  String email;
  String displayname;
  String photoUrl;
  bool display;

  RegUsers({
    this.uid = "",
    this.email = "",
    this.displayname = "",
    this.photoUrl = "",
    this.display = false,
  });
}

class Items {
  String uid;
  String name;
  String desc;
  String photoUrl;
  String price;
  bool display;

  Items({
    this.uid = "",
    this.name = "",
    this.desc = "",
    this.photoUrl = "",
    this.price = "",
    this.display = false,
  });
}
