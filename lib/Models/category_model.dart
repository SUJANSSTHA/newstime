// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  String? categoryName;
  CategoryModel({
    this.categoryName,
  });
}

class NewsModel {
  String? title;
  String? description;
  String? urlToImage;
  String? author;
  String? content;
  NewsModel({
    this.title,
    this.description,
    this.urlToImage,
    this.author,
    this.content,
  });

  NewsModel copyWith({
    String? title,
    String? description,
    String? urlToImage,
    String? author,
    String? content,
  }) {
    return NewsModel(
      title: title ?? this.title,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
      author: author ?? this.author,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'author': author,
      'content': content,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      urlToImage: map['urlToImage'] != null ? map['urlToImage'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) => NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsModel(title: $title, description: $description, urlToImage: $urlToImage, author: $author, content: $content)';
  }

  @override
  bool operator ==(covariant NewsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.urlToImage == urlToImage &&
      other.author == author &&
      other.content == content;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      urlToImage.hashCode ^
      author.hashCode ^
      content.hashCode;
  }
}
