class AppLink{
  static const String server="https://172.16.12.109";
  static const String signup="$server/GLAREGROUPAPI/auth/signup.php";
  static const String login="$server/GLAREGROUPAPI/auth/login.php";
  static const String resetpassword="$server/GLAREGROUPAPI/forgetpassword/resetpassword.php";
  static const String checkemail="$server/GLAREGROUPAPI/forgetpassword/checkemail.php";

  static const String catview="$server/GLAREGROUPAPI/categories/view.php";
  static const String itemsview="$server/GLAREGROUPAPI/items/items.php";
  static const String Homeview="$server/GLAREGROUPAPI/home.php";

//  ==========================Image=================================
  static const String image="$server/GLAREGROUPAPI/upload/categories";
  static const String imageitems="$server/GLAREGROUPAPI/upload/items";

//  ==========================Favorite=================================

  static const String addfav="$server/GLAREGROUPAPI/favorite/add.php";
  static const String removefav="$server/GLAREGROUPAPI/favorite/remove.php";
  static const String favView="$server/GLAREGROUPAPI/favorite/view.php";
  static const String favDelete="$server/GLAREGROUPAPI/favorite/deletefromfavorite.php";
//=============================Cart========================================

  static const String cartDelete="$server/GLAREGROUPAPI/Cart/delete.php";
  static const String cartAdd="$server/GLAREGROUPAPI/Cart/add.php";
  static const String cartView="$server/GLAREGROUPAPI/Cart/view.php";
  static const String cartgetCount="$server/GLAREGROUPAPI/Cart/getcountitems.php";
  static const String cartremove="$server/GLAREGROUPAPI/Cart/remove.php";

  //==============================Search=================================


  static const String searchView="$server/GLAREGROUPAPI/items/search.php";

//==============================Address=================================

  static const String AddAdress="$server/GLAREGROUPAPI/address/add.php";
  static const String viewAddress="$server/GLAREGROUPAPI/address/view.php";
  static const String removeAddress="$server/GLAREGROUPAPI/address/delete.php";

//==============================Coupon=================================

  static const String CouponCheck="$server/GLAREGROUPAPI/coupon/checkcoupon.php";

//==============================CheckOut=================================

  static const String CheckOut="$server/GLAREGROUPAPI/orders/checkout.php";
  static const String pendingOrder="$server/GLAREGROUPAPI/orders/pending.php";
  static const String detailsOrder="$server/GLAREGROUPAPI/orders/details.php";
  static const String archiveOrder="$server/GLAREGROUPAPI/orders/archive.php";
  static const String deleteOrder="$server/GLAREGROUPAPI/orders/delete.php";
  static const String ratingOrder="$server/GLAREGROUPAPI/rating.php";


//==============================notification=================================

  static const String notificationOrder="$server/GLAREGROUPAPI/notification.php";


//==============================Offers=================================


  static const String offersProducts="$server/GLAREGROUPAPI/offers.php";














}