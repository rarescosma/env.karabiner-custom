## Credits
- [@rux616](https://github.com/rux616/karabiner-windows-mode) for bundling the Windows Mode repo that this project rips off
- [@TechnicallyDifficult](https://github.com/TechnicallyDifficult) for coming up with the initial json file
- [@alvaro1728](https://github.com/alvaro1728) for creating the current json file and for [asking the question](https://github.com/tekezo/Karabiner-Elements/issues/249) that got this whole thing started
- [@tezeko](https://github.com/tekezo) for Karabiner-Elements
- [@lsissoko](https://github.com/lsissoko) for Ctrl+R and Ctrl+W additions
- [@aperlstein](https://github.com/aperlstein) for adding Ctrl+Enter, Ctrl+Shift+Enter, Ctrl+Space, and for adding Citrix XenAppViewer to list of exceptions
- [@Ivanca](https://github.com/Ivanca) for adding IDEs to list of exceptions
- [@from-nibly](https://github.com/from-nibly) for adding VMware Fusion to list of exceptions
- [@andormarkus](https://github.com/andormarkus) for adding JetBrains PyCharm to list of exceptions

## Links
- Karabiner-Elements [(Homepage)](https://pqrs.org/osx/karabiner/) [(GitHub)](https://github.com/tekezo/Karabiner-Elements)

### Adding Exceptions
When adding exceptions, you will need the applications "bundle identifier". To get this, you can use the following AppleScript ([SuperUser thread](https://superuser.com/q/346369)):

```applescript
osascript -e 'id of app "<application>"'
```

In the above example, `<application>` is the name of the application, such as `Finder` or `Microsoft Excel`.

Once you have the bundle identifier, which will be, for example, `com.microsoft.VSCode` for Microsoft VSCode, you will need to add it to the `bundle.libsonnet` file in the appropriate section. Since VSCode is an IDE, we would add it to the `ides: [ ... ],` section. Make sure to add `^` at the beginning, and `$` at the end of the identifier, and to add `\\` before any periods. (Look in the file and follow the pattern.)

### Testing
For testing, get [Jsonnet](https://jsonnet.org) (I use the [C++ version](https://github.com/google/jsonnet) personally, but a [Go version](https://github.com/google/go-jsonnet) is also available), render the json file locally (`jsonnet -- ./jsonnet/windows_shortcuts.jsonnet >./json/windows_shortcuts.json`) and test it in Karabiner Elements to ensure your changes work how you think they should work.

Once your testing is done, use the following command to ensure your changes are syntactically valid jsonnet and that they are formatted:

```shell
jsonnet -- ./jsonnet/custom_shortcuts.jsonnet >/dev/null && \
  jsonnetfmt -i -- ./jsonnet/*.jsonnet ./jsonnet/lib/*.libsonnet && \
  echo "Checked and formatted!"
```

If you see "Checked and formatted!" then all's good, captain.
