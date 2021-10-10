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
          'opcodetypes::record_type::split': split
          'opcodetypes::record_type::sync': sync
          'opcodetypes::record_type::range': range
          'opcodetypes::record_type::window1': window1
          'opcodetypes::record_type::colw1': colw1
          'opcodetypes::record_type::wintwo': wintwo
          'opcodetypes::record_type::colw2': colw2
          'opcodetypes::record_type::name': name
          'opcodetypes::record_type::blank': blank
          'opcodetypes::record_type::integer': integer
          'opcodetypes::record_type::number': number
          'opcodetypes::record_type::label': label
          _: generic
      size: header.record_length
          
  generic:
    seq:
      - id: generic_body
        size: _parent.header.record_length
  
  rangereference:
    seq: 
      - id: starting_colrow
        type: colrowreference
      - id: ending_colrow
        type: colrowreference

  colrowreference:
    seq:
      - id: column
        type: u2
      - id: row
        type: u2

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

  split:
    seq:
      - id: split_window_type
        type: u1
        enum: 'recordcontentenums::split_window_type'
        doc: |
          The type of split window in effect.
          0x00 -> not split
          0x01 -> vertical split
          0xFF -> horizontal split

  sync:
    seq:
      - id: split_window_sync
        type: u1
        enum: 'recordcontentenums::split_window_sync'
        doc: |
          Whether the two-screens move together with the cursor.
          0x00 -> not synchronized
          0xFF -> ynchronized

  range:
    seq:
      - id: range_reference
        type: rangereference
    doc: |
      The range of cells written to the worksheet.
      If the worksheet was created using the File Save command or with a File Xtract command, this excludes trailing rows and columns.
      If there is no data in the range, the starting column is set to -1.

  window1:
    seq:
      - id: cursor_colrowreference
        type: colrowreference
      - id: format
        type: u1
      - id: unused1
        type: u1
      - id: column_width
        type: u2
      - id: ncol_on_screen
        type: u2
      - id: nrow_on_screen
        type: u2
      - id: leftcol_toprow
        type: colrowreference
      - id: ntitle_columns
        type: u2
      - id: ntitle_rows
        type: u2
      - id: left_title_colrowreference
        type: colrowreference
      - id: border_width_column
        type: u2
      - id: border_width_row
        type: u2
      - id: window_width
        type: u2
      - id: unused2
        type: u1

  colw1:
    seq:
      - id: column
        type: u2
      - id: width
        type: u1

  wintwo:
    seq:
      - id: cursor_colrowreference
        type: colrowreference
      - id: format
        type: u1
      - id: unused1
        type: u1
      - id: column_width
        type: u2
      - id: ncol_on_screen
        type: u2
      - id: nrow_on_screen
        type: u2
      - id: leftcol_toprow
        type: colrowreference
      - id: ntitle_columns
        type: u2
      - id: ntitle_rows
        type: u2
      - id: left_title_colrowreference
        type: colrowreference
      - id: border_width_column
        type: u2
      - id: border_width_row
        type: u2
      - id: window_width
        type: u2
      - id: unused2
        type: u1

  colw2:
    seq:
      - id: column
        type: u2
      - id: width
        type: u1

  name:
    seq:
      - id: name_of_range
        type: str
        size: 15
        encoding: ASCII
      - id: starting_colrowreference
        type: colrowreference
      - id: ending_colrowreference
        type: colrowreference
    doc: Used only in Lotus 1-2-3, not symphony

  blank:
    seq:
      - id: format
        type: u1
      - id: column
        type: u2
      - id: row
        type: u2
    doc: |
      Blank cell.
      Only for cells which are protected or do not have the default format. 
      Unprotected blank cells with the default format are omitted from the worksheet file.

  integer:
    seq:
      - id: format
        type: u1
      - id: colrowreference
        type: colrowreference
      - id: integer_value
        type: u2

  number:
    seq:
      - id: format
        type: u1
      - id: colrowreference
        type: colrowreference
      - id: floatcontents
        type: f8
        doc: |
          IEEE Long real; 8087 double-precision floating-point format

  label:
    seq:
      - id: format
        type: u1
      - id: colrowreference
        type: colrowreference
      - id: labelstringprefix
        type: str
        encoding: ASCII
        size: 1
      - id: labelstring
        type: str
        encoding: ASCII
        terminator: 0x00

  formula:
    seq:
      - id: format
        type: u1
      - id: colrowreference
        type: colrowreference
      - id: formulanumericvalue
        type: f8
      - id: formulasize
        type: u2
      - id: formulacontents
        type: str
        size: formulasize
        terminator: 0x03
