meta:
  id: recordtypes
  endian: le
  imports:
    - opcodetypes
    - recordcontentenums

types:
  record_header:
    seq:
      - id: record_type
        type: u2
        enum: 'opcodetypes::record_type'
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
          'opcodetypes::record_type::bof': bof
          'opcodetypes::record_type::eof': eof
          'opcodetypes::record_type::calcmode': calcmode
          'opcodetypes::record_type::calcorder': calcorder
          _: generic
          
  generic:
    seq:
      - id: generic_body
        size: _parent.header.record_length
  

  bof:
    seq:
      - id: file_format_revision_number
        type: u2
        enum: 'recordcontentenums::bof_file_format_type'
        doc: |
            Describes which revision number fhe file is.
            0x0404 -> 1-2-3 file
            0x0405 -> Symphony file

  eof:
    seq:
      - id: end_of_file
        size: 0
    doc: |
          Denotes the conclusion of the file.
          No body contents; header-only record

  calcmode:
    seq:
      - id: calculation_method
        type: u1
        enum: 'recordcontentenums::calcmode_calcmethod'
        doc: |
            Whether the sheet automatically re-calculates itself,
            or waits for the user to trigger re-calculation

  calcorder:
    seq:
      - id: calcorder
        type: u1
        enum: 'recordcontentenums::calcorder'
        doc: |
            The order in which the sheet calculate
