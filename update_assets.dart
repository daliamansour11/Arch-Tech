import 'dart:io';

import 'package:flutter/foundation.dart';

void main() {
  final assetsDir = Directory('assets/svg');
  final pubspecFile = File('pubspec.yaml');
  final buffer = StringBuffer();
  final pubspecContent = pubspecFile.readAsStringSync();
  final lines = pubspecContent.split('\n');
  bool inAssetsSection = false;
  final files = assetsDir
      .listSync(recursive: true)
      .where((file) => file.path.endsWith('.svg'))
      .map((file) => file.path.replaceAll('\\', '/'))
      .toList();
  debugPrint('Starting to generate assets in pubspec.yaml');
  for (var line in lines) {
    debugPrint('Processing line: $line');
    buffer.writeln(line);
    if (line.trim().startsWith('assets:')) {
      debugPrint('Found assets section');
      inAssetsSection = true;
    } else if (inAssetsSection && line.trim().isEmpty) {
      debugPrint('Found end of assets section, starting to add SVG assets');
      for (var svgFile in files) {
        debugPrint('Adding SVG asset: $svgFile');
        buffer.writeln('    - path: $svgFile');
        buffer.writeln('      transformers:');
        buffer.writeln('        - package: vector_graphics_compiler');
      }
      inAssetsSection = false;
    }
  }

  debugPrint('Finished generating assets in pubspec.yaml');
  pubspecFile.writeAsStringSync(buffer.toString());
}
