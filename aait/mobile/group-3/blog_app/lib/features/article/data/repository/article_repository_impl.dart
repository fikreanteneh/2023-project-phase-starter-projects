import 'package:blog_app/features/article/data/models/user_model.dart';
import 'package:blog_app/features/profile/domain/use_case/get_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/util/typedef.dart';
import '../../domain/entity/article.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/article_remote_datasource.dart';
import '../models/article_model.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ArticleRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  ResultFuture<Article> createArticle({
    required List<String> tags,
    required String content,
    required String title,
    required String subTitle,
    required String estimatedReadTime,
    required XFile image,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final articleMap = {
          "tags": tags,
          "title": title,
          "subTitle": subTitle,
          "content": content,
          "estimatedReadTime": estimatedReadTime,
          "image": image.path,
          "user": "semere"
        };

        final article = ArticleModel.fromJson(articleMap);
        final result = await remoteDataSource.createArticle(article);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure.fromException(e));
      }
    } else {
      return const Left(ServerFailure(
          message: "Oops, No Internet Connection", statusCode: 500));
    }
  }

  @override
  ResultFuture<Article> deleteArticle(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.deleteArticle(id);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure.fromException(e));
      }
    } else {
      return const Left(ServerFailure(
          message: "Oops, No Internet Connection", statusCode: 500));
    }
  }

  @override
  ResultFuture<List<Article>> getAllArticles() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getAllArticles();
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure.fromException(e));
      }
    } else {
      return const Left(ServerFailure(
          message: "Oops, No Internet Connection", statusCode: 500));
    }
  }

  @override
  ResultFuture<List<Article>> getArticle({
    String? tags,
    String? searchParams,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await remoteDataSource.getArticle(tags ?? "", searchParams ?? "");
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure.fromException(e));
      }
    } else {
      return const Left(ServerFailure(
          message: "Oops, No Internet Connection", statusCode: 500));
    }
  }

  @override
  ResultFuture<Article> getArticleById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getArticleById(id);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure.fromException(e));
      }
    } else {
      return const Left(ServerFailure(
          message: "Oops, No Internet Connection", statusCode: 500));
    }
  }

  @override
  ResultFuture<List<String>> getTags() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getTags();
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure.fromException(e));
      }
    } else {
      return const Left(ServerFailure(
          message: "Oops, No Internet Connection", statusCode: 500));
    }
  }

  @override
  ResultFuture<Article> updateArticle({
    required List<String> tags,
    required String content,
    required String title,
    required String subTitle,
    required String estimatedReadTime,
    required XFile image,
    required String id,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final articleMap = {
          "tags": tags,
          "content": content,
          "title": title,
          "subTitle": subTitle,
          "estimatedReadTime": estimatedReadTime,
          "image": image.path,
          "id": id,
        };
        final article = ArticleModel.fromJson(articleMap);
        final result = await remoteDataSource.updateArticle(article);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure.fromException(e));
      }
    } else {
      return const Left(ServerFailure(
          message: "Oops, No Internet Connection", statusCode: 500));
    }
  }
}
