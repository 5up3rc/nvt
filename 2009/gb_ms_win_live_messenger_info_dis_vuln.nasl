###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_win_live_messenger_info_dis_vuln.nasl 6532 2017-07-05 07:42:05Z cfischer $
#
# Microsoft Windows Live Messenger Information Disclosure Vulnerability
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could lead to unauthorized information disclosure.
  Impact Level: System/Application";
tag_affected = "Microsoft, Windows Live Messenger Client version 8.5.1302.1018 and prior.";
tag_insight = "The vulnerability is due to field error in IPv4InternalAddrsAndPorts,
  IPv4Internal-Addrs and IPv4Internal-Port headers, which allow to discover
  IP address and port numbers via MSNP15 protocol used over a NAT session.";
tag_solution = "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided
  anymore. General solution options are to upgrade to a newer release,
  disable respective features, remove the product or replace the product by
  another one.
  For updates refer to http://get.live.com/messenger/overview";
tag_summary = "This host has Windows Live Messenger Client installed and is prone
  to Information Disclosure vulnerability.";

if(description)
{
  script_id(800332);
  script_version("$Revision: 6532 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-05 09:42:05 +0200 (Wed, 05 Jul 2017) $");
  script_tag(name:"creation_date", value:"2009-01-08 07:43:30 +0100 (Thu, 08 Jan 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2008-5828");
  script_bugtraq_id(33125);
  script_name("Microsoft Windows Live Messenger Information Disclosure Vulnerability");
  script_xref(name : "URL" , value : "http://securityreason.com/securityalert/4862");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/499624/100/0/threaded");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ms_win_live_messenger_detect.nasl");
  script_mandatory_keys("MS/LiveMessenger/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

lmVer = get_kb_item("MS/LiveMessenger/Ver");
if(!lmVer){
  exit(0);
}

# Grep for the version 8.5.1302.1018 and prior
if(version_is_less_equal(version:lmVer, test_version:"8.5.1302.1018")){
  security_message(0);
}
