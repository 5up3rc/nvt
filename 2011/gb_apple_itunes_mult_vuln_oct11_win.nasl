###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_itunes_mult_vuln_oct11_win.nasl 7006 2017-08-25 11:51:20Z teissa $
#
# Apple iTunes Multiple Vulnerabilities - Oct 11
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could allow attackers to execute arbitrary code in
  the context of the user running the affected application. Failed attacks may
  cause denial of service conditions.
  Impact Level: System/Application";
tag_affected = "Apple iTunes version prior to 10.5 (10.5.0.142) on Windows";
tag_insight = "For more details about the vulnerabilities refer to the links given below.";
tag_solution = "Upgrade to Apple Apple iTunes version 10.5 or later,
  For updates refer to http://www.apple.com/itunes/download/";
tag_summary = "This host is installed with Apple iTunes and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(802193);
  script_version("$Revision: 7006 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-25 13:51:20 +0200 (Fri, 25 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-10-20 08:43:23 +0200 (Thu, 20 Oct 2011)");
  script_cve_id("CVE-2011-0259", "CVE-2011-0200", "CVE-2011-3252", "CVE-2011-3219",
                "CVE-2011-0204", "CVE-2011-0215", "CVE-2010-1823", "CVE-2011-0164",
                "CVE-2011-0218", "CVE-2011-0221", "CVE-2011-0222", "CVE-2011-0223",
                "CVE-2011-0225", "CVE-2011-0232", "CVE-2011-0233", "CVE-2011-0234",
                "CVE-2011-0235", "CVE-2011-0237", "CVE-2011-0238", "CVE-2011-0240",
                "CVE-2011-0253", "CVE-2011-0254", "CVE-2011-0255", "CVE-2011-0981",
                "CVE-2011-0983", "CVE-2011-1109", "CVE-2011-1114", "CVE-2011-1115",
                "CVE-2011-1117", "CVE-2011-1121", "CVE-2011-1188", "CVE-2011-1203",
                "CVE-2011-1204", "CVE-2011-1288", "CVE-2011-1293", "CVE-2011-1296",
                "CVE-2011-1440", "CVE-2011-1449", "CVE-2011-1451", "CVE-2011-1453",
                "CVE-2011-1457", "CVE-2011-1462", "CVE-2011-1797", "CVE-2011-2338",
                "CVE-2011-2339", "CVE-2011-2341", "CVE-2011-2351", "CVE-2011-2352",
                "CVE-2011-2354", "CVE-2011-2356", "CVE-2011-2359", "CVE-2011-2788",
                "CVE-2011-2790", "CVE-2011-2792", "CVE-2011-2797", "CVE-2011-2799",
                "CVE-2011-2809", "CVE-2011-2811", "CVE-2011-2813", "CVE-2011-2814",
                "CVE-2011-2815", "CVE-2011-2816", "CVE-2011-2817", "CVE-2011-2818",
                "CVE-2011-2820", "CVE-2011-2823", "CVE-2011-2827", "CVE-2011-2831",
                "CVE-2011-3232", "CVE-2011-3233", "CVE-2011-3234", "CVE-2011-3235",
                "CVE-2011-3236", "CVE-2011-3237", "CVE-2011-3238", "CVE-2011-3239",
                "CVE-2011-3241", "CVE-2011-3244", "CVE-2011-1774");
  script_bugtraq_id(50067, 48416, 50065, 50068, 48437, 48825, 43228, 46703,
                    48842, 48843, 48844, 48820, 48845, 48846, 48847, 48823,
                    48848, 48849, 48850, 48827, 48851, 48852, 48853, 46262,
                    46614, 46785, 48854, 48824, 47604, 48855, 48856, 48857,
                    48858, 51032, 48479, 48960, 49279, 49850, 49658, 50066,
                    48840, 47029);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Apple iTunes Multiple Vulnerabilities - Oct 11");
  script_xref(name : "URL" , value : "http://support.apple.com/kb/HT4981");
  script_xref(name : "URL" , value : "http://lists.apple.com/archives/Security-announce/2011//Oct/msg00000.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_apple_itunes_detection_win_900123.nasl");
  script_require_keys("iTunes/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

ituneVer= get_kb_item("iTunes/Win/Ver");
if(!ituneVer){
  exit(0);
}

## Apple iTunes version < 10.5 (10.5.0.142)
if(version_is_less(version:ituneVer, test_version:"10.5.0.142")){
  security_message(0);
}
