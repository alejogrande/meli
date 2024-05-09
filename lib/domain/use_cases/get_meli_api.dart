import 'package:challenge_meli/data/failure.dart';
import 'package:challenge_meli/domain/entities/items_category_entity.dart';
import 'package:challenge_meli/domain/respositories/meli_repository.dart';
import 'package:dartz/dartz.dart';



class GetMeliApi {
  final MeliRepository repository;

  GetMeliApi(this.repository);



    Future<Either<Failure, ItemsCategoryEntity>> getItemsCategories({int? offset,String? category, String? name}) {
    return repository.getItemsCategories(offset: offset,category: category, name: name);
  }


  
}
