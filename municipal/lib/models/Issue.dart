/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Issue type in your schema. */
class Issue extends amplify_core.Model {
  static const classType = const _IssueModelType();
  final String id;
  final String? _citizenId;
  final String? _description;
  final List<String>? _imageUrls;
  final IssueCategory? _category;
  final double? _latitude;
  final double? _longitude;
  final String? _geoHash;
  final IssueStatus? _status;
  final String? _progress;
  final int? _upvotes;
  final List<Report>? _reports;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  IssueModelIdentifier get modelIdentifier {
      return IssueModelIdentifier(
        id: id
      );
  }
  
  String get citizenId {
    try {
      return _citizenId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get imageUrls {
    return _imageUrls;
  }
  
  IssueCategory? get category {
    return _category;
  }
  
  double get latitude {
    try {
      return _latitude!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get longitude {
    try {
      return _longitude!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get geoHash {
    try {
      return _geoHash!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  IssueStatus get status {
    try {
      return _status!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get progress {
    return _progress;
  }
  
  int get upvotes {
    try {
      return _upvotes!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Report>? get reports {
    return _reports;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Issue._internal({required this.id, required citizenId, required description, imageUrls, category, required latitude, required longitude, required geoHash, required status, progress, required upvotes, reports, createdAt, updatedAt}): _citizenId = citizenId, _description = description, _imageUrls = imageUrls, _category = category, _latitude = latitude, _longitude = longitude, _geoHash = geoHash, _status = status, _progress = progress, _upvotes = upvotes, _reports = reports, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Issue({String? id, required String citizenId, required String description, List<String>? imageUrls, IssueCategory? category, required double latitude, required double longitude, required String geoHash, required IssueStatus status, String? progress, required int upvotes, List<Report>? reports}) {
    return Issue._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      citizenId: citizenId,
      description: description,
      imageUrls: imageUrls != null ? List<String>.unmodifiable(imageUrls) : imageUrls,
      category: category,
      latitude: latitude,
      longitude: longitude,
      geoHash: geoHash,
      status: status,
      progress: progress,
      upvotes: upvotes,
      reports: reports != null ? List<Report>.unmodifiable(reports) : reports);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Issue &&
      id == other.id &&
      _citizenId == other._citizenId &&
      _description == other._description &&
      DeepCollectionEquality().equals(_imageUrls, other._imageUrls) &&
      _category == other._category &&
      _latitude == other._latitude &&
      _longitude == other._longitude &&
      _geoHash == other._geoHash &&
      _status == other._status &&
      _progress == other._progress &&
      _upvotes == other._upvotes &&
      DeepCollectionEquality().equals(_reports, other._reports);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Issue {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("citizenId=" + "$_citizenId" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("imageUrls=" + (_imageUrls != null ? _imageUrls!.toString() : "null") + ", ");
    buffer.write("category=" + (_category != null ? amplify_core.enumToString(_category)! : "null") + ", ");
    buffer.write("latitude=" + (_latitude != null ? _latitude!.toString() : "null") + ", ");
    buffer.write("longitude=" + (_longitude != null ? _longitude!.toString() : "null") + ", ");
    buffer.write("geoHash=" + "$_geoHash" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("progress=" + "$_progress" + ", ");
    buffer.write("upvotes=" + (_upvotes != null ? _upvotes!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Issue copyWith({String? citizenId, String? description, List<String>? imageUrls, IssueCategory? category, double? latitude, double? longitude, String? geoHash, IssueStatus? status, String? progress, int? upvotes, List<Report>? reports}) {
    return Issue._internal(
      id: id,
      citizenId: citizenId ?? this.citizenId,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      category: category ?? this.category,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      geoHash: geoHash ?? this.geoHash,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      upvotes: upvotes ?? this.upvotes,
      reports: reports ?? this.reports);
  }
  
  Issue copyWithModelFieldValues({
    ModelFieldValue<String>? citizenId,
    ModelFieldValue<String>? description,
    ModelFieldValue<List<String>?>? imageUrls,
    ModelFieldValue<IssueCategory?>? category,
    ModelFieldValue<double>? latitude,
    ModelFieldValue<double>? longitude,
    ModelFieldValue<String>? geoHash,
    ModelFieldValue<IssueStatus>? status,
    ModelFieldValue<String?>? progress,
    ModelFieldValue<int>? upvotes,
    ModelFieldValue<List<Report>?>? reports
  }) {
    return Issue._internal(
      id: id,
      citizenId: citizenId == null ? this.citizenId : citizenId.value,
      description: description == null ? this.description : description.value,
      imageUrls: imageUrls == null ? this.imageUrls : imageUrls.value,
      category: category == null ? this.category : category.value,
      latitude: latitude == null ? this.latitude : latitude.value,
      longitude: longitude == null ? this.longitude : longitude.value,
      geoHash: geoHash == null ? this.geoHash : geoHash.value,
      status: status == null ? this.status : status.value,
      progress: progress == null ? this.progress : progress.value,
      upvotes: upvotes == null ? this.upvotes : upvotes.value,
      reports: reports == null ? this.reports : reports.value
    );
  }
  
  Issue.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _citizenId = json['citizenId'],
      _description = json['description'],
      _imageUrls = json['imageUrls']?.cast<String>(),
      _category = amplify_core.enumFromString<IssueCategory>(json['category'], IssueCategory.values),
      _latitude = (json['latitude'] as num?)?.toDouble(),
      _longitude = (json['longitude'] as num?)?.toDouble(),
      _geoHash = json['geoHash'],
      _status = amplify_core.enumFromString<IssueStatus>(json['status'], IssueStatus.values),
      _progress = json['progress'],
      _upvotes = (json['upvotes'] as num?)?.toInt(),
      _reports = json['reports']  is Map
        ? (json['reports']['items'] is List
          ? (json['reports']['items'] as List)
              .where((e) => e != null)
              .map((e) => Report.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['reports'] is List
          ? (json['reports'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Report.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'citizenId': _citizenId, 'description': _description, 'imageUrls': _imageUrls, 'category': amplify_core.enumToString(_category), 'latitude': _latitude, 'longitude': _longitude, 'geoHash': _geoHash, 'status': amplify_core.enumToString(_status), 'progress': _progress, 'upvotes': _upvotes, 'reports': _reports?.map((Report? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'citizenId': _citizenId,
    'description': _description,
    'imageUrls': _imageUrls,
    'category': _category,
    'latitude': _latitude,
    'longitude': _longitude,
    'geoHash': _geoHash,
    'status': _status,
    'progress': _progress,
    'upvotes': _upvotes,
    'reports': _reports,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<IssueModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<IssueModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CITIZENID = amplify_core.QueryField(fieldName: "citizenId");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final IMAGEURLS = amplify_core.QueryField(fieldName: "imageUrls");
  static final CATEGORY = amplify_core.QueryField(fieldName: "category");
  static final LATITUDE = amplify_core.QueryField(fieldName: "latitude");
  static final LONGITUDE = amplify_core.QueryField(fieldName: "longitude");
  static final GEOHASH = amplify_core.QueryField(fieldName: "geoHash");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final PROGRESS = amplify_core.QueryField(fieldName: "progress");
  static final UPVOTES = amplify_core.QueryField(fieldName: "upvotes");
  static final REPORTS = amplify_core.QueryField(
    fieldName: "reports",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Report'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Issue";
    modelSchemaDefinition.pluralName = "Issues";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Citizen" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Contractor`", "Government" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        provider: amplify_core.AuthRuleProvider.APIKEY,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["id"], name: null),
      amplify_core.ModelIndex(fields: const ["geoHash", "category"], name: "byGeoHashCategory")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.CITIZENID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.DESCRIPTION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.IMAGEURLS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.CATEGORY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.LATITUDE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.LONGITUDE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.GEOHASH,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.PROGRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Issue.UPVOTES,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Issue.REPORTS,
      isRequired: false,
      ofModelName: 'Report',
      associatedKey: Report.ISSUEID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _IssueModelType extends amplify_core.ModelType<Issue> {
  const _IssueModelType();
  
  @override
  Issue fromJson(Map<String, dynamic> jsonData) {
    return Issue.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Issue';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Issue] in your schema.
 */
class IssueModelIdentifier implements amplify_core.ModelIdentifier<Issue> {
  final String id;

  /** Create an instance of IssueModelIdentifier using [id] the primary key. */
  const IssueModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'IssueModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is IssueModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}