// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordObject.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWordObjectCollection on Isar {
  IsarCollection<WordObject> get wordObjects => this.collection();
}

const WordObjectSchema = CollectionSchema(
  name: r'WordObject',
  id: 8451125353585486498,
  properties: {
    r'blockId': PropertySchema(
      id: 0,
      name: r'blockId',
      type: IsarType.long,
    ),
    r'infoJson': PropertySchema(
      id: 1,
      name: r'infoJson',
      type: IsarType.string,
    ),
    r'originalText': PropertySchema(
      id: 2,
      name: r'originalText',
      type: IsarType.string,
    ),
    r'translatedLanguageId': PropertySchema(
      id: 3,
      name: r'translatedLanguageId',
      type: IsarType.long,
    ),
    r'translatedText': PropertySchema(
      id: 4,
      name: r'translatedText',
      type: IsarType.string,
    )
  },
  estimateSize: _wordObjectEstimateSize,
  serialize: _wordObjectSerialize,
  deserialize: _wordObjectDeserialize,
  deserializeProp: _wordObjectDeserializeProp,
  idName: r'id',
  indexes: {
    r'blockId': IndexSchema(
      id: -413886092950911832,
      name: r'blockId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'blockId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _wordObjectGetId,
  getLinks: _wordObjectGetLinks,
  attach: _wordObjectAttach,
  version: '3.1.0+1',
);

int _wordObjectEstimateSize(
  WordObject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.infoJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.originalText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.translatedText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _wordObjectSerialize(
  WordObject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.blockId);
  writer.writeString(offsets[1], object.infoJson);
  writer.writeString(offsets[2], object.originalText);
  writer.writeLong(offsets[3], object.translatedLanguageId);
  writer.writeString(offsets[4], object.translatedText);
}

WordObject _wordObjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WordObject();
  object.blockId = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.infoJson = reader.readStringOrNull(offsets[1]);
  object.originalText = reader.readStringOrNull(offsets[2]);
  object.translatedLanguageId = reader.readLongOrNull(offsets[3]);
  object.translatedText = reader.readStringOrNull(offsets[4]);
  return object;
}

P _wordObjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wordObjectGetId(WordObject object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wordObjectGetLinks(WordObject object) {
  return [];
}

void _wordObjectAttach(IsarCollection<dynamic> col, Id id, WordObject object) {
  object.id = id;
}

extension WordObjectQueryWhereSort
    on QueryBuilder<WordObject, WordObject, QWhere> {
  QueryBuilder<WordObject, WordObject, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhere> anyBlockId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'blockId'),
      );
    });
  }
}

extension WordObjectQueryWhere
    on QueryBuilder<WordObject, WordObject, QWhereClause> {
  QueryBuilder<WordObject, WordObject, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> idBetween(
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

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> blockIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'blockId',
        value: [null],
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> blockIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> blockIdEqualTo(
      int? blockId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'blockId',
        value: [blockId],
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> blockIdNotEqualTo(
      int? blockId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockId',
              lower: [],
              upper: [blockId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockId',
              lower: [blockId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockId',
              lower: [blockId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'blockId',
              lower: [],
              upper: [blockId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> blockIdGreaterThan(
    int? blockId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockId',
        lower: [blockId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> blockIdLessThan(
    int? blockId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockId',
        lower: [],
        upper: [blockId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterWhereClause> blockIdBetween(
    int? lowerBlockId,
    int? upperBlockId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'blockId',
        lower: [lowerBlockId],
        includeLower: includeLower,
        upper: [upperBlockId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WordObjectQueryFilter
    on QueryBuilder<WordObject, WordObject, QFilterCondition> {
  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> blockIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blockId',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      blockIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blockId',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> blockIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockId',
        value: value,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      blockIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockId',
        value: value,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> blockIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockId',
        value: value,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> blockIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> infoJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'infoJson',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      infoJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'infoJson',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> infoJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      infoJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> infoJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> infoJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infoJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      infoJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'infoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> infoJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'infoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> infoJsonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'infoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition> infoJsonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'infoJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      infoJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      infoJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'infoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalText',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalText',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalText',
        value: '',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      originalTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalText',
        value: '',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedLanguageIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translatedLanguageId',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedLanguageIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translatedLanguageId',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedLanguageIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedLanguageId',
        value: value,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedLanguageIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'translatedLanguageId',
        value: value,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedLanguageIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'translatedLanguageId',
        value: value,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedLanguageIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'translatedLanguageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translatedText',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translatedText',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'translatedText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'translatedText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedText',
        value: '',
      ));
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterFilterCondition>
      translatedTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'translatedText',
        value: '',
      ));
    });
  }
}

extension WordObjectQueryObject
    on QueryBuilder<WordObject, WordObject, QFilterCondition> {}

extension WordObjectQueryLinks
    on QueryBuilder<WordObject, WordObject, QFilterCondition> {}

extension WordObjectQuerySortBy
    on QueryBuilder<WordObject, WordObject, QSortBy> {
  QueryBuilder<WordObject, WordObject, QAfterSortBy> sortByBlockId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockId', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> sortByBlockIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockId', Sort.desc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> sortByInfoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoJson', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> sortByInfoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoJson', Sort.desc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> sortByOriginalText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> sortByOriginalTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.desc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy>
      sortByTranslatedLanguageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageId', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy>
      sortByTranslatedLanguageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageId', Sort.desc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> sortByTranslatedText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedText', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy>
      sortByTranslatedTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedText', Sort.desc);
    });
  }
}

extension WordObjectQuerySortThenBy
    on QueryBuilder<WordObject, WordObject, QSortThenBy> {
  QueryBuilder<WordObject, WordObject, QAfterSortBy> thenByBlockId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockId', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> thenByBlockIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockId', Sort.desc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> thenByInfoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoJson', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> thenByInfoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoJson', Sort.desc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> thenByOriginalText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> thenByOriginalTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.desc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy>
      thenByTranslatedLanguageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageId', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy>
      thenByTranslatedLanguageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedLanguageId', Sort.desc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy> thenByTranslatedText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedText', Sort.asc);
    });
  }

  QueryBuilder<WordObject, WordObject, QAfterSortBy>
      thenByTranslatedTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedText', Sort.desc);
    });
  }
}

extension WordObjectQueryWhereDistinct
    on QueryBuilder<WordObject, WordObject, QDistinct> {
  QueryBuilder<WordObject, WordObject, QDistinct> distinctByBlockId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockId');
    });
  }

  QueryBuilder<WordObject, WordObject, QDistinct> distinctByInfoJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infoJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WordObject, WordObject, QDistinct> distinctByOriginalText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WordObject, WordObject, QDistinct>
      distinctByTranslatedLanguageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translatedLanguageId');
    });
  }

  QueryBuilder<WordObject, WordObject, QDistinct> distinctByTranslatedText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translatedText',
          caseSensitive: caseSensitive);
    });
  }
}

extension WordObjectQueryProperty
    on QueryBuilder<WordObject, WordObject, QQueryProperty> {
  QueryBuilder<WordObject, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WordObject, int?, QQueryOperations> blockIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockId');
    });
  }

  QueryBuilder<WordObject, String?, QQueryOperations> infoJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infoJson');
    });
  }

  QueryBuilder<WordObject, String?, QQueryOperations> originalTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalText');
    });
  }

  QueryBuilder<WordObject, int?, QQueryOperations>
      translatedLanguageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translatedLanguageId');
    });
  }

  QueryBuilder<WordObject, String?, QQueryOperations> translatedTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translatedText');
    });
  }
}
