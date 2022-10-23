meta:
  id: build_map
  title: Build Engine map file (v7+)
  application: Build Engine
  file-extension: map
  endian: le
  bit-endian: le
  license: WTFPL
doc-ref: 
  - https://github.com/jonof/jfbuild/blob/master/doc/buildinf.txt
  - https://moddingwiki.shikadi.net/wiki/MAP_Format_(Build)
seq:
  - id: map_version
    type: s4
    doc: File format version number (latest in released games is 7, source ports use 8 and 9)
  - id: pos_x
    type: s4
    doc: Player start point, X coordinate
  - id: pos_y
    type: s4
    doc: Player start point, Y coordinate
  - id: pos_z
    type: s4
    doc: Player start point, Z coordinate
  - id: ang
    type: s2
    doc: Player starting angle
  - id: cur_sect_num
    type: s2
    doc: Sector number containing the start point
  - id: num_sectors
    type: u2
    doc: Number of sectors in the map
  - id: sectors
    type: sector
    repeat: expr
    repeat-expr: num_sectors
    doc: Information about each sector
  - id: num_walls
    type: u2
    doc: Number of walls in the map
  - id: walls
    type: wall
    repeat: expr
    repeat-expr: num_walls
    doc: Information about each wall
  - id: num_sprites
    type: u2
    doc: Number of sprites in the map
  - id: sprites
    type: sprite
    repeat: expr
    repeat-expr: num_sprites
    doc: Information about each sprite
types:
  sector:
    seq:
      - id: wall_ptr
        type: s2
        doc: Index to first wall in the sector
      - id: wall_num
        type: s2
        doc: Number of walls in the sector
      - id: ceiling_z
        type: s4
        doc: Z-coordinate (height) of ceiling at first point of sector
      - id: floor_z
        type: s4
        doc: Z-coordinate (height) of floor at first point of sector
      - id: ceiling_stat
        type: sector_flag
      - id: floor_stat
        type: sector_flag
      - id: ceiling_pic_num
        type: s2
        doc: Ceiling texture (index into ART file)
      - id: ceiling_hei_num
        type: s2
        doc: Slope value (rise/run; 0 = parallel to floor, 4096 = 45 degrees)
      - id: ceiling_shade
        type: s1
        doc: Shade offset
      - id: ceiling_pal
        type: u1
        doc: Palette lookup table number (0 = standard colours)
      - id: ceiling_x_panning
        type: u1
        doc: Texture coordinate X-offset for ceiling
      - id: ceiling_y_panning
        type: u1
        doc: Texture coordinate Y-offset for ceiling
      - id: floor_pic_num
        type: s2
        doc: Floor texture (index into ART file)
      - id: floor_hei_num
        type: s2
        doc: Slope value (rise/run; 0 = parallel to floor, 4096 = 45 degrees)
      - id: floor_shade
        type: s1
        doc: Shade offset
      - id: floor_pal
        type: u1
        doc: Palette lookup table number (0 = standard colours)
      - id: floor_x_panning
        type: u1
        doc: Texture coordinate X-offset for floor
      - id: floor_y_panning
        type: u1
        doc: Texture coordinate Y-offset for floor
      - id: visibility
        type: u1
        doc: How fast an area changes shade relative to distance
      - id: filler
        type: u1
        # if: _parent.map_version >= 7
        doc: Padding byte
      - id: lo_tag
        type: s2
        doc: Game-specific (Triggers, etc.)
      - id: hi_tag
        type: s2
        doc: Game-specific
      - id: extra
        type: s2
        doc: Game-specific
  wall:
    seq:
      - id: x
        type: s4
      - id: y
        type: s4
      - id: point2
        type: s2
      - id: next_wall
        type: s2
      - id: next_sector
        type: s2
      - id: cstat
        type: wall_flag
      - id: pic_num
        type: s2
      - id: over_pic_num
        type: s2
      - id: shade
        type: s1
      - id: pal
        type: u1
      - id: x_repeat
        type: u1
      - id: y_repeat
        type: u1
      - id: x_panning
        type: u1
      - id: y_panning
        type: u1
      - id: lo_tag
        type: s2
        doc: Significance is game-specific (Triggers, etc.)
      - id: hi_tag
        type: s2
        doc: Significance is game-specific (Triggers, etc.)
      - id: extra
        type: s2
        doc: Significance is game-specific
  sprite:
    seq:
      - id: x
        type: s4
      - id: y
        type: s4
      - id: z
        type: s4
      - id: cstat
        type: sprite_flag
      - id: pic_num
        type: s2
      - id: shade
        type: s1
      - id: pal
        type: u1
      - id: clip_dist
        type: u1
      - id: filler
        type: u1
      - id: x_repeat
        type: u1
      - id: y_repeat
        type: u1
      - id: x_offset
        type: s1
      - id: y_offset
        type: s1
      - id: sect_num
        type: s2
      - id: stat_num
        type: s2
      - id: ang
        type: s2
      - id: owner
        type: s2
      - id: x_vel
        type: s2
      - id: y_vel
        type: s2
      - id: z_vel
        type: s2
      - id: lo_tag
        type: s2
        doc: Significance is game-specific (Triggers, etc.)
      - id: hi_tag
        type: s2
        doc: Significance is game-specific (Triggers, etc.)
      - id: extra
        type: s2
        doc: Significance is game-specific
  sector_flag:
    seq:
      - id: parallaxing
        type: b1
      - id: sloped
        type: b1
      - id: swap
        type: b1
      - id: smoosh
        type: b1
      - id: flip_x
        type: b1
      - id: flip_y
        type: b1
      - id: align
        type: b1
      - id: extra
        type: b9
  wall_flag:
    seq:
      - id: blocking
        type: b1
      - id: swap_walls
        type: b1
      - id: bottom_align
        type: b1
      - id: flip_x
        type: b1
      - id: masked
        type: b1
      - id: one_way
        type: b1
      - id: hitscan
        type: b1
      - id: translucence
        type: b1
      - id: flip_y
        type: b1
      - id: translucence_reversing
        type: b1
      - id: extra
        type: b6
  sprite_flag:
    seq:
      - id: blocking
        type: b1
      - id: translucence
        type: b1
      - id: flip_x
        type: b1
      - id: flip_y
        type: b1
      - id: type
        type: b2
        enum: sprite_type
      - id: one_sided
        type: b1
      - id: real_centered
        type: b1
      - id: hitscan
        type: b1
      - id: translucence_reversing
        type: b1
      - id: extra
        type: b5
      - id: invisible
        type: b1
enums:
  sprite_type:
    0: face_sprite
    1: wall_sprite
    2: floor_sprite
