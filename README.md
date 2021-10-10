# Lotus 1-2-3 9 Workbook File Format

## References

There is good information re: the Lotus 1-2-3 file formats in the source code for OpenOffice. main -> source -> filter -> lotus -> op.cxx and optab.cxx


## General

Worksheet files are unbroken sequences of variable length, known as Records.

Each record is a 4-byte header, followed by the record body; the header defines the record _type_ and _length_.

The records are little-endian, e.g. '02 00' is '2'.

| Byte Number(s) | Byte Description            |
| -------------- | --------------------------- |
| 1, 2           | Record Type Code            |
| 3, 4           | Record body Length in Bytes |

For Example:


