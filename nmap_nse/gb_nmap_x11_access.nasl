###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_x11_access.nasl 7006 2017-08-25 11:51:20Z teissa $
#
# Wrapper for Nmap X11 Access NSE script.
#
# Authors:
# NSE-Script: vladz
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

tag_summary = "This script attempts to check if you are allowed to connect to
  the X server.

  This is a wrapper on the Nmap Security Scanner's (http://nmap.org) x11-access.nse.";


if(description)
{
  script_id(801698);
  script_version("$Revision: 7006 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-25 13:51:20 +0200 (Fri, 25 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-01-10 13:49:23 +0100 (Mon, 10 Jan 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Nmap NSE: X11 Access");
  script_category(ACT_GATHER_INFO);
    script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");

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

## Run nmap and Get the result
res = pread(cmd: "nmap", argv: make_list("nmap", "--script=x11-access.nse",
                                          get_host_ip()));
if(res)
{
  foreach line (split(res))
  {
    ## Get Port
    if(port = eregmatch(pattern:"^([0-9]+)/tcp",string:line))
    {
      xPort = port[1];
      result = NULL;
      continue;
    }

    if(ereg(pattern:"^\|",string:line))
    {
      result += substr(chomp(line),2);
      if("x11-access" >< result)
      {
        msg = string('Result found by Nmap Security Scanner (x11-access.nse) ',
                'http://nmap.org:\n\n', result);
        security_message(data : msg, port:xPort);
      }
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg);
    }
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data : msg);
}
