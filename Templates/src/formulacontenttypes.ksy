meta:
  id: formulacontenttypes

enums:
  formulaopcodes:
    0x00: constant
    0x01: variable
    0x02: range
    0x03: return
    0x04: parenthesis
    0x05: intconst
    0x08: unary_negation
    0x09: addition
    0x0A: subtraction
    0x0B: multiplication
    0x0C: division
    0x0D: exponentiation
    0x0E: equal_to
    0x0F: not_equal_to
    0x10: less_than_or_equal_to
    0x11: greater_than_or_equal_to
    0x12: less_than
    0x13: greater_than
    0x14: logical_and
    0x15: logical_or
    0x16: logical_not
    0x17: unary_positive
    0x1F: not_applicable
    0x20: error
    0x21: absolute_value_x
    0x22: integer_value_x
    0x23: square_root_x
    0x24: log_base_ten_x
    0x25: log_base_e_x
    0x26: pi_constant
    0x27: sine_x
    0x28: cosine_x
    0x29: tangent_x
    0x2A: four_quadrant_arc_tangent_x
    0x2B: two_quadrant_arc_tangent_x
    0x2C: arc_sine_x
    0x2D: arc_cosine_x
    0x2E: exponential_antilog_x
    0x2F: x_modulus_y
    0x30: sel_x_vn
    0x31: isna_x
    0x33: false_
    0x34: true_
    0x35: rand
    0x36: date_y_m_d
    0x37: today
    0x38: pmt_princ_int_term
    0x39: pv_pmt_int_term
    0x3A: fv_pmt_int_term
    0x3B: if_arg_then_else
    0x3C: day_x
    0x3D: month_x
    0x3E: round_x_d
    0x50: sum
    0x51: avg
    0x52: cnt
    0x53: min
    0x54: max
    0x55: vlookup
    0x56: npv
    0x57: var
    0x58: std
    0x59: irr
    0x5A: hlookup
    0x5B: dsum
    0x5C: davg
    0x5D: dcnt
    0x5E: dmin
    0x5F: dmax
    0x60: dvar
    0x61: dstd
    
types:
  formularecord:
    - id: formularecordopcode
      type: u1
      enum: formulaopcodes
