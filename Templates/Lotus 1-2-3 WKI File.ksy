meta:
  id: wk1
  endian: le
  
seq:
  - id: record
    type: record
    repeat: eos
  
types:
  record_header:
    seq:
      - id: record_type
        type: u2
      - id: record_length
        type: u2
  record_body:
    seq:
      - id: body
        size-eos: true
  record:
    seq:
      - id: header
        type: record_header
      - id: body
        size: header.record_length