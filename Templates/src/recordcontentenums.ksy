meta:
  id: recordcontentenums

enums:
  bof_file_format_type:
    0x0404: 'lotus_1_2_3'
    0x0405: "symphony"

  calcmode_calcmethod:
    0x00: 'manual'
    0xFF: 'automatic'

  calcorder:
    0x00: 'natural'
    0x01: 'by_column'
    0xFF: 'by_row'

  split_window_type:
    0x00: 'not_split'
    0x01: 'vertical_split'
    0xFF: 'horizontal_split'
  
  split_window_sync:
    0x00: 'not_synchronized'
    0xFF: 'synchronized'
