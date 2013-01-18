
TYPE string_type
  mem AS _MEM
  length AS LONG
  allocated AS LONG
  is_allocated AS _BYTE
END TYPE

TYPE array_type
  mem AS _MEM
  length AS LONG
  allocated AS LONG
  is_allocated AS _BYTE
  element_size AS INTEGER
END TYPE

TYPE box_type
  nam AS string_type

  row1 AS INTEGER 'location
  col1 AS INTEGER
  row2 AS INTEGER 'row2 not used for button/checkbox. for drop_down, it represents the number of rows in the selection box
  col2 AS INTEGER

  c1 AS _BYTE 'forcolor
  c2 AS _BYTE 'backcolor

  sc1 AS _BYTE 'selected color. -- not always used
  sc2 AS _BYTE

  text_box AS _BYTE '-1 then drawn as textbox (input box) -- always as row2 = row1 + 2
  text AS string_type 'text drawn inside the textbox
  text_position AS INTEGER 'position of the cursor
  text_offset AS INTEGER 'We display the string in the box starting at the text_offset character, to account for scrolling to the right
  hide AS _BYTE 'text will be drawn as "****" instead of "test"

  scroll AS _BYTE 'if -1 then scroll is drawn
  scroll_loc AS INTEGER 'various numbers needed to draw scroll

  multi_text_box AS _BYTE '-1 then drawn as a multiple line text-box (Not editable)
  selected AS INTEGER 'the line that is selected (Will be drawn in sc1,sc2

  length AS INTEGER 'number of options (now use multi_line.length

  offset AS INTEGER 'offset from the beginning that we will draw from
  shadow AS _BYTE 'if -1 then a shadow is drawn around the box

  button AS _BYTE 'if -1 then drawn as button.

  checkbox AS _BYTE 'if -1 then drawn as checkbox
  checked AS _BYTE 'represents checkbox state

  drop_down AS _BYTE 'drawn as drop_down.
  d_flag AS _BYTE 'if d_flag then dropdown box is drawn

  drop_row2 AS INTEGER 'bottom location of dropdown box

  updated AS INTEGER 'if set, then information about this box has been updated

  multi_line AS array_type 'string array for multi-line text boxes
END TYPE

TYPE filedir_type
  'NOTE to myself -- GET RID OF DIR, not needed (Just check the flags, replace DIR in the printing sub, etc..
  dir AS STRING * 3 ' = "DIR" or "LNK" or ""
  nam AS string_type
  flag_cwd AS INTEGER 'dir flag
  flag_retr AS INTEGER 'file flag
  size AS LONG
  lin AS string_type
END TYPE
