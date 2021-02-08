local bundle = import 'lib/bundle.libsonnet';
local k = import 'lib/karabiner.libsonnet';

{
  title: "Custom Shortcuts",
  rules: [
    // ========= External ==========
    k.rule(
      "Left Cmd -> Ctrl (external)",
      k.input("left_command"),
      k.outputKey("left_control"),
      condition=k.vendor(bundle.external_keyboards)
    ),
    k.rule(
      "Left Ctrl -> Cmd (external)",
      k.input("left_control"),
      k.outputKey("left_command"),
      condition=k.vendor(bundle.external_keyboards)
    ),
    k.rule(
      "Right Opt -> Backspace (external)",
      k.input("right_option"),
      k.outputKey("right_option"),
      k.outputKey("delete_or_backspace", output_type="to_if_alone"),
      condition=k.vendor(bundle.external_keyboards)
    ),
    k.rule(
      "Right Cmd -> Ctrl (external)",
      k.input("right_command"),
      k.outputKey("right_control"),
      condition=k.vendor(bundle.external_keyboards)
    ),
    k.rule(
      "Right Ctrl -> Cmd (external)",
      k.input("right_control"),
      k.outputKey("right_command"),
      condition=k.vendor(bundle.external_keyboards)
    ),
    // ========= Builtin ===========
    k.rule(
      "Left Cmd -> Opt",
      k.input("left_command"),
      k.outputKey("left_option"),
      condition=k.vendor(bundle.internal_keyboards)
    ),
    k.rule(
      "Left Opt -> Ctrl",
      k.input("left_option"),
      k.outputKey("left_control"),
      condition=k.vendor(bundle.internal_keyboards)
    ),
    k.rule(
      "Left Ctrl -> Cmd",
      k.input("left_control"),
      k.outputKey("left_command"),
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
