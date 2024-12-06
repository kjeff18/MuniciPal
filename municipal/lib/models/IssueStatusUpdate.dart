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

/** This is an auto generated class representing the IssueStatusUpdate type in your schema. */
class IssueStatusUpdate extends amplify_core.Model {
  static const classType = const _IssueStatusUpdateModelType();
  final String id;
  final String? _issueId;
  final IssueCategory? _issueCategory;
  final String? _issueImageUrl;
  final IssueStatus? _status;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  IssueStatusUpdateModelIdentifier get modelIdentifier {
    return IssueStatusUpdateModelIdentifier(id: id);
  }

  String get issueId {
    try {
      return _issueId!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  IssueCategory get issueCategory {
    try {
      return _issueCategory!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get issueImageUrl {
    try {
      return _issueImageUrl!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  IssueStatus get status {
    try {
      return _status!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const IssueStatusUpdate._internal(
      {required this.id,
      required issueId,
      required issueCategory,
      required issueImageUrl,
      required status,
      createdAt,
      updatedAt})
      : _issueId = issueId,
        _issueCategory = issueCategory,
        _issueImageUrl = issueImageUrl,
        _status = status,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory IssueStatusUpdate(
      {String? id,
      required String issueId,
      required IssueCategory issueCategory,
      required String issueImageUrl,
      required IssueStatus status}) {
    return IssueStatusUpdate._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        issueId: issueId,
        issueCategory: issueCategory,
        issueImageUrl: issueImageUrl,
        status: status);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IssueStatusUpdate &&
        id == other.id &&
        _issueId == other._issueId &&
        _issueCategory == other._issueCategory &&
        _issueImageUrl == other._issueImageUrl &&
        _status == other._status;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("IssueStatusUpdate {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("issueId=" + "$_issueId" + ", ");
    buffer.write("issueCategory=" +
        (_issueCategory != null
            ? amplify_core.enumToString(_issueCategory)!
            : "null") +
        ", ");
    buffer.write("issueImageUrl=" + "$_issueImageUrl" + ", ");
    buffer.write("status=" +
        (_status != null ? amplify_core.enumToString(_status)! : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  IssueStatusUpdate copyWith(
      {String? issueId,
      IssueCategory? issueCategory,
      String? issueImageUrl,
      IssueStatus? status}) {
    return IssueStatusUpdate._internal(
        id: id,
        issueId: issueId ?? this.issueId,
        issueCategory: issueCategory ?? this.issueCategory,
        issueImageUrl: issueImageUrl ?? this.issueImageUrl,
        status: status ?? this.status);
  }

  IssueStatusUpdate copyWithModelFieldValues(
      {ModelFieldValue<String>? issueId,
      ModelFieldValue<IssueCategory>? issueCategory,
      ModelFieldValue<String>? issueImageUrl,
      ModelFieldValue<IssueStatus>? status}) {
    return IssueStatusUpdate._internal(
        id: id,
        issueId: issueId == null ? this.issueId : issueId.value,
        issueCategory:
            issueCategory == null ? this.issueCategory : issueCategory.value,
        issueImageUrl:
            issueImageUrl == null ? this.issueImageUrl : issueImageUrl.value,
        status: status == null ? this.status : status.value);
  }

  IssueStatusUpdate.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _issueId = json['issueId'],
        _issueCategory = amplify_core.enumFromString<IssueCategory>(
            json['issueCategory'], IssueCategory.values),
        _issueImageUrl = json['issueImageUrl'],
        _status = amplify_core.enumFromString<IssueStatus>(
            json['status'], IssueStatus.values),
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'issueId': _issueId,
        'issueCategory': amplify_core.enumToString(_issueCategory),
        'issueImageUrl': _issueImageUrl,
        'status': amplify_core.enumToString(_status),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'issueId': _issueId,
        'issueCategory': _issueCategory,
        'issueImageUrl': _issueImageUrl,
        'status': _status,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core
      .QueryModelIdentifier<IssueStatusUpdateModelIdentifier> MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<IssueStatusUpdateModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ISSUEID = amplify_core.QueryField(fieldName: "issueId");
  static final ISSUECATEGORY =
      amplify_core.QueryField(fieldName: "issueCategory");
  static final ISSUEIMAGEURL =
      amplify_core.QueryField(fieldName: "issueImageUrl");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "IssueStatusUpdate";
    modelSchemaDefinition.pluralName = "IssueStatusUpdates";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.GROUPS,
          groupClaim: "cognito:groups",
          groups: ["Government", "Contractor", "Citizen"],
          provider: amplify_core.AuthRuleProvider.USERPOOLS,
          operations: const [
            amplify_core.ModelOperation.CREATE,
            amplify_core.ModelOperation.READ,
            amplify_core.ModelOperation.UPDATE
          ]),
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.PUBLIC,
          provider: amplify_core.AuthRuleProvider.APIKEY,
          operations: const [
            amplify_core.ModelOperation.CREATE,
            amplify_core.ModelOperation.READ,
            amplify_core.ModelOperation.UPDATE,
            amplify_core.ModelOperation.DELETE
          ])
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: IssueStatusUpdate.ISSUEID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: IssueStatusUpdate.ISSUECATEGORY,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: IssueStatusUpdate.ISSUEIMAGEURL,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: IssueStatusUpdate.STATUS,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'createdAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'updatedAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));
  });
}

class _IssueStatusUpdateModelType
    extends amplify_core.ModelType<IssueStatusUpdate> {
  const _IssueStatusUpdateModelType();

  @override
  IssueStatusUpdate fromJson(Map<String, dynamic> jsonData) {
    return IssueStatusUpdate.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'IssueStatusUpdate';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [IssueStatusUpdate] in your schema.
 */
class IssueStatusUpdateModelIdentifier
    implements amplify_core.ModelIdentifier<IssueStatusUpdate> {
  final String id;

  /** Create an instance of IssueStatusUpdateModelIdentifier using [id] the primary key. */
  const IssueStatusUpdateModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'IssueStatusUpdateModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is IssueStatusUpdateModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
