# PriorityAnnouncement
A simple and lightweight priority announcement script for any FiveM server. 

This script was made to help servers get across what kind of priority is going on within their server. Like a vehicle pursuit, or even a bank
robbery! This script helps you get the message across for everybody. 

# Update 1.2.0:
- Update Server. Lua
- - Added a logger to discord that should use an avatar, you should probably set one for yourself in the discord webhook section.
- - Added an SQL function to log into a database for future reference. (Currently non functional.)
- Update Client.Lua
- - Added a no arguments exception to the command.
- Added Import.SQL
- - Creates a database table for the SQL function.
- Added version and version check.lua 
- - This is meant to check the version of the script upon the script starting, however it doesn't seem to be working.

# Known Bugs:
2 known bugs: 
MySQL Async will not call properly (High priority)

Version Checker doesn't start on script start (lowest priority)

# Permissions
The ace perms for this resource is fw.psit, so if you restrict certain things to supervisors, it would look somehting like this:

add_ace group.supervisors "fw.psit" allow

Discord ace perms is highly recommended for the ace perms mechanic, although not required at all.

# Demo/Install Video: 
Demo Video: 
<iframe width="560" height="315" src="https://www.youtube.com/embed/sJjGz97ybvA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
