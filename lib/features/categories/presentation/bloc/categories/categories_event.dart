part of 'categories_bloc.dart';

sealed class CategoriesEvent {}

class GetAllProductsEvent extends CategoriesEvent {}

class GetAllCategoriesEvent extends CategoriesEvent {}
