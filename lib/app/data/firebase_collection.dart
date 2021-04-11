import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homeecart/app/utils/string_constant.dart';

abstract class FirebaseCollections{
  static CollectionReference category = FirebaseFirestore.instance.collection(AppConstants.category);
  static CollectionReference slider = FirebaseFirestore.instance.collection(AppConstants.slider);
  static CollectionReference banner = FirebaseFirestore.instance.collection(AppConstants.banner);
  static CollectionReference product = FirebaseFirestore.instance.collection(AppConstants.product);
  static CollectionReference post = FirebaseFirestore.instance.collection(AppConstants.post);

}