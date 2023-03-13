import 'package:equatable/equatable.dart';

class Type extends Equatable{
  String id;
  List<String> typeName;

  Type({this.id, this.typeName});

  @override
  List<Object> get props => [id, typeName];  
}