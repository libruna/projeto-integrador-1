//
//  Generated code. Do not modify.
//  source: mandelbrot.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use stateSignalDescriptor instead')
const StateSignal$json = {
  '1': 'StateSignal',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'current_scale', '3': 2, '4': 1, '5': 1, '10': 'currentScale'},
  ],
};

/// Descriptor for `StateSignal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateSignalDescriptor = $convert.base64Decode(
    'CgtTdGF0ZVNpZ25hbBIOCgJpZBgBIAEoBVICaWQSIwoNY3VycmVudF9zY2FsZRgCIAEoAVIMY3'
    'VycmVudFNjYWxl');

