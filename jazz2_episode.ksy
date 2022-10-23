meta:
  id: jazz2_episode
  title: Jazz Jackrabbit 2 episode file
  application: Jazz Jackrabbit 2
  file-extension: j2e
  endian: le
  license: WTFPL
doc-ref:
  - https://www.jazz2online.com/junk/source.php?file=episode.py
  - https://github.com/deathkiller/jazz2/blob/8f611ea9ae3d1e1302a079f9778d9ac8d985d282/Tools/Import/Compatibility/JJ2Episode.cs
seq:
  - id: header_size
    type: u4
  - id: position
    type: u4
  - id: is_registered
    type: u4
  - id: unknown1
    type: u4
  - id: episode_name
    size: 128
    terminator: 0
  - id: first_level
    size: 32
    terminator: 0
  - id: width
    type: u4
  - id: height
    type: u4
  - id: unknown2
    type: u4
  - id: unknown3
    type: u4
  - id: title_width
    type: u4
  - id: title_height
    type: u4
  - id: unknown4
    type: u4
  - id: unknown5
    type: u4
  - id: image_packed_size
    type: u4
  - id: image_packed
    size: image_packed_size
    process: zlib
  - id: title_light_packed_size
    type: u4
  - id: title_light_packed
    size: title_light_packed_size
    process: zlib
  - id: title_dark_packed_size
    type: u4
  - id: title_dark_packed
    size: title_dark_packed_size
    process: zlib