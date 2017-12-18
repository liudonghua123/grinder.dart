// Copyright 2013 Google. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.

library grinder.src.task_invocation_test;

import 'package:grinder/grinder.dart' hide fail;
import 'package:test/test.dart';

main() {
  group('TaskArgs', () {
    test('flag', () {
      TaskArgs args = new TaskArgs('test', ['--foo']);

      expect(args.hasFlag('foo'), true);
      expect(args.getFlag('foo'), true);

      expect(args.hasFlag('bar'), false);
      expect(args.getFlag('bar'), false);
    });

    test('negated flag', () {
      TaskArgs args = new TaskArgs('test', ['--no-foo']);

      expect(args.hasFlag('foo'), true);
      expect(args.getFlag('foo'), false);
    });

    test('option', () {
      TaskArgs args = new TaskArgs('test', ['--foo=bar']);

      expect(args.hasOption('foo'), true);
      expect(args.getOption('foo'), 'bar');

      expect(args.hasOption('baz'), false);
      expect(args.getOption('baz'), null);
    });

    test('quoted option', () {
      TaskArgs args = new TaskArgs('test', ['--foo="bar baz"']);

      expect(args.hasOption('foo'), true);
      expect(args.getOption('foo'), 'bar baz');
    });

    test('option missing value', () {
      TaskArgs args = new TaskArgs('test', ['--foo=']);

      expect(args.hasOption('foo'), true);
      expect(args.getOption('foo'), '');
    });
  });
}
