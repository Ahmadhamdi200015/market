class MyAddressModel {
  int? AddressId;
  int? AddressUsersid;
  String? AddressName;
  String? AddressCity;
  String? AddressStreet;
  String? AddressLat;
  String? AddressLong;


  MyAddressModel(
      {this.AddressId,
        this.AddressUsersid,
        this.AddressName,
        this.AddressCity,
        this.AddressStreet,
        this.AddressLat,
        this.AddressLong,
        });

  MyAddressModel.fromJson(Map<String, dynamic> json) {
    AddressId = json['address_id'];
    AddressUsersid = json['address_userid'];
    AddressName = json['address_name'];
    AddressCity = json['address_city'];
    AddressStreet = json['address_street'];
    AddressLat = json['address_lat'];
    AddressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = AddressId;
    data['address_userid'] = AddressUsersid;
    data['address_name'] = AddressName;
    data['address_city'] = AddressCity;
    data['address_street'] = AddressStreet;
    data['address_lat'] = AddressLat;
    data['address_long'] = AddressLong;

    return data;
  }
}