import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/entities/slider_entity.dart';
import '../../domain/repositories/customer_home_repository.dart';
import '../datasources/customer_home_remote_data_source.dart';

class CustomerHomeRepositoryImpl implements CustomerHomeRepository {
  final CustomerHomeRemoteDataSource remoteDataSource;

  CustomerHomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<SliderEntity>>> getSliders() async {
    return await remoteDataSource.getSliders();
  }
}
