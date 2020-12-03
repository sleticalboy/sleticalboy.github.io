---
layout: post
title: logcat-doc
author: sleticalboy
date: 2020-12-03 08:18:17
category: android
tags: [android]
---

# Usage of logcat

- options include:
<pre>
  -s              Set default filter to silent. Equivalent to filterspec '*:S'
  -f <file>, --file=<file>               Log to file. Default is stdout
  -r <kbytes>, --rotate-kbytes=<kbytes>
                  Rotate log every kbytes. Requires -f option
  -n <count>, --rotate-count=<count>
                  Sets max number of rotated logs to <count>, default 4
  --id=<id>       If the signature id for logging to file changes, then clear
                  the fileset and continue
  -v <format>, --format=<format>
                  Sets log print format verb and adverbs, where <format> is:
                    brief help long process raw tag thread threadtime time
                  and individually flagged modifying adverbs can be added:
                    color descriptive epoch monotonic printable uid
                    usec UTC year zone
                  Multiple -v parameters or comma separated list of format and
                  format modifiers are allowed.
  -D, --dividers  Print dividers between each log buffer
  -c, --clear     Clear (flush) the entire log and exit
                  if Log to File specified, clear fileset instead
  -d              Dump the log and then exit (don't block)
  -e <expr>, --regex=<expr>
                  Only print lines where the log message matches <expr>
                  where <expr> is a Perl-compatible regular expression
  -m <count>, --max-count=<count>
                  Quit after printing <count> lines. This is meant to be
                  paired with --regex, but will work on its own.
  --print         Paired with --regex and --max-count to let content bypass
                  regex filter but still stop at number of matches.
  -t <count>      Print only the most recent <count> lines (implies -d)
  -t '<time>'     Print most recent lines since specified time (implies -d)
  -T <count>      Print only the most recent <count> lines (does not imply -d)
  -T '<time>'     Print most recent lines since specified time (not imply -d)
                  count is pure numerical, time is 'MM-DD hh:mm:ss.mmm...'
                  'YYYY-MM-DD hh:mm:ss.mmm...' or 'sssss.mmm...' format
  -g, --buffer-size                      Get the size of the ring buffer.
  -G <size>, --buffer-size=<size>
                  Set size of log ring buffer, may suffix with K or M.
  -L, --last      Dump logs from prior to last reboot
  -b <buffer>, --buffer=<buffer>         Request alternate ring buffer, 'main',
                  'system', 'radio', 'events', 'crash', 'default' or 'all'.
                  Multiple -b parameters or comma separated list of buffers are
                  allowed. Buffers interleaved. Default -b main,system,crash.
  -B, --binary    Output the log in binary.
  -S, --statistics                       Output statistics.
  -p, --prune     Print prune white and ~black list. Service is specified as
                  UID, UID/PID or /PID. Weighed for quicker pruning if prefix
                  with ~, otherwise weighed for longevity if unadorned. All
                  other pruning activity is oldest first. Special case ~!
                  represents an automatic quicker pruning for the noisiest
                  UID as determined by the current statistics.
  -P '<list> ...', --prune='<list> ...'
                  Set prune white and ~black list, using same format as
                  listed above. Must be quoted.
  --pid=<pid>     Only prints logs from the given pid.
  --wrap          Sleep for 2 hours or when buffer about to wrap whichever
                  comes first. Improves efficiency of polling by providing
                  an about-to-wrap wakeup.
filterspecs are a series of 
  <tag>[:priority]
where <tag> is a log component tag (or * for all) and priority is:
  V    Verbose (default for <tag>)
  D    Debug (default for '*')
  I    Info
  W    Warn
  E    Error
  F    Fatal
  S    Silent (suppress all output)
'*' by itself means '*:D' and <tag> by itself means <tag>:V.
If no '*' filterspec or -s on command line, all filter defaults to '*:V'.
eg: '*:S <tag>' prints only <tag>, '<tag>:S' suppresses all <tag> log messages.
If not specified on the command line, filterspec is set from ANDROID_LOG_TAGS.
If not specified with -v on command line, format is set from ANDROID_PRINTF_LOG
or defaults to "threadtime"
</pre>
