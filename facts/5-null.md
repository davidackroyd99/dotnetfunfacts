This fact was actually created before the date listed, but the metadata system was not created until 08/03/2020.

!meta

title:Null Confusion
url:null-confusion
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:C#;Language Fundamentals

!endmeta


### Null Confusion
Null can be confusing, so here is a metaphor that hopefully makes it a bit clearer.

Imagine that you work in a hotel with lots of difference rooms. You have to distribute a load of parcels that have pieces of paper attached to them. If the piece of paper is blank, that doesn't mean that the piece of paper doesn't exist, or that none of the rooms exist, it just means that you can't deliver the parcel.

A reference is like a piece of paper, and a parcel is like a message that is sent to an object - the piece of paper *can* have a room number written on it, but it doesn't *have* to, and the parcel needs to arrive somewhere in order to be delivered. The .NET Framework 'knows' that it has to throw a NullReferenceException when you try to 'use' a 'null object', because the message that you send doesn't have a destination.
