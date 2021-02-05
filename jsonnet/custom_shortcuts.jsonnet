local bundle = import 'lib/bundle.libsonnet';
local k = import 'lib/karabiner.libsonnet';

{
  title: "Custom Shortcuts",
  rules: [
    k.rule(
      "Left Cmd -> Opt",
      k.input("left_command"),
      k.outputKey("left_option")
    ),
    k.rule(
      "Left Opt -> Ctrl",
      k.input("left_option"),
      k.outputKey("left_control")
    ),
    k.rule(
      "Left Ctrl -> Cmd",
      k.input("left_control"),
      k.outputKey("left_command")
    ),
    k.rule(
      "Right Opt -> Cmd",
      k.input("right_option"),
      k.outputKey("right_command")
    ),
    k.rule(
      "Right Cmd -> Opt / Backspace",
      k.input("right_command"),
      k.outputKey("left_option"), 
      k.outputKey("delete_or_backspace", output_type="to_if_alone") 
    ),
    k.rule(
      "Caps -> Cmd / Escape",
      k.input("caps_lock"),
      k.outputKey("left_command"), 
      k.outputKey("escape", output_type="to_if_alone") 
    )
  ] + [
    k.rule(
      "cmd + " + capture + " to ctrl + " + capture,
      k.input(capture, ['command']),
      k.outputKey(capture, ['control']),
      condition=k.condition('if', bundle.terminalEmulators)
    ) for capture in ["c", "d", "a", "z", "e", "r", "t"]
  ] + [
    k.rule(
      "Opt + " + _.left + " -> " + _.right,
      k.input(_.left, ['option']),
      k.outputKey(_.right),
      condition=k.condition('unless', bundle.terminalEmulators)
    ) for _ in [
      k.tuple("h", "left_arrow"), 
      k.tuple("j", "down_arrow"), 
      k.tuple("k", "up_arrow"), 
      k.tuple("l", "right_arrow")
    ]
  ]
}
