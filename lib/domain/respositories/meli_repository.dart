import 'package:challenge_meli/data/failure.dart';
import 'package:challenge_meli/domain/entities/items_category_entity.dart';
import 'package:dartz/dartz.dart';



abstract class MeliRepository {
      Future<Either<Failure, ItemsCategoryEntity>> getItemsCategories({int? offset,String? category,String? name});

}