# Lotus 1-2-3 9 Workbook File Format

## References

### Lotus File Format Specifications

There are `rtf` and `pdf` files in [Lotus File Format information](Lotus%20File%20Format%20Information/) which outline the general basis for the Lotus file formats.

They are, generally, outdated for files past those which use the `.wk1` extension. This means that the opcodes may not map directly to the record types in other versions of the format. However, they are still instructive for decoding the way in which the file formats work in a general sense.

### OpenOffice

There is good information re: the Lotus 1-2-3 file formats in the source code for OpenOffice:

`main -> sc -> source -> filter -> inc | lotus`

There are header files in the `inc` directory which provide helpful definitions for the different opcodes and their meanings.

In the `lotus` directory, there are files which outline the way specific codes are mapped to Lotus record definitions.

[OpenOffice Github Repository](https://github.com/apache/openoffice)

### The Definitive Guide to Exploring File Formats

[The Definitive Guide to Exploring File Formats](http://wiki.xentax.com/index.php/DGTEFF) provides an extremely in-depth overview of the different ways in which file formats are structured. In all likelihood, this will be extremely handy when working on file formats later than `.wk1` or maybe `wk2`.

## General

Worksheet files are unbroken sequences of variable length, known as Records.

Each record is a 4-byte header, followed by the record body; the header defines the record _type_ and _length_.

The records are little-endian, e.g. '02 00' is '2'.

| Byte Number(s) | Byte Description            |
| -------------- | --------------------------- |
| 1, 2           | Record Type Code            |
| 3, 4           | Record body Length in Bytes |

For Example:
