
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_tests/date_formatter.dart';

void main() {
  const dateString = '2024-07-30 13:54:23.304073';
  final date = DateTime.parse(dateString);

  test('Data format hh:mm', () {
      final formattedDate = DateFormatter.formatDate(date, DateFormats.hh_mm);
      const expected = '01:54';
      expect(expected, formattedDate);
  });

  test('Data format HH:mm', () {
    final formattedDate = DateFormatter.formatDate(date, DateFormats.HH_mm);
    const expected = '13:54';
    expect(expected, formattedDate);
  });

  test('Data format dd/MM/yyyy', () {
    final formattedDate = DateFormatter.formatDate(date, DateFormats.dd_mm_yyyy);
    const expected = '30/07/2024';
    expect(expected, formattedDate);
  });

  test('Data format hh:mm dd/MM/yyyy', () {
    final formattedDate = DateFormatter.formatDate(date, DateFormats.hh_mm_dd_mm_yyyy);
    const expected = '01:54 30/07/2024';
    expect(expected, formattedDate);
  });

  test('Data format hh:mm:ss', () {
    final formattedDate = DateFormatter.formatDate(date, DateFormats.hh_mm_ss);
    const expected = '01:54:23';
    expect(expected, formattedDate);
  });

  test('Data format HH:mm:ss', () {
    final formattedDate = DateFormatter.formatDate(date, DateFormats.HH_mm_ss);
    const expected = '13:54:23';
    expect(expected, formattedDate);
  });

  // String date
  test('Data format string hh:mm', () {
    final formattedDate = DateFormatter.formatDateFromString(dateString, DateFormats.hh_mm);
    const expected = '01:54';
    expect(expected, formattedDate);
  });

  test('Data format string HH:mm', () {
    final formattedDate = DateFormatter.formatDateFromString(dateString, DateFormats.HH_mm);
    const expected = '13:54';
    expect(expected, formattedDate);
  });

  test('Data format string dd/MM/yyyy', () {
    final formattedDate = DateFormatter.formatDateFromString(dateString, DateFormats.dd_mm_yyyy);
    const expected = '30/07/2024';
    expect(expected, formattedDate);
  });

  test('Data format string hh:mm dd/MM/yyyy', () {
    final formattedDate = DateFormatter.formatDateFromString(dateString, DateFormats.hh_mm_dd_mm_yyyy);
    const expected = '01:54 30/07/2024';
    expect(expected, formattedDate);
  });

  test('Data format string hh:mm:ss', () {
    final formattedDate = DateFormatter.formatDateFromString(dateString, DateFormats.hh_mm_ss);
    const expected = '01:54:23';
    expect(expected, formattedDate);
  });

  test('Data format string HH:mm:ss', () {
    final formattedDate = DateFormatter.formatDateFromString(dateString, DateFormats.HH_mm_ss);
    const expected = '13:54:23';
    expect(expected, formattedDate);
  });

  test('Data format string, expected to return a null value', () {
    final formattedDate = DateFormatter.formatDateFromString('123:32:12 12-03/2012', DateFormats.HH_mm_ss);
    const expected = null;
    expect(expected, formattedDate);
  });
}