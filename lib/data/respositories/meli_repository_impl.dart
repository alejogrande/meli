import 'package:challenge_meli/data/datasource/remote_datasource.dart';
import 'package:challenge_meli/domain/respositories/meli_repository.dart';


class MeliRepositoryImpl implements MeliRepository {
  final RemoteDataSource remoteDataSource;

  MeliRepositoryImpl({required this.remoteDataSource});



}
