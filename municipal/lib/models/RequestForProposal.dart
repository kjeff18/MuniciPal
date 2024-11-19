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

/** This is an auto generated class representing the RequestForProposal type in your schema. */
class RequestForProposal extends amplify_core.Model {
  static const classType = const _RequestForProposalModelType();
  final String id;
  final String? _title;
  final String? _description;
  final String? _pdfUrl;
  final amplify_core.TemporalDateTime? _deadline;
  final RFPStatus? _status;
  final String? _governmentId;
  final String? _contractId;
  final List<Bid>? _bids;
  final List<IssueCategory>? _categories;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  RequestForProposalModelIdentifier get modelIdentifier {
    return RequestForProposalModelIdentifier(id: id);
  }

  String get title {
    try {
      return _title!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get description {
    return _description;
  }

  String get pdfUrl {
    try {
      return _pdfUrl!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime get deadline {
    try {
      return _deadline!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  RFPStatus get status {
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

  String get governmentId {
    try {
      return _governmentId!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get contractId {
    return _contractId;
  }

  List<Bid>? get bids {
    return _bids;
  }

  List<IssueCategory> get categories {
    try {
      return _categories!;
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

  const RequestForProposal._internal(
      {required this.id,
      required title,
      description,
      required pdfUrl,
      required deadline,
      required status,
      required governmentId,
      contractId,
      bids,
      required categories,
      createdAt,
      updatedAt})
      : _title = title,
        _description = description,
        _pdfUrl = pdfUrl,
        _deadline = deadline,
        _status = status,
        _governmentId = governmentId,
        _contractId = contractId,
        _bids = bids,
        _categories = categories,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory RequestForProposal(
      {String? id,
      required String title,
      String? description,
      required String pdfUrl,
      required amplify_core.TemporalDateTime deadline,
      required RFPStatus status,
      required String governmentId,
      String? contractId,
      List<Bid>? bids,
      required List<IssueCategory> categories}) {
    return RequestForProposal._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        title: title,
        description: description,
        pdfUrl: pdfUrl,
        deadline: deadline,
        status: status,
        governmentId: governmentId,
        contractId: contractId,
        bids: bids != null ? List<Bid>.unmodifiable(bids) : bids,
        categories: categories != null
            ? List<IssueCategory>.unmodifiable(categories)
            : categories);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestForProposal &&
        id == other.id &&
        _title == other._title &&
        _description == other._description &&
        _pdfUrl == other._pdfUrl &&
        _deadline == other._deadline &&
        _status == other._status &&
        _governmentId == other._governmentId &&
        _contractId == other._contractId &&
        DeepCollectionEquality().equals(_bids, other._bids) &&
        DeepCollectionEquality().equals(_categories, other._categories);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("RequestForProposal {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("pdfUrl=" + "$_pdfUrl" + ", ");
    buffer.write("deadline=" +
        (_deadline != null ? _deadline!.format() : "null") +
        ", ");
    buffer.write("status=" +
        (_status != null ? amplify_core.enumToString(_status)! : "null") +
        ", ");
    buffer.write("governmentId=" + "$_governmentId" + ", ");
    buffer.write("contractId=" + "$_contractId" + ", ");
    buffer.write("categories=" +
        (_categories != null
            ? _categories!.map((e) => amplify_core.enumToString(e)).toString()
            : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  RequestForProposal copyWith(
      {String? title,
      String? description,
      String? pdfUrl,
      amplify_core.TemporalDateTime? deadline,
      RFPStatus? status,
      String? governmentId,
      String? contractId,
      List<Bid>? bids,
      List<IssueCategory>? categories}) {
    return RequestForProposal._internal(
        id: id,
        title: title ?? this.title,
        description: description ?? this.description,
        pdfUrl: pdfUrl ?? this.pdfUrl,
        deadline: deadline ?? this.deadline,
        status: status ?? this.status,
        governmentId: governmentId ?? this.governmentId,
        contractId: contractId ?? this.contractId,
        bids: bids ?? this.bids,
        categories: categories ?? this.categories);
  }

  RequestForProposal copyWithModelFieldValues(
      {ModelFieldValue<String>? title,
      ModelFieldValue<String?>? description,
      ModelFieldValue<String>? pdfUrl,
      ModelFieldValue<amplify_core.TemporalDateTime>? deadline,
      ModelFieldValue<RFPStatus>? status,
      ModelFieldValue<String>? governmentId,
      ModelFieldValue<String?>? contractId,
      ModelFieldValue<List<Bid>?>? bids,
      ModelFieldValue<List<IssueCategory>?>? categories}) {
    return RequestForProposal._internal(
        id: id,
        title: title == null ? this.title : title.value,
        description: description == null ? this.description : description.value,
        pdfUrl: pdfUrl == null ? this.pdfUrl : pdfUrl.value,
        deadline: deadline == null ? this.deadline : deadline.value,
        status: status == null ? this.status : status.value,
        governmentId:
            governmentId == null ? this.governmentId : governmentId.value,
        contractId: contractId == null ? this.contractId : contractId.value,
        bids: bids == null ? this.bids : bids.value,
        categories: categories == null ? this.categories : categories.value);
  }

  RequestForProposal.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _title = json['title'],
        _description = json['description'],
        _pdfUrl = json['pdfUrl'],
        _deadline = json['deadline'] != null
            ? amplify_core.TemporalDateTime.fromString(json['deadline'])
            : null,
        _status = amplify_core.enumFromString<RFPStatus>(
            json['status'], RFPStatus.values),
        _governmentId = json['governmentId'],
        _contractId = json['contractId'],
        _bids = json['bids'] is Map
            ? (json['bids']['items'] is List
                ? (json['bids']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => Bid.fromJson(new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['bids'] is List
                ? (json['bids'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => Bid.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _categories = json['categories'] is List
            ? (json['categories'] as List)
                .map((e) => amplify_core.enumFromString<IssueCategory>(
                    e, IssueCategory.values)!)
                .toList()
            : null,
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': _title,
        'description': _description,
        'pdfUrl': _pdfUrl,
        'deadline': _deadline?.format(),
        'status': amplify_core.enumToString(_status),
        'governmentId': _governmentId,
        'contractId': _contractId,
        'bids': _bids?.map((Bid? e) => e?.toJson()).toList(),
        'categories':
            _categories?.map((e) => amplify_core.enumToString(e)).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'title': _title,
        'description': _description,
        'pdfUrl': _pdfUrl,
        'deadline': _deadline,
        'status': _status,
        'governmentId': _governmentId,
        'contractId': _contractId,
        'bids': _bids,
        'categories': _categories,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core
      .QueryModelIdentifier<RequestForProposalModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<RequestForProposalModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final PDFURL = amplify_core.QueryField(fieldName: "pdfUrl");
  static final DEADLINE = amplify_core.QueryField(fieldName: "deadline");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final GOVERNMENTID =
      amplify_core.QueryField(fieldName: "governmentId");
  static final CONTRACTID = amplify_core.QueryField(fieldName: "contractId");
  static final BIDS = amplify_core.QueryField(
      fieldName: "bids",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Bid'));
  static final CATEGORIES = amplify_core.QueryField(fieldName: "categories");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RequestForProposal";
    modelSchemaDefinition.pluralName = "RequestForProposals";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.GROUPS,
          groupClaim: "cognito:groups",
          groups: ["Government"],
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
          groups: ["Contractor"],
          provider: amplify_core.AuthRuleProvider.USERPOOLS,
          operations: const [
            amplify_core.ModelOperation.READ,
            amplify_core.ModelOperation.CREATE
          ]),
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.GROUPS,
          groupClaim: "cognito:groups",
          groups: ["Citizen"],
          provider: amplify_core.AuthRuleProvider.USERPOOLS,
          operations: const [amplify_core.ModelOperation.READ])
    ];

    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(
          fields: const ["governmentId"], name: "byGovernment")
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: RequestForProposal.TITLE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: RequestForProposal.DESCRIPTION,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: RequestForProposal.PDFURL,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: RequestForProposal.DEADLINE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: RequestForProposal.STATUS,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: RequestForProposal.GOVERNMENTID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: RequestForProposal.CONTRACTID,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: RequestForProposal.BIDS,
        isRequired: false,
        ofModelName: 'Bid',
        associatedKey: Bid.RFPID));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: RequestForProposal.CATEGORIES,
        isRequired: true,
        isArray: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.collection,
            ofModelName: amplify_core.ModelFieldTypeEnum.enumeration.name)));

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

class _RequestForProposalModelType
    extends amplify_core.ModelType<RequestForProposal> {
  const _RequestForProposalModelType();

  @override
  RequestForProposal fromJson(Map<String, dynamic> jsonData) {
    return RequestForProposal.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'RequestForProposal';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [RequestForProposal] in your schema.
 */
class RequestForProposalModelIdentifier
    implements amplify_core.ModelIdentifier<RequestForProposal> {
  final String id;

  /** Create an instance of RequestForProposalModelIdentifier using [id] the primary key. */
  const RequestForProposalModelIdentifier({required this.id});

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
  String toString() => 'RequestForProposalModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is RequestForProposalModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
