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


/** This is an auto generated class representing the Contract type in your schema. */
class Contract extends amplify_core.Model {
  static const classType = const _ContractModelType();
  final String id;
  final String? _title;
  final String? _description;
  final String? _pdfUrl;
  final amplify_core.TemporalDate? _startDate;
  final amplify_core.TemporalDate? _endDate;
  final String? _governmentId;
  final String? _contractorId;
  final double? _finalCost;
  final ContractStatus? _status;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ContractModelIdentifier get modelIdentifier {
      return ContractModelIdentifier(
        id: id
      );
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get description {
    return _description;
  }
  
  String get pdfUrl {
    try {
      return _pdfUrl!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDate get startDate {
    try {
      return _startDate!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDate? get endDate {
    return _endDate;
  }
  
  String get governmentId {
    try {
      return _governmentId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  double? get finalCost {
    return _finalCost;
  }
  
  ContractStatus get status {
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Contract._internal({required this.id, required title, description, required pdfUrl, required startDate, endDate, required governmentId, required contractorId, finalCost, required status, createdAt, updatedAt}): _title = title, _description = description, _pdfUrl = pdfUrl, _startDate = startDate, _endDate = endDate, _governmentId = governmentId, _contractorId = contractorId, _finalCost = finalCost, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Contract({String? id, required String title, String? description, required String pdfUrl, required amplify_core.TemporalDate startDate, amplify_core.TemporalDate? endDate, required String governmentId, required String contractorId, double? finalCost, required ContractStatus status}) {
    return Contract._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      title: title,
      description: description,
      pdfUrl: pdfUrl,
      startDate: startDate,
      endDate: endDate,
      governmentId: governmentId,
      contractorId: contractorId,
      finalCost: finalCost,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Contract &&
      id == other.id &&
      _title == other._title &&
      _description == other._description &&
      _pdfUrl == other._pdfUrl &&
      _startDate == other._startDate &&
      _endDate == other._endDate &&
      _governmentId == other._governmentId &&
      _contractorId == other._contractorId &&
      _finalCost == other._finalCost &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Contract {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("pdfUrl=" + "$_pdfUrl" + ", ");
    buffer.write("startDate=" + (_startDate != null ? _startDate!.format() : "null") + ", ");
    buffer.write("endDate=" + (_endDate != null ? _endDate!.format() : "null") + ", ");
    buffer.write("governmentId=" + "$_governmentId" + ", ");
    buffer.write("contractorId=" + "$_contractorId" + ", ");
    buffer.write("finalCost=" + (_finalCost != null ? _finalCost!.toString() : "null") + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Contract copyWith({String? title, String? description, String? pdfUrl, amplify_core.TemporalDate? startDate, amplify_core.TemporalDate? endDate, String? governmentId, String? contractorId, double? finalCost, ContractStatus? status}) {
    return Contract._internal(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      governmentId: governmentId ?? this.governmentId,
      contractorId: contractorId ?? this.contractorId,
      finalCost: finalCost ?? this.finalCost,
      status: status ?? this.status);
  }
  
  Contract copyWithModelFieldValues({
    ModelFieldValue<String>? title,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String>? pdfUrl,
    ModelFieldValue<amplify_core.TemporalDate>? startDate,
    ModelFieldValue<amplify_core.TemporalDate?>? endDate,
    ModelFieldValue<String>? governmentId,
    ModelFieldValue<String>? contractorId,
    ModelFieldValue<double?>? finalCost,
    ModelFieldValue<ContractStatus>? status
  }) {
    return Contract._internal(
      id: id,
      title: title == null ? this.title : title.value,
      description: description == null ? this.description : description.value,
      pdfUrl: pdfUrl == null ? this.pdfUrl : pdfUrl.value,
      startDate: startDate == null ? this.startDate : startDate.value,
      endDate: endDate == null ? this.endDate : endDate.value,
      governmentId: governmentId == null ? this.governmentId : governmentId.value,
      contractorId: contractorId == null ? this.contractorId : contractorId.value,
      finalCost: finalCost == null ? this.finalCost : finalCost.value,
      status: status == null ? this.status : status.value
    );
  }
  
  Contract.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _pdfUrl = json['pdfUrl'],
      _startDate = json['startDate'] != null ? amplify_core.TemporalDate.fromString(json['startDate']) : null,
      _endDate = json['endDate'] != null ? amplify_core.TemporalDate.fromString(json['endDate']) : null,
      _governmentId = json['governmentId'],
      _contractorId = json['contractorId'],
      _finalCost = (json['finalCost'] as num?)?.toDouble(),
      _status = amplify_core.enumFromString<ContractStatus>(json['status'], ContractStatus.values),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'description': _description, 'pdfUrl': _pdfUrl, 'startDate': _startDate?.format(), 'endDate': _endDate?.format(), 'governmentId': _governmentId, 'contractorId': _contractorId, 'finalCost': _finalCost, 'status': amplify_core.enumToString(_status), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': _title,
    'description': _description,
    'pdfUrl': _pdfUrl,
    'startDate': _startDate,
    'endDate': _endDate,
    'governmentId': _governmentId,
    'contractorId': _contractorId,
    'finalCost': _finalCost,
    'status': _status,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ContractModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ContractModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final PDFURL = amplify_core.QueryField(fieldName: "pdfUrl");
  static final STARTDATE = amplify_core.QueryField(fieldName: "startDate");
  static final ENDDATE = amplify_core.QueryField(fieldName: "endDate");
  static final GOVERNMENTID = amplify_core.QueryField(fieldName: "governmentId");
  static final CONTRACTORID = amplify_core.QueryField(fieldName: "contractorId");
  static final FINALCOST = amplify_core.QueryField(fieldName: "finalCost");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Contract";
    modelSchemaDefinition.pluralName = "Contracts";
    
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
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Contractor" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Citizen" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["governmentId"], name: "byGovernment")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Contract.TITLE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Contract.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Contract.PDFURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Contract.STARTDATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Contract.ENDDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Contract.GOVERNMENTID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Contract.CONTRACTORID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Contract.FINALCOST,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Contract.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
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

class _ContractModelType extends amplify_core.ModelType<Contract> {
  const _ContractModelType();
  
  @override
  Contract fromJson(Map<String, dynamic> jsonData) {
    return Contract.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Contract';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Contract] in your schema.
 */
class ContractModelIdentifier implements amplify_core.ModelIdentifier<Contract> {
  final String id;

  /** Create an instance of ContractModelIdentifier using [id] the primary key. */
  const ContractModelIdentifier({
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
  String toString() => 'ContractModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ContractModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}