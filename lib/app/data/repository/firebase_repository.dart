import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:homeecart/app/data/network_model/cart_product_model.dart';
import 'package:homeecart/app/data/network_model/category.dart';
import 'package:homeecart/app/data/network_model/market.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/data/network_model/user.dart';
import 'package:homeecart/app/data/repository/firebase_constants.dart';
import 'package:homeecart/app/utils/utility.dart';

class FirebaseRepository {
  FirebaseRepository() {
    var user = FirebaseAuth.instance.currentUser;
    uid = user == null ? '' : user.uid;
  }

  /// Variable to store user uid
  static String uid;

  static final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;


  /// Return product stream
  Stream<QuerySnapshot> product(String marketId) =>
      FirebaseFirestore.instance.collection(Fc.product).snapshots();

  /// Return order stream
  Stream<QuerySnapshot> order() =>
      FirebaseFirestore.instance.collection(Fc.order).snapshots();

  /// return Category Stream
  Stream<QuerySnapshot> category() =>
      FirebaseFirestore.instance.collection(Fc.category).snapshots();

  /// return Category Stream
  Stream<QuerySnapshot> cart() =>
      FirebaseFirestore.instance.collection(Fc.user).doc(uid).collection(Fc.cart).snapshots();


  /// Instance of user market document
  DocumentReference userMarketCollection = firebaseFireStore
      .collection(Fc.user)
      .doc(uid)
      .collection(Fc.details)
      .doc(Fc.market);

  // static CollectionReference category = FirebaseFirestore.instance.collection(AppConstants.category);
  // static CollectionReference slider = FirebaseFirestore.instance.collection(AppConstants.slider);
  // static CollectionReference banner = FirebaseFirestore.instance.collection(AppConstants.banner);
  // static CollectionReference product = FirebaseFirestore.instance.collection(AppConstants.product);
  // static CollectionReference post = FirebaseFirestore.instance.collection(AppConstants.post);

  /// Instance of user collection
  CollectionReference userCollection = firebaseFireStore.collection(Fc.user);

  /// Instance of category collection
  CollectionReference categoryCollection =
      firebaseFireStore.collection(Fc.category);

  /// Instance of product collection
  CollectionReference productCollection =
      firebaseFireStore.collection(Fc.product);

  CollectionReference cartCollection = firebaseFireStore.collection(Fc.user).doc(uid).collection(Fc.cart);


  // void getAllProduct() async {
  //   await productCollection.get().then((value){
  //     value.docs.forEach((element) async {
  //       var id = element.id;
  //       await updateProductField(id);
  //       Utility.printDLog('${element.data()}');
  //     });
  //   });
  // }
  //
  // Future<void> updateProductField(String id) async {
  //   await productCollection.doc(id).update(<String,dynamic>{
  //     'id' : id
  //   });
  // }

  Future<void> updateAddress(String address) async {
    await userCollection.doc(uid).update(<String,dynamic>{
      'address':address
    });
  }

  /// Function add category
  void addCategory(Category category) async {
    var categoryRef = categoryCollection.doc();
    category.id = categoryRef.id;
    await categoryRef.set(category.toJson(category));
    Utility.closeDialog();
  }

  /// Function add category
  Future<void> updateCategory(Category category) async {
    await categoryCollection.doc(category.id).update(category.toJson(category));
  }

  Future<void> deleteCategory(String uid) async{
    await categoryCollection.doc(uid).delete();
  }

  /// Function to check user details is present in user collection
  Future<bool> checkProfileCreate(String uid) async {
    var ok = false;
    await userCollection.doc(uid).get().then((value) {
      value.exists ? ok = true : ok = false;
    });
    return ok;
  }

  Future<UserModel> getUserData() async {
    Utility.printDLog('get user details function call');
    UserModel user;
    await userCollection.doc(uid).get().then((value) {
      user = UserModel.fromJson(value.data());
      Utility.printDLog('User Data ${value.data()}');
    });
    return user;
  }

  /// Function to upload image on FireStore in firebase
  Future<String> uploadImage(File file, String id) async {
    Utility.showLoadingDialog();
    Utility.printDLog('Upload image function call');
    String url;
    var reference = firebaseStorage.ref('${Fc.category}/$id.png');
    var uploadTask = await reference.putFile(file).whenComplete(() async {
      url = await reference.getDownloadURL();
    });
    return url;
  }

  /// Function to add user details
  Future<void> addUser(UserModel user) async {
    Utility.printDLog('User create function called');
    await userCollection.doc(user.uid).set(user.toJson(user));
  }

  Future<List<Category>> getAllCategory() async {
    var allCategory = <Category>[];
    await categoryCollection.get().then((value){
      value.docs.forEach((element) {
        print(element.data());
        allCategory.add(Category.fromJson(element.data()));
      });
    });

    print(allCategory.length);
    return allCategory;
  }

  Future<MarketModel> getMarketDetails() async {
    MarketModel marketModel;
    await userMarketCollection.get().then((value) {
      Utility.printDLog('${value.data()}');
      marketModel = MarketModel.fromJson(value.data());
    });
    return marketModel;
  }

  Future<List<CartProduct>> countCartProduct() async {
    var products = <CartProduct>[];
    await userCollection.doc(uid).collection(Fc.cart).get().then((value){
      value.docs.forEach((element) {
          Utility.printDLog('${element.data()}');
          products.add(CartProduct.fromJson(element.data()));
      });
    });
    return products;
  }

  Future<void> addProductToCart(Product model) async {
    var cartProduct = CartProduct()
      ..id = model.id
      ..count = 1
      ..name = model.name
      ..limit = model.limit
      ..weight = model.weight
      ..price = model.price
      ..discountPrice = model.discountPrice
      ..marketId = model.marketId
      ..marketName = model.marketName
      ..desc = model.desc
      ..imageUrl = model.imageUrl;

    await userCollection.doc(uid).collection(Fc.cart).doc(model.id).set(cartProduct.toJson(cartProduct));
  }

  Future<void> placeOrder() async {

  }

  Future<void> deleteProductFormCart(String proUid) async{
    await userCollection.doc(uid).collection(Fc.cart).doc(proUid).delete();
  }

  Future<void> updateCountValue(String proUid, int value) async{
    await userCollection.doc(uid).collection(Fc.cart).doc(proUid).update(<String, dynamic>{
      'Count' : FieldValue.increment(value),
    });
  }

}
