Blockly.Blocks["minetest_add_node"] =
  init: ->
    @appendValueInput("material")
      .setCheck("String")
      .appendField("place")
    @appendValueInput("x")
      .setCheck("Number")
      .appendField("x")
    @appendValueInput("y")
      .setCheck("Number")
      .appendField("y")
    @appendValueInput("z")
      .setCheck("Number")
      .appendField("z")
    @setInputsInline(true)
    @setPreviousStatement(true, "null")
    @setNextStatement(true, "null")
    @setColour(45)
    @setTooltip("Create a minetest block of a given material, at coordinates x, y, z")


Blockly.JavaScript["minetest_add_node"] = (block) ->
  material = Blockly.JavaScript.valueToCode(
    block, "material", Blockly.JavaScript.ORDER_ATOMIC).slice(1,-1) || "air"
  x = Blockly.JavaScript.valueToCode(
    block, "x", Blockly.JavaScript.ORDER_ATOMIC) || 0
  y = Blockly.JavaScript.valueToCode(
    block, "y", Blockly.JavaScript.ORDER_ATOMIC) || 0
  z = Blockly.JavaScript.valueToCode(
    block, "z", Blockly.JavaScript.ORDER_ATOMIC) || 0
  code = "createblock('#{material}', #{x}, #{y}, #{z});\n"
  return code


Blockly.Blocks["minetest_add_text_node"] =
  init: ->
    @appendDummyInput()
      .appendField("text to")
      .appendField(new Blockly.FieldDropdown([
        ["place", "createtextblock"],
        ["delete", "deletetextblock"],
      ]), "COMMAND")
      .appendField(new Blockly.FieldTextInput("text"), "TEXT")
    @appendValueInput("x")
      .setCheck("Number")
      .appendField("x")
    @appendValueInput("y")
      .setCheck("Number")
      .appendField("y")
    @appendValueInput("z")
      .setCheck("Number")
      .appendField("z")
    @appendValueInput("dx")
      .setCheck("Number")
      .appendField("dx")
    @appendValueInput("dy")
      .setCheck("Number")
      .appendField("dy")
    @appendValueInput("dz")
      .setCheck("Number")
      .appendField("dz")
    @setInputsInline(true)
    @setPreviousStatement(true, "null")
    @setNextStatement(true, "null")
    @setColour(45)


Blockly.JavaScript["minetest_add_text_node"] = (block) ->
  text = block.getFieldValue("TEXT")
  command = block.getFieldValue("COMMAND")
  x = Blockly.JavaScript.valueToCode(
    block, "x", Blockly.JavaScript.ORDER_ATOMIC) || 0
  y = Blockly.JavaScript.valueToCode(
    block, "y", Blockly.JavaScript.ORDER_ATOMIC) || 0
  z = Blockly.JavaScript.valueToCode(
    block, "z", Blockly.JavaScript.ORDER_ATOMIC) || 0
  dx = Blockly.JavaScript.valueToCode(
    block, "dx", Blockly.JavaScript.ORDER_ATOMIC) || 0
  dy = Blockly.JavaScript.valueToCode(
    block, "dy", Blockly.JavaScript.ORDER_ATOMIC) || 0
  dz = Blockly.JavaScript.valueToCode(
    block, "dz", Blockly.JavaScript.ORDER_ATOMIC) || 0
  code = "#{command}('#{text}', #{x}, #{y}, #{z}, #{dx}, #{dy}, #{dz})"
  return code


Blockly.Blocks["minetest_add_entity"] =
  init: ->
    @appendDummyInput()
      .appendField("spawn")
    @appendValueInput("entity")
      .setCheck("String")
      .appendField("entity")
    @appendValueInput("x")
      .setCheck("Number")
      .appendField("x")
    @appendValueInput("y")
      .setCheck("Number")
      .appendField("y")
    @appendValueInput("z")
      .setCheck("Number")
      .appendField("z")
    @appendStatementInput("ACTIONS")
      .setCheck(null)
    @setInputsInline(true)
    @setColour(120)


Blockly.JavaScript["minetest_add_entity"] = (block) ->
  x = Blockly.JavaScript.valueToCode(
    block, "x", Blockly.JavaScript.ORDER_ATOMIC) || 0
  y = Blockly.JavaScript.valueToCode(
    block, "y", Blockly.JavaScript.ORDER_ATOMIC) || 0
  z = Blockly.JavaScript.valueToCode(
    block, "z", Blockly.JavaScript.ORDER_ATOMIC) || 0
  entity = Blockly.JavaScript.valueToCode(
    block, "entity", Blockly.JavaScript.ORDER_ATOMIC).slice(1,-1)
  actions = Blockly.JavaScript.statementToCode(block, "ACTIONS")
  code = "var actions = function() {\n#{actions}}\n"
  code += "spawnEntity(#{x}, #{y}, #{z}, '#{entity}', actions);\n"
  return code


Blockly.Blocks["minetest_move_forward"] =
  init: ->
    @appendDummyInput()
      .appendField("move forward")
    @setPreviousStatement(true, null)
    @setNextStatement(true, null)
    @setColour(185)


Blockly.JavaScript["minetest_move_forward"] = (block) ->
  "moveForward();\n"


Blockly.Blocks['minetest_turn'] =
  init: ->
    @appendDummyInput()
      .appendField("turn")
      .appendField(new Blockly.FieldDropdown([
        ["left", "turnLeft();"]
        ["right", "turnRight();"]
      ]), "ACTION")
    @setPreviousStatement(true, null)
    @setNextStatement(true, null)
    @setColour(185)


Blockly.JavaScript["minetest_turn"] = (block) ->
  "#{block.getFieldValue('ACTION')}\n"


Blockly.Blocks['minetest_wait'] =
  init: ->
    @appendDummyInput()
      .appendField("wait")
    @appendValueInput("seconds")
      .setCheck("Number")
    @appendDummyInput()
      .appendField("seconds")
    @setInputsInline(true)
    @setPreviousStatement(true, null)
    @setNextStatement(true, null)
    @setColour(185)


Blockly.JavaScript["minetest_wait"] = (block) ->
  seconds = Blockly.JavaScript.valueToCode(
    block, "seconds", Blockly.JavaScript.ORDER_ATOMIC) || 0
  "wait(#{seconds});\n"


Blockly.Blocks['minetest_play_sound'] =
  init: ->
    @appendDummyInput()
      .appendField("play sound")
    @setPreviousStatement(true, null)
    @setNextStatement(true, null)
    @setColour(185)


Blockly.JavaScript["minetest_play_sound"] = (block) ->
  "playSound();\n"


# TODO
for language in [
  "Python"
  "PHP"
  "Lua"
  "Dart"
]
  Blockly[language]["minetest_add_node"] = (block) ->
    ""

  Blockly[language]["minetest_add_text_node"] = (block) ->
    ""

  Blockly[language]["minetest_add_entity"] = (block) ->
    ""

  Blockly[language]["minetest_move_forward"] = (block) ->
    ""

  Blockly[language]["minetest_turn"] = (block) ->
    ""

  Blockly[language]["minetest_wait"] = (block) ->
    ""

  Blockly[language]["minetest_play_sound"] = (block) ->
    ""