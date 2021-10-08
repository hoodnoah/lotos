meta:
  id: bodytypes
  endian: le

types:
  label_cell:
    seq:
      - id: format
        type: u1
      - id: column
        type: u2
      - id: row
        type: u2
      - id: string
        type: str
        encoding: ASCII
        size-eos: true
