###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_ftp_brute.nasl 7006 2017-08-25 11:51:20Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Diman Todorov, Vlatko Kosturjak, Ron Bowes
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_summary = "Performs brute force password auditing against FTP servers.

This uses the standard unpwdb username/password list. However, in tests FTP servers are
significantly slower than other servers when responding, so the number of usernames/passwords can be
artificially limited using script arguments.


SYNTAX:

userdb:  The filename of an alternate username database.


unpwdb.timelimit:  The maximum amount of time that any iterator will run
before stopping. The value is in seconds by default and you can follow it
with 'ms', 's', 'm', or 'h' for
milliseconds, seconds, minutes, or hours. For example,
'unpwdb.timelimit=30m' or 'unpwdb.timelimit=.5h' for
30 minutes. The default depends on the timing template level (see the module
description). Use the value '0' to disable the time limit.


unpwdb.userlimit:  The maximum number of usernames
'usernames' will return (default unlimited).


passdb:  The filename of an alternate password database.


passlimit:  The number of passwords to try (default: unlimited).


userlimit:  The number of user accounts to try (default: unlimited).


limit:      Set 'userlimlt' and 'passlimit' at the same time.


unpwdb.passlimit:  The maximum number of passwords
'passwords' will return (default unlimited).";

if(description)
{
    script_id(803500);
    script_version("$Revision: 7006 $");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name:"last_modification", value:"$Date: 2017-08-25 13:51:20 +0200 (Fri, 25 Aug 2017) $");
    script_tag(name:"creation_date", value:"2013-02-28 18:59:49 +0530 (Thu, 28 Feb 2013)");
    script_name("Nmap NSE 6.01: ftp-brute");


    script_category(ACT_ATTACK);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE");

    script_add_preference(name:"userdb", value:"", type:"entry");
    script_add_preference(name:"unpwdb.timelimit", value:"", type:"entry");
    script_add_preference(name:"unpwdb.userlimit", value:"", type:"entry");
    script_add_preference(name:"passdb", value:"", type:"entry");
    script_add_preference(name:"passlimit", value:"", type:"entry");
    script_add_preference(name:"userlimit", value:"", type:"entry");
    script_add_preference(name:"limit", value:"", type:"entry");
    script_add_preference(name:"unpwdb.passlimit", value:"", type:"entry");

    script_dependencies("toolcheck.nasl");
    script_mandatory_keys("Tools/Present/nmap6.01");
    script_mandatory_keys("Tools/Launch/nmap_nse");

    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);


# Get the preferences
i = 0;

## Get FTP Ports
port = get_kb_item("Services/ftp");
if(!port){
  exit(0);
}

pref = script_get_preference("userdb");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'userdb', '=', pref, '"');
}
pref = script_get_preference("unpwdb.timelimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unpwdb.timelimit', '=', pref, '"');
}
pref = script_get_preference("unpwdb.userlimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unpwdb.userlimit', '=', pref, '"');
}
pref = script_get_preference("passdb");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'passdb', '=', pref, '"');
}
pref = script_get_preference("passlimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'passlimit', '=', pref, '"');
}
pref = script_get_preference("userlimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'userlimit', '=', pref, '"');
}
pref = script_get_preference("limit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'limit', '=', pref, '"');
}
pref = script_get_preference("unpwdb.passlimit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unpwdb.passlimit', '=', pref, '"');
}

argv = make_list("nmap", "--script=ftp-brute", "-p", port, get_host_ip());

if(i > 0)
{
  scriptArgs= "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv,scriptArgs);
}

## Run nmap and Get the Result
res = pread(cmd: "nmap", argv: argv);

if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg, port:port);
    }
  }

  if("ftp-brute" >< result) {
    msg = string('Result found by Nmap Security Scanner (ftp-brute.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
