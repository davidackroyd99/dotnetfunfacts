This fact was actually created before the date listed, but the metadata system was not created until 08/03/2020.

!meta

title:Windows File System Case Sensitivity
url:case-sensitivity-files
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:Windows

!endmeta

NTFS, the default Windows file system, is a case sensitive file system - this means that it would treat myfile.txt and MyFile.TXT as two different files. However, the Windows API abstracts NTFS to make it appear as though it is case insensitive. For example, if you had myfile.txt already in a directory, Windows would not allow you to make a file called MyFile.TXT in that directory or move one in there without renaming it or replacing the original.

This matters to .NET Core developers working on Linux because Windows contributors to a git repository will have all sorts of issues with same name but different case files (you can actually enable a feature in developer mode to deal with this issue [here](https://www.howtogeek.com/354220/how-to-enable-case-sensitive-folders-on-windows-10/) if you run into this issue). Most Linux file systems also allow colons to appear in file names, but Windows won't because colons are used for drive letters - another common gotcha.
