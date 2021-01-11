---
layout: post
title: Android pm 命令使用文档
author: sleticalboy
date: 2021-01-11 15:55:30 +0800
category: android
tags: [tools, android]
---

## adb shell pm 
<pre>
Package manager (package) commands:
  help
    Print this help text.

  path [--user USER_ID] PACKAGE
    Print the path to the .apk of the given PACKAGE.

  dump PACKAGE
    Print various system state associated with the given PACKAGE.

  list features
    Prints all features of the system.

  has-feature FEATURE_NAME [version]
    Prints true and returns exit status 0 when system has a FEATURE_NAME,
    otherwise prints false and returns exit status 1

  list instrumentation [-f] [TARGET-PACKAGE]
    Prints all test packages; optionally only those targeting TARGET-PACKAGE
    Options:
      -f: dump the name of the .apk file containing the test package

  list libraries
    Prints all system libraries.

  list packages [-f] [-d] [-e] [-s] [-3] [-i] [-l] [-u] [-U] 
      [--uid UID] [--user USER_ID] [FILTER]
    Prints all packages; optionally only those whose name contains
    the text in FILTER.  Options are:
      -f: see their associated file
      -d: filter to only show disabled packages
      -e: filter to only show enabled packages
      -s: filter to only show system packages
      -3: filter to only show third party packages
      -i: see the installer for the packages
      -l: ignored (used for compatibility with older releases)
      -U: also show the package UID
      -u: also include uninstalled packages
      --uid UID: filter to only show packages with the given UID
      --user USER_ID: only list packages belonging to the given user

  list permission-groups
    Prints all known permission groups.

  list permissions [-g] [-f] [-d] [-u] [GROUP]
    Prints all known permissions; optionally only those in GROUP.  Options are:
      -g: organize by group
      -f: print all information
      -s: short summary
      -d: only list dangerous permissions
      -u: list only the permissions users will see

  resolve-activity [--brief] [--components] [--user USER_ID] INTENT
    Prints the activity that resolves to the given INTENT.

  query-activities [--brief] [--components] [--user USER_ID] INTENT
    Prints all activities that can handle the given INTENT.

  query-services [--brief] [--components] [--user USER_ID] INTENT
    Prints all services that can handle the given INTENT.

  query-receivers [--brief] [--components] [--user USER_ID] INTENT
    Prints all broadcast receivers that can handle the given INTENT.

  install [-lrtsfdg] [-i PACKAGE] [--user USER_ID|all|current]
       [-p INHERIT_PACKAGE] [--install-location 0/1/2]
       [--originating-uri URI] [---referrer URI]
       [--abi ABI_NAME] [--force-sdk]
       [--preload] [--instantapp] [--full] [--dont-kill]
       [--force-uuid internal|UUID] [--pkg PACKAGE] [-S BYTES] [PATH|-]
    Install an application.  Must provide the apk data to install, either as a
    file path or '-' to read from stdin.  Options are:
      -l: forward lock application
      -R: disallow replacement of existing application
      -t: allow test packages
      -i: specify package name of installer owning the app
      -s: install application on sdcard
      -f: install application on internal flash
      -d: allow version code downgrade (debuggable packages only)
      -p: partial application install (new split on top of existing pkg)
      -g: grant all runtime permissions
      -S: size in bytes of package, required for stdin
      --user: install under the given user.
      --dont-kill: installing a new feature split, don't kill running app
      --originating-uri: set URI where app was downloaded from
      --referrer: set URI that instigated the install of the app
      --pkg: specify expected package name of app being installed
      --abi: override the default ABI of the platform
      --instantapp: cause the app to be installed as an ephemeral install app
      --full: cause the app to be installed as a non-ephemeral full app
      --install-location: force the install location:
          0=auto, 1=internal only, 2=prefer external
      --force-uuid: force install on to disk volume with given UUID
      --force-sdk: allow install even when existing app targets platform
          codename but new one targets a final API level

  install-create [-lrtsfdg] [-i PACKAGE] [--user USER_ID|all|current]
       [-p INHERIT_PACKAGE] [--install-location 0/1/2]
       [--originating-uri URI] [---referrer URI]
       [--abi ABI_NAME] [--force-sdk]
       [--preload] [--instantapp] [--full] [--dont-kill]
       [--force-uuid internal|UUID] [--pkg PACKAGE] [-S BYTES]
    Like "install", but starts an install session.  Use "install-write"
    to push data into the session, and "install-commit" to finish.

  install-write [-S BYTES] SESSION_ID SPLIT_NAME [PATH|-]
    Write an apk into the given install session.  If the path is '-', data
    will be read from stdin.  Options are:
      -S: size in bytes of package, required for stdin

  install-commit SESSION_ID
    Commit the given active install session, installing the app.

  install-abandon SESSION_ID
    Delete the given active install session.

  set-install-location LOCATION
    Changes the default install location.  NOTE this is only intended for debugging;
    using this can cause applications to break and other undersireable behavior.
    LOCATION is one of:
    0 [auto]: Let system decide the best location
    1 [internal]: Install on internal device storage
    2 [external]: Install on external media

  get-install-location
    Returns the current install location: 0, 1 or 2 as per set-install-location.

  move-package PACKAGE [internal|UUID]

  move-primary-storage [internal|UUID]

  pm uninstall [-k] [--user USER_ID] [--versionCode VERSION_CODE] PACKAGE [SPLIT]
    Remove the given package name from the system.  May remove an entire app
    if no SPLIT name is specified, otherwise will remove only the split of the
    given app.  Options are:
      -k: keep the data and cache directories around after package removal.
      --user: remove the app from the given user.
      --versionCode: only uninstall if the app has the given version code.

  clear [--user USER_ID] PACKAGE
    Deletes all data associated with a package.

  enable [--user USER_ID] PACKAGE_OR_COMPONENT
  disable [--user USER_ID] PACKAGE_OR_COMPONENT
  disable-user [--user USER_ID] PACKAGE_OR_COMPONENT
  disable-until-used [--user USER_ID] PACKAGE_OR_COMPONENT
  default-state [--user USER_ID] PACKAGE_OR_COMPONENT
    These commands change the enabled state of a given package or
    component (written as "package/class").

  hide [--user USER_ID] PACKAGE_OR_COMPONENT
  unhide [--user USER_ID] PACKAGE_OR_COMPONENT

  suspend [--user USER_ID] TARGET-PACKAGE
    Suspends the specified package (as user).

  unsuspend [--user USER_ID] TARGET-PACKAGE
    Unsuspends the specified package (as user).

  grant [--user USER_ID] PACKAGE PERMISSION
  revoke [--user USER_ID] PACKAGE PERMISSION
    These commands either grant or revoke permissions to apps.  The permissions
    must be declared as used in the app's manifest, be runtime permissions
    (protection level dangerous), and the app targeting SDK greater than Lollipop MR1.

  reset-permissions
    Revert all runtime permissions to their default state.

  set-permission-enforced PERMISSION [true|false]

  get-privapp-permissions TARGET-PACKAGE
    Prints all privileged permissions for a package.

  get-privapp-deny-permissions TARGET-PACKAGE
    Prints all privileged permissions that are denied for a package.

  get-oem-permissions TARGET-PACKAGE
    Prints all OEM permissions for a package.

  set-app-link [--user USER_ID] PACKAGE {always|ask|never|undefined}
  get-app-link [--user USER_ID] PACKAGE

  trim-caches DESIRED_FREE_SPACE [internal|UUID]
    Trim cache files to reach the given free space.

  create-user [--profileOf USER_ID] [--managed] [--restricted] [--ephemeral]
      [--guest] USER_NAME
    Create a new user with the given USER_NAME, printing the new user identifier
    of the user.

  remove-user USER_ID
    Remove the user with the given USER_IDENTIFIER, deleting all data
    associated with that user

  set-user-restriction [--user USER_ID] RESTRICTION VALUE

  get-max-users

  get-max-running-users

  compile [-m MODE | -r REASON] [-f] [-c] [--split SPLIT_NAME]
          [--reset] [--check-prof (true | false)] (-a | TARGET-PACKAGE)
    Trigger compilation of TARGET-PACKAGE or all packages if "-a".  Options are:
      -a: compile all packages
      -c: clear profile data before compiling
      -f: force compilation even if not needed
      -m: select compilation mode
          MODE is one of the dex2oat compiler filters:
            assume-verified
            extract
            verify
            quicken
            space-profile
            space
            speed-profile
            speed
            everything
      -r: select compilation reason
          REASON is one of:
            first-boot
            boot
            install
            bg-dexopt
            ab-ota
            inactive
            shared
      --reset: restore package to its post-install state
      --check-prof (true | false): look at profiles when doing dexopt?
      --secondary-dex: compile app secondary dex files
      --split SPLIT: compile only the given split name

  force-dex-opt PACKAGE
    Force immediate execution of dex opt for the given PACKAGE.

  bg-dexopt-job
    Execute the background optimizations immediately.
    Note that the command only runs the background optimizer logic. It may
    overlap with the actual job but the job scheduler will not be able to
    cancel it. It will also run even if the device is not in the idle
    maintenance mode.

  reconcile-secondary-dex-files TARGET-PACKAGE
    Reconciles the package secondary dex files with the generated oat files.

  dump-profiles TARGET-PACKAGE
    Dumps method/class profile files to
    /data/misc/profman/TARGET-PACKAGE.txt

  snapshot-profile TARGET-PACKAGE [--code-path path]
    Take a snapshot of the package profiles to
    /data/misc/profman/TARGET-PACKAGE[-code-path].prof
    If TARGET-PACKAGE=android it will take a snapshot of the boot image

  set-home-activity [--user USER_ID] TARGET-COMPONENT
    Set the default home activity (aka launcher).

  set-installer PACKAGE INSTALLER
    Set installer package name

  get-instantapp-resolver
    Return the name of the component that is the current instant app installer.

  set-harmful-app-warning [--user <USER_ID>] <PACKAGE> [<WARNING>]
    Mark the app as harmful with the given warning message.

  get-harmful-app-warning [--user <USER_ID>] <PACKAGE>
    Return the harmful app warning message for the given app, if present

  uninstall-system-updates
    Remove updates to all system applications and fall back to their /system version.

<INTENT> specifications include these flags and arguments:
    [-a <ACTION>] [-d <DATA_URI>] [-t <MIME_TYPE>]
    [-c <CATEGORY> [-c <CATEGORY>] ...]
    [-n <COMPONENT_NAME>]
    [-e|--es <EXTRA_KEY> <EXTRA_STRING_VALUE> ...]
    [--esn <EXTRA_KEY> ...]
    [--ez <EXTRA_KEY> <EXTRA_BOOLEAN_VALUE> ...]
    [--ei <EXTRA_KEY> <EXTRA_INT_VALUE> ...]
    [--el <EXTRA_KEY> <EXTRA_LONG_VALUE> ...]
    [--ef <EXTRA_KEY> <EXTRA_FLOAT_VALUE> ...]
    [--eu <EXTRA_KEY> <EXTRA_URI_VALUE> ...]
    [--ecn <EXTRA_KEY> <EXTRA_COMPONENT_NAME_VALUE>]
    [--eia <EXTRA_KEY> <EXTRA_INT_VALUE>[,<EXTRA_INT_VALUE...]]
        (mutiple extras passed as Integer[])
    [--eial <EXTRA_KEY> <EXTRA_INT_VALUE>[,<EXTRA_INT_VALUE...]]
        (mutiple extras passed as List<Integer>)
    [--ela <EXTRA_KEY> <EXTRA_LONG_VALUE>[,<EXTRA_LONG_VALUE...]]
        (mutiple extras passed as Long[])
    [--elal <EXTRA_KEY> <EXTRA_LONG_VALUE>[,<EXTRA_LONG_VALUE...]]
        (mutiple extras passed as List<Long>)
    [--efa <EXTRA_KEY> <EXTRA_FLOAT_VALUE>[,<EXTRA_FLOAT_VALUE...]]
        (mutiple extras passed as Float[])
    [--efal <EXTRA_KEY> <EXTRA_FLOAT_VALUE>[,<EXTRA_FLOAT_VALUE...]]
        (mutiple extras passed as List<Float>)
    [--esa <EXTRA_KEY> <EXTRA_STRING_VALUE>[,<EXTRA_STRING_VALUE...]]
        (mutiple extras passed as String[]; to embed a comma into a string,
         escape it using "\,")
    [--esal <EXTRA_KEY> <EXTRA_STRING_VALUE>[,<EXTRA_STRING_VALUE...]]
        (mutiple extras passed as List<String>; to embed a comma into a string,
         escape it using "\,")
    [-f <FLAG>]
    [--grant-read-uri-permission] [--grant-write-uri-permission]
    [--grant-persistable-uri-permission] [--grant-prefix-uri-permission]
    [--debug-log-resolution] [--exclude-stopped-packages]
    [--include-stopped-packages]
    [--activity-brought-to-front] [--activity-clear-top]
    [--activity-clear-when-task-reset] [--activity-exclude-from-recents]
    [--activity-launched-from-history] [--activity-multiple-task]
    [--activity-no-animation] [--activity-no-history]
    [--activity-no-user-action] [--activity-previous-is-top]
    [--activity-reorder-to-front] [--activity-reset-task-if-needed]
    [--activity-single-top] [--activity-clear-task]
    [--activity-task-on-home] [--activity-match-external]
    [--receiver-registered-only] [--receiver-replace-pending]
    [--receiver-foreground] [--receiver-no-abort]
    [--receiver-include-background]
    [--selector]
    [<URI> | <PACKAGE> | <COMPONENT>]
</pre>
