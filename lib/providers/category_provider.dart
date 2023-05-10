import 'package:oms/models/categories/category_model.dart';
import 'package:oms/repositories/category_repository.dart';

class CategoryProvider {
  final CategoryRepository _categoryRepository;

  CategoryProvider(this._categoryRepository);

  Future<List<CategoryModel>> getCategories() async {
    var categories = await _categoryRepository.getCategories();

    return categories
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }
}
