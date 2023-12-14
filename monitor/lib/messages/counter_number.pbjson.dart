//
//  Generated code. Do not modify.
//  source: counter_number.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readRequestDescriptor instead')
const ReadRequest$json = {
  '1': 'ReadRequest',
  '2': [
    {'1': 'letter', '3': 1, '4': 1, '5': 9, '10': 'letter'},
    {'1': 'before_number', '3': 2, '4': 1, '5': 5, '10': 'beforeNumber'},
    {'1': 'dummy_one', '3': 3, '4': 1, '5': 13, '10': 'dummyOne'},
    {'1': 'dummy_two', '3': 4, '4': 1, '5': 11, '6': '.counter_number.SampleSchema', '10': 'dummyTwo'},
    {'1': 'dummy_three', '3': 5, '4': 3, '5': 5, '10': 'dummyThree'},
  ],
};

/// Descriptor for `ReadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readRequestDescriptor = $convert.base64Decode(
    'CgtSZWFkUmVxdWVzdBIWCgZsZXR0ZXIYASABKAlSBmxldHRlchIjCg1iZWZvcmVfbnVtYmVyGA'
    'IgASgFUgxiZWZvcmVOdW1iZXISGwoJZHVtbXlfb25lGAMgASgNUghkdW1teU9uZRI5CglkdW1t'
    'eV90d28YBCABKAsyHC5jb3VudGVyX251bWJlci5TYW1wbGVTY2hlbWFSCGR1bW15VHdvEh8KC2'
    'R1bW15X3RocmVlGAUgAygFUgpkdW1teVRocmVl');

@$core.Deprecated('Use readResponseDescriptor instead')
const ReadResponse$json = {
  '1': 'ReadResponse',
  '2': [
    {'1': 'after_number', '3': 1, '4': 1, '5': 5, '10': 'afterNumber'},
    {'1': 'dummy_one', '3': 2, '4': 1, '5': 13, '10': 'dummyOne'},
    {'1': 'dummy_two', '3': 3, '4': 1, '5': 11, '6': '.counter_number.SampleSchema', '10': 'dummyTwo'},
    {'1': 'dummy_three', '3': 4, '4': 3, '5': 5, '10': 'dummyThree'},
  ],
};

/// Descriptor for `ReadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readResponseDescriptor = $convert.base64Decode(
    'CgxSZWFkUmVzcG9uc2USIQoMYWZ0ZXJfbnVtYmVyGAEgASgFUgthZnRlck51bWJlchIbCglkdW'
    '1teV9vbmUYAiABKA1SCGR1bW15T25lEjkKCWR1bW15X3R3bxgDIAEoCzIcLmNvdW50ZXJfbnVt'
    'YmVyLlNhbXBsZVNjaGVtYVIIZHVtbXlUd28SHwoLZHVtbXlfdGhyZWUYBCADKAVSCmR1bW15VG'
    'hyZWU=');

@$core.Deprecated('Use sampleSchemaDescriptor instead')
const SampleSchema$json = {
  '1': 'SampleSchema',
  '2': [
    {'1': 'sample_field_one', '3': 1, '4': 1, '5': 8, '10': 'sampleFieldOne'},
    {'1': 'sample_field_two', '3': 2, '4': 1, '5': 8, '10': 'sampleFieldTwo'},
  ],
};

/// Descriptor for `SampleSchema`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sampleSchemaDescriptor = $convert.base64Decode(
    'CgxTYW1wbGVTY2hlbWESKAoQc2FtcGxlX2ZpZWxkX29uZRgBIAEoCFIOc2FtcGxlRmllbGRPbm'
    'USKAoQc2FtcGxlX2ZpZWxkX3R3bxgCIAEoCFIOc2FtcGxlRmllbGRUd28=');

