import 'dart:io';

import 'package:challenge_meli/data/datasource/remote_datasource.dart';
import 'package:challenge_meli/data/exception.dart';
import 'package:challenge_meli/data/failure.dart';
import 'package:challenge_meli/domain/entities/items_category_entity.dart';
import 'package:challenge_meli/domain/respositories/meli_repository.dart';
import 'package:dartz/dartz.dart';


class MeliRepositoryImpl implements MeliRepository {
  final RemoteDataSource remoteDataSource;

  MeliRepositoryImpl({required this.remoteDataSource});


  @override
  Future<Either<Failure, ItemsCategoryEntity>> getItemsCategories({int? offset,String? category,String? name}) async {
    try {
      final result =
          await remoteDataSource.getItemsCategories(offset: offset,category:category,name:name );
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
