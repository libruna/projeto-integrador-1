//
//  Generated code. Do not modify.
//  source: counter_number.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReadRequest extends $pb.GeneratedMessage {
  factory ReadRequest({
    $core.String? letter,
    $core.int? beforeNumber,
    $core.int? dummyOne,
    SampleSchema? dummyTwo,
    $core.Iterable<$core.int>? dummyThree,
  }) {
    final $result = create();
    if (letter != null) {
      $result.letter = letter;
    }
    if (beforeNumber != null) {
      $result.beforeNumber = beforeNumber;
    }
    if (dummyOne != null) {
      $result.dummyOne = dummyOne;
    }
    if (dummyTwo != null) {
      $result.dummyTwo = dummyTwo;
    }
    if (dummyThree != null) {
      $result.dummyThree.addAll(dummyThree);
    }
    return $result;
  }
  ReadRequest._() : super();
  factory ReadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'counter_number'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'letter')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'beforeNumber', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'dummyOne', $pb.PbFieldType.OU3)
    ..aOM<SampleSchema>(4, _omitFieldNames ? '' : 'dummyTwo', subBuilder: SampleSchema.create)
    ..p<$core.int>(5, _omitFieldNames ? '' : 'dummyThree', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadRequest clone() => ReadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadRequest copyWith(void Function(ReadRequest) updates) => super.copyWith((message) => updates(message as ReadRequest)) as ReadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadRequest create() => ReadRequest._();
  ReadRequest createEmptyInstance() => create();
  static $pb.PbList<ReadRequest> createRepeated() => $pb.PbList<ReadRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadRequest>(create);
  static ReadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get letter => $_getSZ(0);
  @$pb.TagNumber(1)
  set letter($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLetter() => $_has(0);
  @$pb.TagNumber(1)
  void clearLetter() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get beforeNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set beforeNumber($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBeforeNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearBeforeNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get dummyOne => $_getIZ(2);
  @$pb.TagNumber(3)
  set dummyOne($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDummyOne() => $_has(2);
  @$pb.TagNumber(3)
  void clearDummyOne() => clearField(3);

  @$pb.TagNumber(4)
  SampleSchema get dummyTwo => $_getN(3);
  @$pb.TagNumber(4)
  set dummyTwo(SampleSchema v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDummyTwo() => $_has(3);
  @$pb.TagNumber(4)
  void clearDummyTwo() => clearField(4);
  @$pb.TagNumber(4)
  SampleSchema ensureDummyTwo() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get dummyThree => $_getList(4);
}

class ReadResponse extends $pb.GeneratedMessage {
  factory ReadResponse({
    $core.int? afterNumber,
    $core.int? dummyOne,
    SampleSchema? dummyTwo,
    $core.Iterable<$core.int>? dummyThree,
  }) {
    final $result = create();
    if (afterNumber != null) {
      $result.afterNumber = afterNumber;
    }
    if (dummyOne != null) {
      $result.dummyOne = dummyOne;
    }
    if (dummyTwo != null) {
      $result.dummyTwo = dummyTwo;
    }
    if (dummyThree != null) {
      $result.dummyThree.addAll(dummyThree);
    }
    return $result;
  }
  ReadResponse._() : super();
  factory ReadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'counter_number'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'afterNumber', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'dummyOne', $pb.PbFieldType.OU3)
    ..aOM<SampleSchema>(3, _omitFieldNames ? '' : 'dummyTwo', subBuilder: SampleSchema.create)
    ..p<$core.int>(4, _omitFieldNames ? '' : 'dummyThree', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadResponse clone() => ReadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadResponse copyWith(void Function(ReadResponse) updates) => super.copyWith((message) => updates(message as ReadResponse)) as ReadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadResponse create() => ReadResponse._();
  ReadResponse createEmptyInstance() => create();
  static $pb.PbList<ReadResponse> createRepeated() => $pb.PbList<ReadResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadResponse>(create);
  static ReadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get afterNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set afterNumber($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAfterNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearAfterNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get dummyOne => $_getIZ(1);
  @$pb.TagNumber(2)
  set dummyOne($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDummyOne() => $_has(1);
  @$pb.TagNumber(2)
  void clearDummyOne() => clearField(2);

  @$pb.TagNumber(3)
  SampleSchema get dummyTwo => $_getN(2);
  @$pb.TagNumber(3)
  set dummyTwo(SampleSchema v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDummyTwo() => $_has(2);
  @$pb.TagNumber(3)
  void clearDummyTwo() => clearField(3);
  @$pb.TagNumber(3)
  SampleSchema ensureDummyTwo() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get dummyThree => $_getList(3);
}

class SampleSchema extends $pb.GeneratedMessage {
  factory SampleSchema({
    $core.bool? sampleFieldOne,
    $core.bool? sampleFieldTwo,
  }) {
    final $result = create();
    if (sampleFieldOne != null) {
      $result.sampleFieldOne = sampleFieldOne;
    }
    if (sampleFieldTwo != null) {
      $result.sampleFieldTwo = sampleFieldTwo;
    }
    return $result;
  }
  SampleSchema._() : super();
  factory SampleSchema.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SampleSchema.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SampleSchema', package: const $pb.PackageName(_omitMessageNames ? '' : 'counter_number'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'sampleFieldOne')
    ..aOB(2, _omitFieldNames ? '' : 'sampleFieldTwo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SampleSchema clone() => SampleSchema()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SampleSchema copyWith(void Function(SampleSchema) updates) => super.copyWith((message) => updates(message as SampleSchema)) as SampleSchema;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SampleSchema create() => SampleSchema._();
  SampleSchema createEmptyInstance() => create();
  static $pb.PbList<SampleSchema> createRepeated() => $pb.PbList<SampleSchema>();
  @$core.pragma('dart2js:noInline')
  static SampleSchema getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SampleSchema>(create);
  static SampleSchema? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get sampleFieldOne => $_getBF(0);
  @$pb.TagNumber(1)
  set sampleFieldOne($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSampleFieldOne() => $_has(0);
  @$pb.TagNumber(1)
  void clearSampleFieldOne() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get sampleFieldTwo => $_getBF(1);
  @$pb.TagNumber(2)
  set sampleFieldTwo($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSampleFieldTwo() => $_has(1);
  @$pb.TagNumber(2)
  void clearSampleFieldTwo() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

const ID = 2;