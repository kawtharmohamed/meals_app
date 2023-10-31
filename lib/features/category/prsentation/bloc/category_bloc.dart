import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_all_categories.dart';
import 'category_events.dart';
import 'category_states.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesStates> {
 final GetAllCategoriesUsecase getAllCategories;

 CategoriesBloc({required this.getAllCategories}) : super(CategoriesInitial()) {
  on<CategoriesEvents>((event, emit) async {
   if (event is AllCategoriesEvent) {
    emit(LoadingState());
    try {
     final categories = await getAllCategories();
     emit(LoadedCategoriesState(categories: categories));
    } catch (e){
     emit( ErrorState(message: "No Internet Connection"));
    }
   } else if (event is CategoryRefreshEvent) {
    emit(LoadingState());
    try {
     final categories = await getAllCategories();
     emit(LoadedCategoriesState(categories: categories));
    } catch (e){
     emit( ErrorState(message: "No Internet Connection"));
    }
   }
  });
 }
}
