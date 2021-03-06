# GDB

## MacOS installation

- [https://sourceware.org/gdb/wiki/PermissionsDarwin](https://sourceware.org/gdb/wiki/PermissionsDarwin)

1. Open Keychain Access
2. In menu, open **Keychain Access > Certificate Assistant > Create a certificate**
3. Give it a name (e.g. `gdb-cert`)
  + Identity type: Self Signed Root
  + Certificate type: Code Signing
  + Check: let me override defaults
4. Continue until "specify a location for..."
5. Set Keychain location to System
6. Create certificate and close Certificate Assistant.
7. Find certificate in System keychain.
8. Double click certificate
9. Expand **Trust**, set **Code signing** to `always trust`
10. Restart taskgated in terminal: `killall taskgated`
11. Codesign gdb using your certificate: `codesign --entitlements gdb-entitlement.xml -fs gdb-cert $(which gdb)`
12. Reboot your Mac. Debugging with gdb should now work as expected.
