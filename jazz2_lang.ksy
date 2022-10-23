meta:
  id: jazz2_lang
  title: Jazz Jackrabbit 2 language file
  application: Jazz Jackrabbit 2
  file-extension: j2s
  endian: le
  license: WTFPL
doc-ref:
  - https://www.jazz2online.com/downloads/viewfile.php?fileID=44261
  - https://www.jazz2online.com/jcf/showpost.php?p=476727&postcount=217
seq:
  - id: offset_array_size
    type: u4
  - id: text_array_size
    type: u4
  - id: text_array
    size: text_array_size
  - id: offset_array
    size: offset_array_size * 4
    # TODO szétszedni text és offset stringekre
  - id: level_entry_count
    type: u4
  - id: level_entries
    type: level_entry
    repeat: expr
    repeat-expr: level_entry_count
  - id: help_strings_size
    type: u4
  - id: help_strings
    type: help_string
    repeat: eos
types:
  level_entry:
    seq:
      - id: name
        size: 8
        terminator: 0
      - id: filler_byte
        type: u1
      - id: amount
        type: u1
      - id: offset
        type: u2
  help_string:
    seq:
      - id: index
        type: u1
      - id: text_size
        type: u1
      - id: text
        size: text_size