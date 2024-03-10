// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_news_local_drift_database.dart';

// ignore_for_file: type=lint
class $SearchNewsTable extends SearchNews
    with TableInfo<$SearchNewsTable, SearchNew> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchNewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
      'page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, status, page];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_news';
  @override
  VerificationContext validateIntegrity(Insertable<SearchNew> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchNew map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchNew(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      page: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page'])!,
    );
  }

  @override
  $SearchNewsTable createAlias(String alias) {
    return $SearchNewsTable(attachedDatabase, alias);
  }
}

class SearchNew extends DataClass implements Insertable<SearchNew> {
  final int id;
  final String status;
  final int page;
  const SearchNew({required this.id, required this.status, required this.page});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['status'] = Variable<String>(status);
    map['page'] = Variable<int>(page);
    return map;
  }

  SearchNewsCompanion toCompanion(bool nullToAbsent) {
    return SearchNewsCompanion(
      id: Value(id),
      status: Value(status),
      page: Value(page),
    );
  }

  factory SearchNew.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchNew(
      id: serializer.fromJson<int>(json['id']),
      status: serializer.fromJson<String>(json['status']),
      page: serializer.fromJson<int>(json['page']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'status': serializer.toJson<String>(status),
      'page': serializer.toJson<int>(page),
    };
  }

  SearchNew copyWith({int? id, String? status, int? page}) => SearchNew(
        id: id ?? this.id,
        status: status ?? this.status,
        page: page ?? this.page,
      );
  @override
  String toString() {
    return (StringBuffer('SearchNew(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('page: $page')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, status, page);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchNew &&
          other.id == this.id &&
          other.status == this.status &&
          other.page == this.page);
}

class SearchNewsCompanion extends UpdateCompanion<SearchNew> {
  final Value<int> id;
  final Value<String> status;
  final Value<int> page;
  const SearchNewsCompanion({
    this.id = const Value.absent(),
    this.status = const Value.absent(),
    this.page = const Value.absent(),
  });
  SearchNewsCompanion.insert({
    this.id = const Value.absent(),
    required String status,
    required int page,
  })  : status = Value(status),
        page = Value(page);
  static Insertable<SearchNew> custom({
    Expression<int>? id,
    Expression<String>? status,
    Expression<int>? page,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (status != null) 'status': status,
      if (page != null) 'page': page,
    });
  }

  SearchNewsCompanion copyWith(
      {Value<int>? id, Value<String>? status, Value<int>? page}) {
    return SearchNewsCompanion(
      id: id ?? this.id,
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchNewsCompanion(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('page: $page')
          ..write(')'))
        .toString();
  }
}

class $NewsTable extends News with TableInfo<$NewsTable, New> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
      'news_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> category =
      GeneratedColumn<String>('category', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($NewsTable.$convertercategory);
  static const VerificationMeta _publishedMeta =
      const VerificationMeta('published');
  @override
  late final GeneratedColumn<String> published = GeneratedColumn<String>(
      'published', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _searchNewsIdMeta =
      const VerificationMeta('searchNewsId');
  @override
  late final GeneratedColumn<int> searchNewsId = GeneratedColumn<int>(
      'search_news_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES search_news (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        newsId,
        title,
        description,
        url,
        author,
        image,
        language,
        category,
        published,
        searchNewsId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news';
  @override
  VerificationContext validateIntegrity(Insertable<New> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('news_id')) {
      context.handle(_newsIdMeta,
          newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta));
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    context.handle(_categoryMeta, const VerificationResult.success());
    if (data.containsKey('published')) {
      context.handle(_publishedMeta,
          published.isAcceptableOrUnknown(data['published']!, _publishedMeta));
    } else if (isInserting) {
      context.missing(_publishedMeta);
    }
    if (data.containsKey('search_news_id')) {
      context.handle(
          _searchNewsIdMeta,
          searchNewsId.isAcceptableOrUnknown(
              data['search_news_id']!, _searchNewsIdMeta));
    } else if (isInserting) {
      context.missing(_searchNewsIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  New map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return New(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      newsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}news_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      category: $NewsTable.$convertercategory.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!),
      published: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}published'])!,
      searchNewsId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}search_news_id'])!,
    );
  }

  @override
  $NewsTable createAlias(String alias) {
    return $NewsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertercategory =
      StringListTypeConverter();
}

class New extends DataClass implements Insertable<New> {
  final int id;
  final String newsId;
  final String title;
  final String description;
  final String url;
  final String author;
  final String image;
  final String language;
  final List<String> category;
  final String published;
  final int searchNewsId;
  const New(
      {required this.id,
      required this.newsId,
      required this.title,
      required this.description,
      required this.url,
      required this.author,
      required this.image,
      required this.language,
      required this.category,
      required this.published,
      required this.searchNewsId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['news_id'] = Variable<String>(newsId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['url'] = Variable<String>(url);
    map['author'] = Variable<String>(author);
    map['image'] = Variable<String>(image);
    map['language'] = Variable<String>(language);
    {
      map['category'] =
          Variable<String>($NewsTable.$convertercategory.toSql(category));
    }
    map['published'] = Variable<String>(published);
    map['search_news_id'] = Variable<int>(searchNewsId);
    return map;
  }

  NewsCompanion toCompanion(bool nullToAbsent) {
    return NewsCompanion(
      id: Value(id),
      newsId: Value(newsId),
      title: Value(title),
      description: Value(description),
      url: Value(url),
      author: Value(author),
      image: Value(image),
      language: Value(language),
      category: Value(category),
      published: Value(published),
      searchNewsId: Value(searchNewsId),
    );
  }

  factory New.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return New(
      id: serializer.fromJson<int>(json['id']),
      newsId: serializer.fromJson<String>(json['newsId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      url: serializer.fromJson<String>(json['url']),
      author: serializer.fromJson<String>(json['author']),
      image: serializer.fromJson<String>(json['image']),
      language: serializer.fromJson<String>(json['language']),
      category: serializer.fromJson<List<String>>(json['category']),
      published: serializer.fromJson<String>(json['published']),
      searchNewsId: serializer.fromJson<int>(json['searchNewsId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'newsId': serializer.toJson<String>(newsId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'url': serializer.toJson<String>(url),
      'author': serializer.toJson<String>(author),
      'image': serializer.toJson<String>(image),
      'language': serializer.toJson<String>(language),
      'category': serializer.toJson<List<String>>(category),
      'published': serializer.toJson<String>(published),
      'searchNewsId': serializer.toJson<int>(searchNewsId),
    };
  }

  New copyWith(
          {int? id,
          String? newsId,
          String? title,
          String? description,
          String? url,
          String? author,
          String? image,
          String? language,
          List<String>? category,
          String? published,
          int? searchNewsId}) =>
      New(
        id: id ?? this.id,
        newsId: newsId ?? this.newsId,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        author: author ?? this.author,
        image: image ?? this.image,
        language: language ?? this.language,
        category: category ?? this.category,
        published: published ?? this.published,
        searchNewsId: searchNewsId ?? this.searchNewsId,
      );
  @override
  String toString() {
    return (StringBuffer('New(')
          ..write('id: $id, ')
          ..write('newsId: $newsId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('author: $author, ')
          ..write('image: $image, ')
          ..write('language: $language, ')
          ..write('category: $category, ')
          ..write('published: $published, ')
          ..write('searchNewsId: $searchNewsId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, newsId, title, description, url, author,
      image, language, category, published, searchNewsId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is New &&
          other.id == this.id &&
          other.newsId == this.newsId &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.author == this.author &&
          other.image == this.image &&
          other.language == this.language &&
          other.category == this.category &&
          other.published == this.published &&
          other.searchNewsId == this.searchNewsId);
}

class NewsCompanion extends UpdateCompanion<New> {
  final Value<int> id;
  final Value<String> newsId;
  final Value<String> title;
  final Value<String> description;
  final Value<String> url;
  final Value<String> author;
  final Value<String> image;
  final Value<String> language;
  final Value<List<String>> category;
  final Value<String> published;
  final Value<int> searchNewsId;
  const NewsCompanion({
    this.id = const Value.absent(),
    this.newsId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.author = const Value.absent(),
    this.image = const Value.absent(),
    this.language = const Value.absent(),
    this.category = const Value.absent(),
    this.published = const Value.absent(),
    this.searchNewsId = const Value.absent(),
  });
  NewsCompanion.insert({
    this.id = const Value.absent(),
    required String newsId,
    required String title,
    required String description,
    required String url,
    required String author,
    required String image,
    required String language,
    required List<String> category,
    required String published,
    required int searchNewsId,
  })  : newsId = Value(newsId),
        title = Value(title),
        description = Value(description),
        url = Value(url),
        author = Value(author),
        image = Value(image),
        language = Value(language),
        category = Value(category),
        published = Value(published),
        searchNewsId = Value(searchNewsId);
  static Insertable<New> custom({
    Expression<int>? id,
    Expression<String>? newsId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? author,
    Expression<String>? image,
    Expression<String>? language,
    Expression<String>? category,
    Expression<String>? published,
    Expression<int>? searchNewsId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (newsId != null) 'news_id': newsId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (author != null) 'author': author,
      if (image != null) 'image': image,
      if (language != null) 'language': language,
      if (category != null) 'category': category,
      if (published != null) 'published': published,
      if (searchNewsId != null) 'search_news_id': searchNewsId,
    });
  }

  NewsCompanion copyWith(
      {Value<int>? id,
      Value<String>? newsId,
      Value<String>? title,
      Value<String>? description,
      Value<String>? url,
      Value<String>? author,
      Value<String>? image,
      Value<String>? language,
      Value<List<String>>? category,
      Value<String>? published,
      Value<int>? searchNewsId}) {
    return NewsCompanion(
      id: id ?? this.id,
      newsId: newsId ?? this.newsId,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      author: author ?? this.author,
      image: image ?? this.image,
      language: language ?? this.language,
      category: category ?? this.category,
      published: published ?? this.published,
      searchNewsId: searchNewsId ?? this.searchNewsId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (newsId.present) {
      map['news_id'] = Variable<String>(newsId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (category.present) {
      map['category'] =
          Variable<String>($NewsTable.$convertercategory.toSql(category.value));
    }
    if (published.present) {
      map['published'] = Variable<String>(published.value);
    }
    if (searchNewsId.present) {
      map['search_news_id'] = Variable<int>(searchNewsId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsCompanion(')
          ..write('id: $id, ')
          ..write('newsId: $newsId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('author: $author, ')
          ..write('image: $image, ')
          ..write('language: $language, ')
          ..write('category: $category, ')
          ..write('published: $published, ')
          ..write('searchNewsId: $searchNewsId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $SearchNewsTable searchNews = $SearchNewsTable(this);
  late final $NewsTable news = $NewsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [searchNews, news];
}
