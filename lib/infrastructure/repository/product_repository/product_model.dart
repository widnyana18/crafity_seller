import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable{
  final String id, typeId, companyId, cartId, nameProd, description;
  final double price;
  final TimeOfDayFormat date;
  final int viewer, likers, discount;
  final Model model;

  Product({this.id, this.typeId, this.companyId, this.cartId, this.nameProd, this.description, this.price, this.date, this.viewer, this.likers, this.discount, this.model});

  @override  
  List<Object> get props => [id, typeId, companyId, cartId, nameProd, description, price, date, viewer, likers, discount, model];    
}

class Model extends Equatable{
  final String id, pict, subName;
  final int theme;

  Model({this.id, this.pict, this.subName, this.theme});

  @override  
  List<Object> get props => [id, pict, subName, theme];
}