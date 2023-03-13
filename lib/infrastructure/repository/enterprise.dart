import 'package:equatable/equatable.dart';

class Enterprise extends Equatable{
  final String id, userId, companyName, location, description, typeId;   
  final int employes, found;
  final Owner owner;

  Enterprise({this.id, this.userId, this.companyName, this.location, this.description, this.typeId, this.found, this.owner, this.employes});  

  @override
  List<Object> get props => [id, userId, companyName, location, description, typeId, found, owner, employes];

  // @override
  // String toString => ''' ''';
}

class Owner extends Equatable{  
  final String name, status;

  Owner({this.name, this.status});
  
  @override
  List<Object> get props => [name, status];
}