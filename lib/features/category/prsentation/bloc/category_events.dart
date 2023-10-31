import 'package:equatable/equatable.dart';

abstract class CategoriesEvents extends Equatable{
  CategoriesEvents();
  @override
  List<Object> get props => [];
}
class AllCategoriesEvent extends CategoriesEvents{}

class CategoryRefreshEvent extends CategoriesEvents{}
