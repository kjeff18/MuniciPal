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


/** This is an auto generated class representing the GovernmentEntity type in your schema. */
class GovernmentEntity extends amplify_core.Model {
  static const classType = const _GovernmentEntityModelType();
  final String id;
  final String? _name;
  final String? _address;
  final List<RequestForProposal>? _rfpList;
  final List<Contract>? _contractList;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  GovernmentEntityModelIdentifier get modelIdentifier {
      return GovernmentEntityModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get address {
    try {
      return _address!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<RequestForProposal>? get rfpList {
    return _rfpList;
  }
  
  List<Contract>? get contractList {
    return _contractList;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const GovernmentEntity._internal({required this.id, required name, required address, rfpList, contractList, createdAt, updatedAt}): _name = name, _address = address, _rfpList = rfpList, _contractList = contractList, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GovernmentEntity({String? id, required String name, required String address, List<RequestForProposal>? rfpList, List<Contract>? contractList}) {
    return GovernmentEntity._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      address: address,
      rfpList: rfpList != null ? List<RequestForProposal>.unmodifiable(rfpList) : rfpList,
      contractList: contractList != null ? List<Contract>.unmodifiable(contractList) : contractList);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GovernmentEntity &&
      id == other.id &&
      _name == other._name &&
      _address == other._address &&
      DeepCollectionEquality().equals(_rfpList, other._rfpList) &&
      DeepCollectionEquality().equals(_contractList, other._contractList);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GovernmentEntity {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GovernmentEntity copyWith({String? name, String? address, List<RequestForProposal>? rfpList, List<Contract>? contractList}) {
    return GovernmentEntity._internal(
      id: id,
      name: name ?? this.name,
      address: address ?? this.address,
      rfpList: rfpList ?? this.rfpList,
      contractList: contractList ?? this.contractList);
  }
  
  GovernmentEntity copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<String>? address,
    ModelFieldValue<List<RequestForProposal>?>? rfpList,
    ModelFieldValue<List<Contract>?>? contractList
  }) {
    return GovernmentEntity._internal(
      id: id,
      name: name == null ? this.name : name.value,
      address: address == null ? this.address : address.value,
      rfpList: rfpList == null ? this.rfpList : rfpList.value,
      contractList: contractList == null ? this.contractList : contractList.value
    );
  }
  
  GovernmentEntity.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _address = json['address'],
      _rfpList = json['rfpList']  is Map
        ? (json['rfpList']['items'] is List
          ? (json['rfpList']['items'] as List)
              .where((e) => e != null)
              .map((e) => RequestForProposal.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['rfpList'] is List
          ? (json['rfpList'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => RequestForProposal.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _contractList = json['contractList']  is Map
        ? (json['contractList']['items'] is List
          ? (json['contractList']['items'] as List)
              .where((e) => e != null)
              .map((e) => Contract.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['contractList'] is List
          ? (json['contractList'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Contract.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'address': _address, 'rfpList': _rfpList?.map((RequestForProposal? e) => e?.toJson()).toList(), 'contractList': _contractList?.map((Contract? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'address': _address,
    'rfpList': _rfpList,
    'contractList': _contractList,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<GovernmentEntityModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<GovernmentEntityModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final RFPLIST = amplify_core.QueryField(
    fieldName: "rfpList",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'RequestForProposal'));
  static final CONTRACTLIST = amplify_core.QueryField(
    fieldName: "contractList",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Contract'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GovernmentEntity";
    modelSchemaDefinition.pluralName = "GovernmentEntities";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Government" ],
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
      key: GovernmentEntity.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GovernmentEntity.ADDRESS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: GovernmentEntity.RFPLIST,
      isRequired: false,
      ofModelName: 'RequestForProposal',
      associatedKey: RequestForProposal.GOVERNMENTID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: GovernmentEntity.CONTRACTLIST,
      isRequired: false,
      ofModelName: 'Contract',
      associatedKey: Contract.GOVERNMENTID
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

class _GovernmentEntityModelType extends amplify_core.ModelType<GovernmentEntity> {
  const _GovernmentEntityModelType();
  
  @override
  GovernmentEntity fromJson(Map<String, dynamic> jsonData) {
    return GovernmentEntity.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'GovernmentEntity';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [GovernmentEntity] in your schema.
 */
class GovernmentEntityModelIdentifier implements amplify_core.ModelIdentifier<GovernmentEntity> {
  final String id;

  /** Create an instance of GovernmentEntityModelIdentifier using [id] the primary key. */
  const GovernmentEntityModelIdentifier({
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
  String toString() => 'GovernmentEntityModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is GovernmentEntityModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}