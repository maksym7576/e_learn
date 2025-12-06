// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userObject.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserObjectCollection on Isar {
  IsarCollection<UserObject> get userObjects => this.collection();
}

const UserObjectSchema = CollectionSchema(
  name: r'UserObject',
  id: 1782555985646250323,
  properties: {
    r'userLanguageId': PropertySchema(
      id: 0,
      name: r'userLanguageId',
      type: IsarType.long,
    )
  },
  estimateSize: _userObjectEstimateSize,
  serialize: _userObjectSerialize,
  deserialize: _userObjectDeserialize,
  deserializeProp: _userObjectDeserializeProp,
  idName: r'id',
  indexes: {
    r'userLanguageId': IndexSchema(
      id: -1643377294590950439,
      name: r'userLanguageId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userLanguageId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _userObjectGetId,
  getLinks: _userObjectGetLinks,
  attach: _userObjectAttach,
  version: '3.1.0+1',
);

int _userObjectEstimateSize(
  UserObject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _userObjectSerialize(
  UserObject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.userLanguageId);
}

UserObject _userObjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserObject();
  object.id = id;
  object.userLanguageId = reader.readLongOrNull(offsets[0]);
  return object;
}

P _userObjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userObjectGetId(UserObject object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userObjectGetLinks(UserObject object) {
  return [];
}

void _userObjectAttach(IsarCollection<dynamic> col, Id id, UserObject object) {
  object.id = id;
}

extension UserObjectQueryWhereSort
    on QueryBuilder<UserObject, UserObject, QWhere> {
  QueryBuilder<UserObject, UserObject, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhere> anyUserLanguageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userLanguageId'),
      );
    });
  }
}

extension UserObjectQueryWhere
    on QueryBuilder<UserObject, UserObject, QWhereClause> {
  QueryBuilder<UserObject, UserObject, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause>
      userLanguageIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userLanguageId',
        value: [null],
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause>
      userLanguageIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userLanguageId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause> userLanguageIdEqualTo(
      int? userLanguageId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userLanguageId',
        value: [userLanguageId],
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause>
      userLanguageIdNotEqualTo(int? userLanguageId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userLanguageId',
              lower: [],
              upper: [userLanguageId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userLanguageId',
              lower: [userLanguageId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userLanguageId',
              lower: [userLanguageId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userLanguageId',
              lower: [],
              upper: [userLanguageId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause>
      userLanguageIdGreaterThan(
    int? userLanguageId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userLanguageId',
        lower: [userLanguageId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause>
      userLanguageIdLessThan(
    int? userLanguageId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userLanguageId',
        lower: [],
        upper: [userLanguageId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterWhereClause> userLanguageIdBetween(
    int? lowerUserLanguageId,
    int? upperUserLanguageId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userLanguageId',
        lower: [lowerUserLanguageId],
        includeLower: includeLower,
        upper: [upperUserLanguageId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserObjectQueryFilter
    on QueryBuilder<UserObject, UserObject, QFilterCondition> {
  QueryBuilder<UserObject, UserObject, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterFilterCondition>
      userLanguageIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userLanguageId',
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterFilterCondition>
      userLanguageIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userLanguageId',
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterFilterCondition>
      userLanguageIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userLanguageId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterFilterCondition>
      userLanguageIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userLanguageId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterFilterCondition>
      userLanguageIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userLanguageId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterFilterCondition>
      userLanguageIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userLanguageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserObjectQueryObject
    on QueryBuilder<UserObject, UserObject, QFilterCondition> {}

extension UserObjectQueryLinks
    on QueryBuilder<UserObject, UserObject, QFilterCondition> {}

extension UserObjectQuerySortBy
    on QueryBuilder<UserObject, UserObject, QSortBy> {
  QueryBuilder<UserObject, UserObject, QAfterSortBy> sortByUserLanguageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLanguageId', Sort.asc);
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterSortBy>
      sortByUserLanguageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLanguageId', Sort.desc);
    });
  }
}

extension UserObjectQuerySortThenBy
    on QueryBuilder<UserObject, UserObject, QSortThenBy> {
  QueryBuilder<UserObject, UserObject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterSortBy> thenByUserLanguageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLanguageId', Sort.asc);
    });
  }

  QueryBuilder<UserObject, UserObject, QAfterSortBy>
      thenByUserLanguageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userLanguageId', Sort.desc);
    });
  }
}

extension UserObjectQueryWhereDistinct
    on QueryBuilder<UserObject, UserObject, QDistinct> {
  QueryBuilder<UserObject, UserObject, QDistinct> distinctByUserLanguageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userLanguageId');
    });
  }
}

extension UserObjectQueryProperty
    on QueryBuilder<UserObject, UserObject, QQueryProperty> {
  QueryBuilder<UserObject, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserObject, int?, QQueryOperations> userLanguageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userLanguageId');
    });
  }
}
