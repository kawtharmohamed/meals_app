
import 'package:equatable/equatable.dart';

class Categoryy extends Equatable{
  final String? idCategory;
 final String? strCategory;
   final String? strCategoryThumb;

  Categoryy({ this.idCategory, this.strCategory, this.strCategoryThumb});
  @override
  // TODO: implement props
  List<Object?> get props => [idCategory , strCategory ,strCategoryThumb ];


}