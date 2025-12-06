// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blockObject.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBlockObjectCollection on Isar {
  IsarCollection<BlockObject> get blockObjects => this.collection();
}

const BlockObjectSchema = CollectionSchema(
  name: r'BlockObject',
  id: 5859615813996755603,
  properties: {
    r'endTime': PropertySchema(
      id: 0,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'originalLanguageLong': PropertySchema(
      id: 1,
      name: r'originalLanguageLong',
      type: IsarType.string,
    ),
    r'phraseId': PropertySchema(
      id: 2,
      name: r'phraseId',
      type: IsarType.long,
    ),
    r'startTime': PropertySchema(
      id: 3,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'translatedLanguageLong': PropertySchema(
      id: 4,
      name: r'translatedLanguageLong',
      type: IsarType.string,
    ),
    r'videoName': PropertySchema(
      id: 5,
      name: r'videoName',
      type: IsarType.string,
    )
  },
  estimateSize: _blockObjectEstimateSize,
  serialize: _blockObjectSerialize,
  deserialize: _blockObjectDeserialize,
  deserializeProp: _blockObjectDeserializeProp,
  idName: r'id',
  indexes: {
    r'phraseId': IndexSchema(
      id: -1936705100628921048,
      name: r'phraseId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'phraseId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _blockObjectGetId,
  getLinks: _blockObjectGetLinks,
  attach: _blockObjectAttach,
  version: '3.1.0+1',
);

int _blockObjectEstimateSize(
  BlockObject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.originalLanguageLong;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.translatedLanguageLong;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.videoName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _blockObjectSerialize(
  BlockObject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endTime);
  writer.writeString(offsets[1], object.originalLanguageLong);
  writer.writeLong(offsets[2], object.phraseId);
  writer.writeDateTime(offsets[3], object.startTime);
  writer.writeString(offsets[4], object.translatedLanguageLong);
  writer.writeString(offsets[5], object.videoName);
}

BlockObject _blockObjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BlockObject();
  object.endTime = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.originalLanguageLong = reader.readStringOrNull(offsets[1]);
  object.phraseId = reader.readLongOrNull(offsets[2]);
  object.startTime = reader.readDateTimeOrNull(offsets[3]);
  object.translatedLanguageLong = reader.readStringOrNull(offsets[4]);
  object.videoName = reader.readStringOrNull(offsets[5]);
  return object;
}

P _blockObjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _blockObjectGetId(BlockObject object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _blockObjectGetLinks(BlockObject object) {
  return [];
}

void _blockObjectAttach(
    IsarCollection<dynamic> col, Id id, BlockObject object) {
  object.id = id;
}

extension BlockObjectQueryWhereSort
    on QueryBuilder<BlockObject, BlockObject, QWhere> {
  QueryBuilder<BlockObject, BlockObject, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhere> anyPhraseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'phraseId'),
      );
    });
  }
}

extension BlockObjectQueryWhere
    on QueryBuilder<BlockObject, BlockObject, QWhereClause> {
  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> idBetween(
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

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> phraseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'phraseId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause>
      phraseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'phraseId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> phraseIdEqualTo(
      int? phraseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'phraseId',
        value: [phraseId],
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> phraseIdNotEqualTo(
      int? phraseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phraseId',
              lower: [],
              upper: [phraseId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phraseId',
              lower: [phraseId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phraseId',
              lower: [phraseId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phraseId',
              lower: [],
              upper: [phraseId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> phraseIdGreaterThan(
    int? phraseId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'phraseId',
        lower: [phraseId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> phraseIdLessThan(
    int? phraseId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'phraseId',
        lower: [],
        upper: [phraseId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterWhereClause> phraseIdBetween(
    int? lowerPhraseId,
    int? upperPhraseId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'phraseId',
        lower: [lowerPhraseId],
        includeLower: includeLower,
        upper: [upperPhraseId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BlockObjectQueryFilter
    on QueryBuilder<BlockObject, BlockObject, QFilterCondition> {
  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition> endTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition> endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition> endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalLanguageLong',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalLanguageLong',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalLanguageLong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalLanguageLong',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalLanguageLong',
        value: '',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      originalLanguageLongIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalLanguageLong',
        value: '',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      phraseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phraseId',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      phraseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phraseId',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition> phraseIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phraseId',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      phraseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phraseId',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      phraseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phraseId',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition> phraseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phraseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      startTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startTime',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      startTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startTime',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      startTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      startTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      startTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translatedLanguageLong',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translatedLanguageLong',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'translatedLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'translatedLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'translatedLanguageLong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'translatedLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'translatedLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'translatedLanguageLong',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'translatedLanguageLong',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedLanguageLong',
        value: '',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      translatedLanguageLongIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'translatedLanguageLong',
        value: '',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'videoName',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'videoName',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'videoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'videoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'videoName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'videoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'videoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'videoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'videoName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videoName',
        value: '',
      ));
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterFilterCondition>
      videoNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'videoName',
        value: '',
      ));
    });
  }
}

extension BlockObjectQueryObject
    on QueryBuilder<BlockObject, BlockObject, QFilterCondition> {}

extension BlockObjectQueryLinks
    on QueryBuilder<BlockObject, BlockObject, QFilterCondition> {}

extension BlockObjectQuerySortBy
    on QueryBuilder<BlockObject, BlockObject, QSortBy> {
  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy>
      sortByOriginalLanguageLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguageLong', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy>
      sortByOriginalLanguageLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguageLong', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> sortByPhraseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phraseId', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> sortByPhraseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phraseId', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy>
      sortByTranslatedLanguageLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageLong', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy>
      sortByTranslatedLanguageLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageLong', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> sortByVideoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoName', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> sortByVideoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoName', Sort.desc);
    });
  }
}

extension BlockObjectQuerySortThenBy
    on QueryBuilder<BlockObject, BlockObject, QSortThenBy> {
  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy>
      thenByOriginalLanguageLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguageLong', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy>
      thenByOriginalLanguageLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalLanguageLong', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenByPhraseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phraseId', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenByPhraseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phraseId', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy>
      thenByTranslatedLanguageLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageLong', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy>
      thenByTranslatedLanguageLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageLong', Sort.desc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenByVideoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoName', Sort.asc);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QAfterSortBy> thenByVideoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoName', Sort.desc);
    });
  }
}

extension BlockObjectQueryWhereDistinct
    on QueryBuilder<BlockObject, BlockObject, QDistinct> {
  QueryBuilder<BlockObject, BlockObject, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<BlockObject, BlockObject, QDistinct>
      distinctByOriginalLanguageLong({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalLanguageLong',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QDistinct> distinctByPhraseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phraseId');
    });
  }

  QueryBuilder<BlockObject, BlockObject, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<BlockObject, BlockObject, QDistinct>
      distinctByTranslatedLanguageLong({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translatedLanguageLong',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlockObject, BlockObject, QDistinct> distinctByVideoName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videoName', caseSensitive: caseSensitive);
    });
  }
}

extension BlockObjectQueryProperty
    on QueryBuilder<BlockObject, BlockObject, QQueryProperty> {
  QueryBuilder<BlockObject, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BlockObject, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<BlockObject, String?, QQueryOperations>
      originalLanguageLongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalLanguageLong');
    });
  }

  QueryBuilder<BlockObject, int?, QQueryOperations> phraseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phraseId');
    });
  }

  QueryBuilder<BlockObject, DateTime?, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<BlockObject, String?, QQueryOperations>
      translatedLanguageLongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translatedLanguageLong');
    });
  }

  QueryBuilder<BlockObject, String?, QQueryOperations> videoNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoName');
    });
  }
}
