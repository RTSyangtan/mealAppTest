import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tryonemore/services/services.dart';

class Providers {

  static final categoryProvider = FutureProvider((ref)=>Services.getCategory());
  static final productByCateProvider = FutureProvider.family((ref,int cateId)=>Services.getProductByCate(cateId));
}