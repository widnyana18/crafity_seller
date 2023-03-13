import 'package:equatable/equatable.dart';

class Activity extends Equatable{
  String userId, prodId, role;  
  Map<String, dynamic> product;    

  Activity({this.prodId, this.product, this.role, this.userId});

  @override
  List<Object> get props => [prodId, product, role, userId];  
}