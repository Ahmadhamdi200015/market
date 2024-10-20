class MyCouponModel {
  int? CouponId;
  String? CouponName;
  int? CouponCount;
  int? CouponDiscount;
  String? CouponExpiredate;



  MyCouponModel(
      {this.CouponId,
        this.CouponName,
        this.CouponCount,
        this.CouponDiscount,
        this.CouponExpiredate,
      });

  MyCouponModel.fromJson(Map<String, dynamic> json) {
    CouponId = json['coupon_id'];
    CouponName = json['coupon_name'];
    CouponCount = json['coupon_count'];
    CouponDiscount = json['coupon_discount'];
    CouponExpiredate = json['coupon_expiredate'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = CouponId;
    data['coupon_name'] = CouponName;
    data['coupon_count'] = CouponCount;
    data['coupon_discount'] = CouponDiscount;
    data['coupon_expiredate'] = CouponExpiredate;


    return data;
  }
}