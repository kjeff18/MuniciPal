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


/** This is an auto generated class representing the ContractorSubscription type in your schema. */
class ContractorSubscription extends amplify_core.Model {
  static const classType = const _ContractorSubscriptionModelType();
  final String id;
  final String? _contractorId;
  final List<IssueCategory>? _categories;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ContractorSubscriptionModelIdentifier get modelIdentifier {
      return ContractorSubscriptionModelIdentifier(
        id: id
      );
  }
  
  String get contractorId {
    try {
      return _contractorId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<IssueCategory> get categories {
    try {
      return _categories!;
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
  
  const ContractorSubscription._internal({required this.id, required contractorId, required categories, createdAt, updatedAt}): _contractorId = contractorId, _categories = categories, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ContractorSubscription({String? id, required String contractorId, required List<IssueCategory> categories}) {
    return ContractorSubscription._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      contractorId: contractorId,
      categories: categories != null ? List<IssueCategory>.unmodifiable(categories) : categories);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContractorSubscription &&
      id == other.id &&
      _contractorId == other._contractorId &&
      DeepCollectionEquality().equals(_categories, other._categories);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ContractorSubscription {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("contractorId=" + "$_contractorId" + ", ");
    buffer.write("categories=" + (_categories != null ? _categories!.map((e) => amplify_core.enumToString(e)).toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ContractorSubscription copyWith({String? contractorId, List<IssueCategory>? categories}) {
    return ContractorSubscription._internal(
      id: id,
      contractorId: contractorId ?? this.contractorId,
      categories: categories ?? this.categories);
  }
  
  ContractorSubscription copyWithModelFieldValues({
    ModelFieldValue<String>? contractorId,
    ModelFieldValue<List<IssueCategory>?>? categories
  }) {
    return ContractorSubscription._internal(
      id: id,
      contractorId: contractorId == null ? this.contractorId : contractorId.value,
      categories: categories == null ? this.categories : categories.value
    );
  }
  
  ContractorSubscription.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _contractorId = json['contractorId'],
      _categories = json['categories'] is List
        ? (json['categories'] as List)
          .map((e) => amplify_core.enumFromString<IssueCategory>(e, IssueCategory.values)!)
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'contractorId': _contractorId, 'categories': _categories?.map((e) => amplify_core.enumToString(e)).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'contractorId': _contractorId,
    'categories': _categories,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ContractorSubscriptionModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ContractorSubscriptionModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CONTRACTORID = amplify_core.QueryField(fieldName: "contractorId");
  static final CATEGORIES = amplify_core.QueryField(fieldName: "categories");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ContractorSubscription";
    modelSchemaDefinition.pluralName = "ContractorSubscriptions";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "contractorId",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ContractorSubscription.CONTRACTORID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ContractorSubscription.CATEGORIES,
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.enumeration.name)
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

class _ContractorSubscriptionModelType extends amplify_core.ModelType<ContractorSubscription> {
  const _ContractorSubscriptionModelType();
  
  @override
  ContractorSubscription fromJson(Map<String, dynamic> jsonData) {
    return ContractorSubscription.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ContractorSubscription';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ContractorSubscription] in your schema.
 */
class ContractorSubscriptionModelIdentifier implements amplify_core.ModelIdentifier<ContractorSubscription> {
  final String id;

  /** Create an instance of ContractorSubscriptionModelIdentifier using [id] the primary key. */
  const ContractorSubscriptionModelIdentifier({
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
  String toString() => 'ContractorSubscriptionModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ContractorSubscriptionModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}