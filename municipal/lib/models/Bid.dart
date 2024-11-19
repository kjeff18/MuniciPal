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


/** This is an auto generated class representing the Bid type in your schema. */
class Bid extends amplify_core.Model {
  static const classType = const _BidModelType();
  final String id;
  final String? _contractorId;
  final String? _rfpId;
  final double? _bidAmount;
  final String? _pdfUrl;
  final BidStatus? _status;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  BidModelIdentifier get modelIdentifier {
      return BidModelIdentifier(
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
  
  String get rfpId {
    try {
      return _rfpId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double? get bidAmount {
    return _bidAmount;
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
  
  BidStatus get status {
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
  
  const Bid._internal({required this.id, required contractorId, required rfpId, bidAmount, required pdfUrl, required status, createdAt, updatedAt}): _contractorId = contractorId, _rfpId = rfpId, _bidAmount = bidAmount, _pdfUrl = pdfUrl, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Bid({String? id, required String contractorId, required String rfpId, double? bidAmount, required String pdfUrl, required BidStatus status}) {
    return Bid._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      contractorId: contractorId,
      rfpId: rfpId,
      bidAmount: bidAmount,
      pdfUrl: pdfUrl,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bid &&
      id == other.id &&
      _contractorId == other._contractorId &&
      _rfpId == other._rfpId &&
      _bidAmount == other._bidAmount &&
      _pdfUrl == other._pdfUrl &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Bid {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("contractorId=" + "$_contractorId" + ", ");
    buffer.write("rfpId=" + "$_rfpId" + ", ");
    buffer.write("bidAmount=" + (_bidAmount != null ? _bidAmount!.toString() : "null") + ", ");
    buffer.write("pdfUrl=" + "$_pdfUrl" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Bid copyWith({String? contractorId, String? rfpId, double? bidAmount, String? pdfUrl, BidStatus? status}) {
    return Bid._internal(
      id: id,
      contractorId: contractorId ?? this.contractorId,
      rfpId: rfpId ?? this.rfpId,
      bidAmount: bidAmount ?? this.bidAmount,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      status: status ?? this.status);
  }
  
  Bid copyWithModelFieldValues({
    ModelFieldValue<String>? contractorId,
    ModelFieldValue<String>? rfpId,
    ModelFieldValue<double?>? bidAmount,
    ModelFieldValue<String>? pdfUrl,
    ModelFieldValue<BidStatus>? status
  }) {
    return Bid._internal(
      id: id,
      contractorId: contractorId == null ? this.contractorId : contractorId.value,
      rfpId: rfpId == null ? this.rfpId : rfpId.value,
      bidAmount: bidAmount == null ? this.bidAmount : bidAmount.value,
      pdfUrl: pdfUrl == null ? this.pdfUrl : pdfUrl.value,
      status: status == null ? this.status : status.value
    );
  }
  
  Bid.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _contractorId = json['contractorId'],
      _rfpId = json['rfpId'],
      _bidAmount = (json['bidAmount'] as num?)?.toDouble(),
      _pdfUrl = json['pdfUrl'],
      _status = amplify_core.enumFromString<BidStatus>(json['status'], BidStatus.values),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'contractorId': _contractorId, 'rfpId': _rfpId, 'bidAmount': _bidAmount, 'pdfUrl': _pdfUrl, 'status': amplify_core.enumToString(_status), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'contractorId': _contractorId,
    'rfpId': _rfpId,
    'bidAmount': _bidAmount,
    'pdfUrl': _pdfUrl,
    'status': _status,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<BidModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<BidModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CONTRACTORID = amplify_core.QueryField(fieldName: "contractorId");
  static final RFPID = amplify_core.QueryField(fieldName: "rfpId");
  static final BIDAMOUNT = amplify_core.QueryField(fieldName: "bidAmount");
  static final PDFURL = amplify_core.QueryField(fieldName: "pdfUrl");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Bid";
    modelSchemaDefinition.pluralName = "Bids";
    
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
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["rfpId"], name: "byRFP")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bid.CONTRACTORID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bid.RFPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bid.BIDAMOUNT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bid.PDFURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bid.STATUS,
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

class _BidModelType extends amplify_core.ModelType<Bid> {
  const _BidModelType();
  
  @override
  Bid fromJson(Map<String, dynamic> jsonData) {
    return Bid.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Bid';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Bid] in your schema.
 */
class BidModelIdentifier implements amplify_core.ModelIdentifier<Bid> {
  final String id;

  /** Create an instance of BidModelIdentifier using [id] the primary key. */
  const BidModelIdentifier({
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
  String toString() => 'BidModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is BidModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}