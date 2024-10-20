class myOrders {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersTotalprice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersNoterating;
  int? ordersPaymentmethod;
  int? ordersStatus;
  String? ordersDatetime;
  int? addressId;
  String? addressCity;
  String? addressName;
  int? addressUserid;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  myOrders(
      {this.ordersId,
        this.ordersUsersid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPricedelivery,
        this.ordersPrice,
        this.ordersTotalprice,
        this.ordersCoupon,
        this.ordersRating,
        this.ordersNoterating,
        this.ordersPaymentmethod,
        this.ordersStatus,
        this.ordersDatetime,
        this.addressId,
        this.addressCity,
        this.addressName,
        this.addressUserid,
        this.addressStreet,
        this.addressLat,
        this.addressLong});

  myOrders.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
    addressUserid = json['address_userid'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['orders_datetime'] = ordersDatetime;
    data['address_id'] = addressId;
    data['address_city'] = addressCity;
    data['address_name'] = addressName;
    data['address_userid'] = addressUserid;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}