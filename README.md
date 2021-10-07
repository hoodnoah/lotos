# Lotus 1-2-3 9 Workbook File Format

## General

Worksheet files are unbroken sequences of variable length, known as Records.

Each record is a 4-byte header, followed by the record body; the header defines the record _type_ and _length_.

The records are little-endian, e.g. '02 00'` is '2'.

| Byte Number(s) | Byte Description            |
| -------------- | --------------------------- |
| 1, 2           | Record Type Code            |
| 3, 4           | Record body Length in Bytes |

For Example:

Given the record header ```````1C 00 20 00

The first two bytes
