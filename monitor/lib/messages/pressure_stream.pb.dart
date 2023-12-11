//
//  Generated code. Do not modify.
//  source: pressure_stream.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StateSignal extends $pb.GeneratedMessage {
  factory StateSignal({
    $core.double? pressure,
  }) {
    final $result = create();
    if (pressure != null) {
      $result.pressure = pressure;
    }
    return $result;
  }
  StateSignal._() : super();
  factory StateSignal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateSignal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StateSignal', package: const $pb.PackageName(_omitMessageNames ? '' : 'pressure_stream'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'pressure', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StateSignal clone() => StateSignal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StateSignal copyWith(void Function(StateSignal) updates) => super.copyWith((message) => updates(message as StateSignal)) as StateSignal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateSignal create() => StateSignal._();
  StateSignal createEmptyInstance() => create();
  static $pb.PbList<StateSignal> createRepeated() => $pb.PbList<StateSignal>();
  @$core.pragma('dart2js:noInline')
  static StateSignal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StateSignal>(create);
  static StateSignal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get pressure => $_getN(0);
  @$pb.TagNumber(1)
  set pressure($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPressure() => $_has(0);
  @$pb.TagNumber(1)
  void clearPressure() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

const ID = 4;