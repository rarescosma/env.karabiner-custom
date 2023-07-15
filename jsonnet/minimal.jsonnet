local bundle = import 'lib/bundle.libsonnet';
local k = import 'lib/karabiner.libsonnet';

{
  title: "Custom Shortcuts",
  rules: [
    // ========= Builtin ===========
    k.rule(
      "Section -> Backtick",
      k.input("non_us_backslash"),
      k.outputKey("grave_accent_and_tilde"),
      condition=k.vendor(bundle.internal_keyboards)
    ),
    k.rule(
      "Shift + Section -> Tilde",
      k.input("non_us_backslash", modifiers=["shift"]),
      k.outputKey("grave_accent_and_tilde"),
      condition=k.vendor(bundle.internal_keyboards)
    ),
    k.rule(
      "Left Cmd -> Opt",
      k.input("left_command"),
      k.outputKey("left_option"),
      condition=k.vendor(bundle.internal_keyboards)
    ),
    k.rule(
      "Left Opt -> Fn",
      k.input("left_option"),
      k.outputKey("fn"),
      condition=k.vendor(bundle.internal_keyboards)
    ),
    k.rule(
      "Right Opt -> Cmd",
      k.input("right_option"),
      k.outputKey("right_command"),
      condition=k.vendor(bundle.internal_keyboards)
    ),
    k.rule(
      "Right Cmd -> Opt / Backspace",
      k.input("right_command"),
      k.outputKey("left_option"),
      k.outputKey("delete_or_backspace", output_type="to_if_alone"),
      condition=k.vendor(bundle.internal_keyboards)
    ),
    k.rule(
      "Caps -> Cmd / Escape (non-IDE)",
      k.input("caps_lock"),
      k.outputKey("left_command"),
      k.outputKey("escape", output_type="to_if_alone"),
      condition=k.condition('unless', bundle.ides)
    ),
    k.rule(
      "Caps -> Ctrl / Escape (IDE)",
      k.input("caps_lock"),
      k.outputKey("left_control"),
      k.outputKey("escape", output_type="to_if_alone"),
      condition=k.condition('if', bundle.ides)
    ),
    k.rule(
      "Cmd + Q -> Quick Docu",
      k.input("q", ['command']),
      k.outputKey("q", ['control', 'shift']),
      condition=k.condition('if', bundle.ides)
    ),
    k.rule(
      "Cmd + J -> Downloads",
      k.input("j", ['command']),
      k.outputKey("l", ['option', 'command']),
      condition=k.condition('if', bundle.webBrowsers)
    ),
    k.rule(
      "Alt + . -> Right Click",
      k.input("period", ['option']),
      k.outputButton("button2")
    ),
    k.rule(
      "Fn + V -> Super + V",
      k.input("v", ['fn']),
      k.outputKey("v", ["option", "command", "control"])
    ),
    k.rule(
      "F -> Cmd + f (VLC)",
      k.input("f"),
      k.outputKey("f", ["command"]),
      condition=k.condition('if', bundle.vlcPlayer)
    ),
    k.rule(
      "V -> s (VLC)",
      k.input("v"),
      k.outputKey("s"),
      condition=k.condition('if', bundle.vlcPlayer)
    )
  ] + [
    k.rule(
      "cmd + " + capture + " to ctrl + " + capture,
      k.input(capture, ['command']),
      k.outputKey(capture, ['control']),
      condition=k.condition('if', bundle.terminalEmulators)
    ) for capture in [ "a","b","c","d","e","k","j","o","p","q","r","s","t","u","w","z"]
  ] + [
    k.rule(
      "opt + " + index + " to cmd + " + index,
      k.input(index, ['option']),
      k.outputKey(index, ['command']),
      condition=k.condition('if', bundle.webBrowsers)
    ) for index in ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
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
