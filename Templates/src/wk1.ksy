meta:
  id: wk1
  endian: le
  imports:
    - enums

seq:
  - id: record_opcode
    type: u2
  - id: record_length
    type: record
    repeat: eos

types:
  record_header:
    seq:
      - id: record_type
        type: u2
        enum: 'enum::record_type'
      - id: record_length
        type: u2
  record:
    seq:
      - id: header
        type: record_header
      - id: body
        size: header.record_length
