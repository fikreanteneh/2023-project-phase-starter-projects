import '../../../../core/util/typedef.dart';
import '../entity/article.dart';

abstract class ArticleRepository {
  //Create Article
  ResultFuture<Article> createArticle({
    required List<String> tags,
    required String content,
    required String title,
    required String subTitle,
    required String estimatedReadTime,
    required String image,
  });
  // Read Ariticle
  ResultFuture<List<Article>> getArticle({
    required String tags,
    required String searchParams,
  });
  ResultFuture<Article> getArticleById(String id);
  ResultFuture<List<Article>> getAllArticles();
  // Update Article
  ResultFuture<Article> updateArticle({
    required List<String> tags,
    required String content,
    required String title,
    required String subTitle,
    required String estimatedReadTime,
    required String image,
    required String id,
  });
  // Delete  Article
  ResultFuture<Article> deleteArticle(String id);

  ResultFuture<List<String>> getTags();

}
