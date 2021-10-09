meta:
  id: types
  endian: le
  imports:
    - enum

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
      type:
        switch-on: header.record_type
        cases:
          'enum::record_type::bof': bof_body
          _: generic_body
          
  generic_body:
    seq:
      - id: generic_body
        size: _parent.header.record_length
  
  bof_body:
    seq:
      - id: file_format_revision_number
        type: u2
