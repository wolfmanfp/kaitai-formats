meta:
  id: build_art
  title: Build Engine graphics file
  application: Build Engine
  file-extension: art
  endian: le
  bit-endian: le
  license: WTFPL
doc-ref: https://moddingwiki.shikadi.net/wiki/ART_Format_(Build)
seq:
  - id: art_version
    type: s4
  - id: num_tiles
    type: s4
  - id: local_tile_start
    type: s4
  - id: local_tile_end
    type: s4
  - id: tile_size_x
    type: s2
    repeat: expr
    repeat-expr: local_tile_end - local_tile_start + 1
  - id: tile_size_y
    type: s2
    repeat: expr
    repeat-expr: local_tile_end - local_tile_start + 1
  - id: pic_anm
    type: tile_attribute
    repeat: expr
    repeat-expr: local_tile_end - local_tile_start + 1
  - id: entries
    size: tile_size_x[_index] * tile_size_y[_index]
    repeat: expr
    repeat-expr: local_tile_end - local_tile_start + 1
types:
  tile_attribute:
    seq:
      - id: animation_length
        type: b6
      - id: animation_type
        type: b2
        enum: animation_type
      - id: x_center_offset
        type: s1
      - id: y_center_offset
        type: s1
      - id: animation_speed
        type: b4
      - id: unused
        type: b4
enums:
  animation_type:
    0: no_animation
    1: oscillating_animation
    2: animate_forward
    3: animate_backward