import 'package:equatable/equatable.dart';

abstract class CategoriesEvents extends Equatable{
  const CategoriesEvents();
  @override
  List<Object> get props => [];
}
class AllCategoriesEvent extends CategoriesEvents{}

class CategoryRefreshEvent extends CategoriesEvents{}
class SliderEvent extends CategoriesEvents{
  final int activeIndex;
  const SliderEvent({required this.activeIndex});
}
