import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable{
  String id;
  Timestamp date;  
  Map<String, dynamic> order;

  Order({this.id, this.date, this.order});

  @override
  List<Object> get props => [id, date, order];
  
}