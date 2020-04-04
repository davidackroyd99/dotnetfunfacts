!meta

title:The Device Is Not Ready
url:device-not-ready
contributors:David Ackroyd
created:2020-3-4
modified:2020-3-4
tags:Windows;Common Mistakes

!endmeta
Sometimes, when attempting to do a file IO operation you might get a weird but persistent Windows API error that just reads 'Device Not Ready'. This happens when you try and write to a drive letter that doesn't exist on the machine. Check your paths carefully!
