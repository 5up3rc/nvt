###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_esr_mult_vuln_nov12_macosx.nasl 6079 2017-05-08 09:03:33Z teissa $
#
# Mozilla Thunderbird ESR Multiple Vulnerabilities - November12 (Mac OS X)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to inject scripts and bypass
  certain security restrictions.
  Impact Level: Application";

tag_affected = "Thunderbird ESR version 10.x before 10.0.10 on Mac OS X";
tag_insight = "Multiple errors
  - When handling the 'window.location' object.
  - Within CheckURL() function of the 'window.location' object, which can be
    forced to return the wrong calling document and principal.
  - Within handling of 'Location' object can be exploited to bypass security
    wrapper protection.";
tag_solution = "Upgrade to Thunderbird ESR 10.0.10 or later,
  http://www.mozilla.org/en-US/thunderbird";
tag_summary = "This host is installed with Mozilla Thunderbird ESR and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(803633);
  script_version("$Revision: 6079 $");
  script_cve_id("CVE-2012-4194", "CVE-2012-4195", "CVE-2012-4196");
  script_bugtraq_id(56301, 56302, 56306);
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-08 11:03:33 +0200 (Mon, 08 May 2017) $");
  script_tag(name:"creation_date", value:"2012-11-02 16:08:12 +0530 (Fri, 02 Nov 2012)");
  script_name("Mozilla Thunderbird ESR Multiple Vulnerabilities - November12 (Mac OS X)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/51144");
  script_xref(name : "URL" , value : "http://securitytracker.com/id/1027703");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-90.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("ThunderBird-ESR/MacOSX/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

# Thunderbird Check
tbVer = "";
tbVer = get_kb_item("ThunderBird-ESR/MacOSX/Version");

if(tbVer && tbVer =~ "^10.0")
{
  # Grep for Thunderbird version
  if(version_in_range(version:tbVer, test_version:"10.0", test_version2:"10.0.09"))
  {
    security_message(0);
    exit(0);
  }
}
