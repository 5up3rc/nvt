###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_dhcp_discover.nasl 7000 2017-08-24 11:51:46Z teissa $
#
# Wrapper for Nmap DHCP Discover NSE script.
#
# Authors:
# NSE-Script: Ron Bowes
# NASL-Wrapper: Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# NASL-Wrapper: Copyright (c) 2010 Greenbone Networks GmbH (http://www.greenbone.net)
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

tag_summary = "This script attempts to retrieve information from a DHCP server
  by sending a DHCPDISCOVER request.

  This is a wrapper on the Nmap Security Scanner's (http://nmap.org) dhcp-discover.nse.";


if(description)
{
  script_id(801693);
  script_version("$Revision: 7000 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-24 13:51:46 +0200 (Thu, 24 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-01-06 14:34:14 +0100 (Thu, 06 Jan 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Nmap NSE: DHCP Discover");
  script_category(ACT_GATHER_INFO);
    script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_add_preference(name: "randomize_mac :", value: "",type: "entry");
  script_add_preference(name: "fake_requests :", value: "",type: "entry");
  script_add_preference(name: "requests :", value: "",type: "entry");
  script_add_preference(name: "dhcptype :", value: "",type: "entry");

  script_mandatory_keys("Tools/Present/nmap");
  script_mandatory_keys("Tools/Launch/nmap_nse");
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


## Required Keys
if((! get_kb_item("Tools/Present/nmap5.21") &&
   ! get_kb_item("Tools/Present/nmap5.51")) ||
   ! get_kb_item("Tools/Launch/nmap_nse")) {
 exit(0);
}

## DHCP Port
port = 67;

argv = make_list("nmap", "-sU", "--script=dhcp-discover.nse", "-p", port,
                  get_host_ip());

## Get the preferences
i = 0;
if( pref = script_get_preference("randomize_mac :")){
  args[i++] = "randomize_mac="+pref;
}

if( pref = script_get_preference("fake_requests :")){
  args[i++] = "fake_requests="+pref;
}

if( pref = script_get_preference("requests :")){
  args[i++] = "requests="+pref;
}

if( pref = script_get_preference("dhcptype :")){
  args[i++] = "dhcptype="+pref;
}

if(i > 0)
{
  scriptArgs= "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv,scriptArgs);
}

## Run nmap and Get the result
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

  if("dhcp-discover" >< result) {
    msg = string('Result found by Nmap Security Scanner (dhcp-discover.nse) ',
                 'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data : msg, port:port);
}
