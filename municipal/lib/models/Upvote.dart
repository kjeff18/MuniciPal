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


/** This is an auto generated class representing the Upvote type in your schema. */
class Upvote extends amplify_core.Model {
  static const classType = const _UpvoteModelType();
  final String id;
  final String? _citizenId;
  final String? _issueId;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UpvoteModelIdentifier get modelIdentifier {
      return UpvoteModelIdentifier(
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
  
  String get issueId {
    try {
      return _issueId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Upvote._internal({required this.id, required citizenId, required issueId, createdAt, updatedAt}): _citizenId = citizenId, _issueId = issueId, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Upvote({String? id, required String citizenId, required String issueId}) {
    return Upvote._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      citizenId: citizenId,
      issueId: issueId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Upvote &&
      id == other.id &&
      _citizenId == other._citizenId &&
      _issueId == other._issueId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Upvote {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("citizenId=" + "$_citizenId" + ", ");
    buffer.write("issueId=" + "$_issueId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Upvote copyWith({String? citizenId, String? issueId}) {
    return Upvote._internal(
      id: id,
      citizenId: citizenId ?? this.citizenId,
      issueId: issueId ?? this.issueId);
  }
  
  Upvote copyWithModelFieldValues({
    ModelFieldValue<String>? citizenId,
    ModelFieldValue<String>? issueId
  }) {
    return Upvote._internal(
      id: id,
      citizenId: citizenId == null ? this.citizenId : citizenId.value,
      issueId: issueId == null ? this.issueId : issueId.value
    );
  }
  
  Upvote.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _citizenId = json['citizenId'],
      _issueId = json['issueId'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'citizenId': _citizenId, 'issueId': _issueId, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'citizenId': _citizenId,
    'issueId': _issueId,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UpvoteModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UpvoteModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CITIZENID = amplify_core.QueryField(fieldName: "citizenId");
  static final ISSUEID = amplify_core.QueryField(fieldName: "issueId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Upvote";
    modelSchemaDefinition.pluralName = "Upvotes";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "citizenId",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.DELETE
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Government" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["citizenId"], name: "byCitizen"),
      amplify_core.ModelIndex(fields: const ["issueId"], name: "byIssue")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Upvote.CITIZENID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Upvote.ISSUEID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
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

class _UpvoteModelType extends amplify_core.ModelType<Upvote> {
  const _UpvoteModelType();
  
  @override
  Upvote fromJson(Map<String, dynamic> jsonData) {
    return Upvote.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Upvote';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Upvote] in your schema.
 */
class UpvoteModelIdentifier implements amplify_core.ModelIdentifier<Upvote> {
  final String id;

  /** Create an instance of UpvoteModelIdentifier using [id] the primary key. */
  const UpvoteModelIdentifier({
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
  String toString() => 'UpvoteModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UpvoteModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}