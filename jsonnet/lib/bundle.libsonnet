{
  // external device vendors
  external_keyboards : [
    {vendor_id: 1241},
    {vendor_id: 1267}
  ],

  // internal device vendors
  internal_keyboards: [
    {is_built_in_keyboard: true}
  ],

  // bundle identifiers for hypervisor applications
  hypervisors: [
    '^org\\.virtualbox\\.app\\.VirtualBoxVM$',
    '^org\\.vmware\\.fusion$',
    '^com\\.parallels\\.desktop\\.console$',
  ],

  // bundle identifiers for IDE applications
  ides: [
    '^com\\.microsoft\\.VSCode$',
    '^com\\.jetbrains\\.intellij\\.ce$',
    '^com\\.jetbrains\\.intellij$',
    '^com\\.jetbrains\\.pycharm$',
    '^com\\.sublimetext\\.3$',
  ],

  // bundle identifiers for remote desktop applications
  remoteDesktops: [
    '^com\\.microsoft\\.rdc\\.macos$',
    '^com\\.citrix\\.XenAppViewer$',
  ],

  // bundle identifiers for terminal emulator applications
  terminalEmulators: [
    '^com\\.apple\\.Terminal$',
    '^com\\.googlecode\\.iterm2$',
    '^co\\.zeit\\.hyper$',
    '^org\\.alacritty$',
  ],

  // bundle identifiers for web browser applications
  webBrowsers: [
    '^org\\.mozilla\\.firefox$',
    '^com\\.google\\.Chrome$',
    '^com\\.brave\\.Browser$',
  ],

  // since this combination is used so much, it's given its own identifier
  standard:
    $.terminalEmulators +
    $.hypervisors +
    $.ides +
    $.remoteDesktops +
    [],  // unnecessary, but it allows '$.foo +' for all lines, which makes my OCD happy
}
