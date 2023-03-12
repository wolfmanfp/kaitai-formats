# Based on quake_pak.ksy
meta:
  id: hrot_pak
  title: HROT game data file
  application: HROT
  file-extension: pak
  license: CC0-1.0
  endian: le
doc-ref: 
  - https://quakewiki.org/wiki/.pak#Format_specification
  - https://raw.githubusercontent.com/joshuaskelly/vgio/master/vgio/hrot/pak.py
seq:
  - id: magic
    contents: 'HROT'
  - id: index_offset
    type: u4
  - id: index_size
    type: u4
instances:
  index:
    pos: index_offset
    size: index_size
    type: index_struct
types:
  index_struct:
    seq:
      - id: entries
        type: index_entry
        repeat: eos
  index_entry:
    seq:
      - id: filename
        type: str
        size: 120
        encoding: UTF-8
        terminator: 0
        pad-right: 0
      - id: file_offset
        type: u4
      - id: file_size
        type: u4
    instances:
      body:
        io: _root._io
        pos: file_offset
        size: file_size
