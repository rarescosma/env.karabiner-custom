//---------//
// IMPORTS //
//---------//

local bundle = import 'lib/bundle.libsonnet';
local k = import 'lib/karabiner.libsonnet';


//------//
// MAIN //
//------//

{
  title: 'Karabiner Custom Shortcuts',
  rules: [
    // Command + <...> to Ctrl + <...>
    k.rule(
      "cmd + " + capture + " to ctrl + " + capture,
      k.input(capture, ['command']),
      k.outputKey(capture, ['control']),
      k.condition('if', bundle.terminalEmulators)
    ) for capture in ["c", "l", "d", "a", "z", "e", "r", "t"]],
}
