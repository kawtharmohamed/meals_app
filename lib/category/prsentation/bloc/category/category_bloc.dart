import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/category/domain/usecases/get_all_categories.dart';

import 'categorymeal_event.dart';
import 'categorymeal_state.dart';

class CategoriesBloc extends Bloc<CategoriesMealsEvents, CategoriesMealsStates> {
 final GetAllCategoriesUsecase getAllCategories;

 CategoriesBloc({required this.getAllCategories}) : super(CategoriesMealsInitial()) {
  on<CategoriesMealsEvents>((event, emit) async {
   if (event is AllCategoriesEvent) {
    emit(LoadingState());
    final categories = await getAllCategories();
    emit(LoadedCategoriesState(categories: categories));
   } else if (event is RefreshEvent) {
    emit(LoadingState());
    final categories = await getAllCategories();
    emit(LoadedCategoriesState(categories: categories));
   }
   //emit(ErrorCategoriesState(message: message));
  });
 }
}
