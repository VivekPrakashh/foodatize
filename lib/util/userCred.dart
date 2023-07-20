

import 'package:foodatize/util/storage.dart';

class UserCred {
  bool isUserLogin() {
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive == '' ? false : true;
  }

  bool isSellerLogin() {
    String isActive = StorageUtil.getString('SELLERID');
    //print("ff${isActive}ff");
    return isActive == '' ? false : true;
  }

  bool isHavePincode() {
    String isActive = StorageUtil.getString('PINCODE');
    //print("ff${isActive}ff");
    return isActive == '' ? false : true;
  }

  String getUserId() {
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getSellerId() {
    String isActive = StorageUtil.getString('SELLERID');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getUserName() {
    String isActive = StorageUtil.getString('NAME');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getUserImage() {
    String isActive = StorageUtil.getString('IMAGE');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getPincode() {
    String isActive = StorageUtil.getString('PINCODE');
    return isActive;
  }

  String getAreaName() {
    String isActive = StorageUtil.getString('AREA');
    return isActive;
  }

  String getLng() {
    String isActive = StorageUtil.getString('LNG');
    return isActive;
  }

  String getLat() {
    String isActive = StorageUtil.getString('LAT');
    return isActive;
  }

  bool getPincodeAvail() {
    String isActive = StorageUtil.getString('AVAIL');
    return isActive == 'true' ? true : false;
  }

  void addUserId(String id) {
    StorageUtil.putString('USERID', id);
  }

  void addSellerId(String id) {
    StorageUtil.putString('SELLERID', id);
  }

  void addUsername(String name) {
    StorageUtil.putString('NAME', name);
  }

  void addUserimage(String image) {
    StorageUtil.putString('IMAGE', image);
  }

  void addPincode(String pin) {
    StorageUtil.putString('PINCODE', pin);
  }

  void addAreaName(String pin) {
    StorageUtil.putString('AREA', pin);
  }

  void setShop(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setBank(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setSchool(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setCategory(String info) {
    StorageUtil.putString('INFO', info);
  }

  void addPincodeAvail(bool isAvail) {
    StorageUtil.putString('AVAIL', '$isAvail');
  }

  void addLatLng({double lat = 0.0, double lng = 0.0}) {
    StorageUtil.putString('LAT', '$lat');
    StorageUtil.putString('LNG', '$lng');
  }

  void logoutUser() {
    StorageUtil.putString('USERID', '');
    StorageUtil.putString('SELLERID', '');
    StorageUtil.putString('PINCODE', '');
    StorageUtil.putString('AREA', '');
    StorageUtil.putString('LAT', '');
    StorageUtil.putString('LNG', '');
    StorageUtil.putString('AVAIL', 'false');
    StorageUtil.clearAll();
  }
}

final userCred = UserCred();
