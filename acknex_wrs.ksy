meta:
  id: acknex_wrs
  title: 3D GameStudio/ACKNEX archive (v2-v5)
  application: 3D GameStudio
  file-extension: wrs
  endian: be
  license: WTFPL
doc-ref: https://forum.xentax.com/viewtopic.php?p=84891&sid=b16cabaf24ae834b1a6d05aa1b2c85bd#p84891
seq:
  - id: entries
    type: entry
    repeat: eos
types:
  entry:
    seq:
      - id: filename
        size: 13
        terminator: 0
      - id: compressed_size
        type: u4
      - id: size
        type: u4
      - id: compressed_data
        size: compressed_size
        # process: lzss
        doc: Compressed with LZSS