import 'package:newstime/Models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];

  CategoryModel category = CategoryModel();

  category.categoryName = "Science";
  categories.add(category);

  category = CategoryModel();
  category.categoryName = "Sports";
  categories.add(category);

  category = CategoryModel();
  category.categoryName = "Business";
  categories.add(category);

  category = CategoryModel();
  category.categoryName = "General";
  categories.add(category);

  category = CategoryModel();
  category.categoryName = "Health";
  categories.add(category);

  category = CategoryModel();
  category.categoryName = "Entertainment";
  categories.add(category);

  return categories;
}
