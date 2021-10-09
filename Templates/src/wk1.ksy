meta:
  id: wk1
  endian: le
  imports:
    - enum

seq:
  - id: record
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
        
  generic_record:
    seq:
      - id: body
        size: _parent.header.record_length
  bof_record:
    seq:
      - id: revision_code
        type: u2
  record:
    seq:
    - id: header
      type: record_header
    - id: body
      type:
        switch-on: header.record_type
        cases:
          'enum::record_type::bof': bof_record
          _: generic_record

