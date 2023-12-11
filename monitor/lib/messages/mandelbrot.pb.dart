//
//  Generated code. Do not modify.
//  source: mandelbrot.proto
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
    $core.int? id,
    $core.double? currentScale,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (currentScale != null) {
      $result.currentScale = currentScale;
    }
    return $result;
  }
  StateSignal._() : super();
  factory StateSignal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateSignal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StateSignal', package: const $pb.PackageName(_omitMessageNames ? '' : 'mandelbrot'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'currentScale', $pb.PbFieldType.OD)
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
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get currentScale => $_getN(1);
  @$pb.TagNumber(2)
  set currentScale($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentScale() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentScale() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

const ID = 3;