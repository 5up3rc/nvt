###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_esr_mult_vuln01_nov12_macosx.nasl 6065 2017-05-04 09:03:08Z teissa $
#
# Mozilla Thunderbird ESR Multiple Vulnerabilities-01 November12 (Mac OS X)
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

tag_impact = "Successful exploitation could allow attackers to inject scripts, bypass
  certain security restrictions, execute arbitrary code in the context of the
  browser.
  Impact Level: System/Application";

tag_affected = "Thunderbird ESR version 10.x before 10.0.11 on Mac OS X";
tag_insight = "- The 'location' property can be accessed through 'top.location' with a
    frame whose name attributes value is set to 'top'.
  - Use-after-free error exists within the functions
    'nsTextEditorState::PrepareEditor', 'gfxFont::GetFontEntry',
    'nsWindow::OnExposeEvent' and 'nsPlaintextEditor::FireClipboardEvent'.
  - An error within the 'evalInSandbox()' when handling the 'location.href'
    property.
  - Error when rendering GIF images.";
tag_solution = "Upgrade to Thunderbird ESR 10.0.11 or later,
  http://www.mozilla.org/en-US/thunderbird";
tag_summary = "This host is installed with Mozilla Thunderbird ESR and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_id(803364);
  script_version("$Revision: 6065 $");
  script_cve_id("CVE-2012-4209", "CVE-2012-4214", "CVE-2012-4215", "CVE-2012-4216",
                "CVE-2012-4201", "CVE-2012-4202", "CVE-2012-4207", "CVE-2012-5842",
                "CVE-2012-5841", "CVE-2012-5829", "CVE-2012-5830", "CVE-2012-5833",
                "CVE-2012-5835", "CVE-2012-5839", "CVE-2012-5840");
  script_bugtraq_id(56629, 56628, 56633, 56634, 56618, 56614, 56632, 56611,
                    56631, 56636, 56641, 56642, 56637, 56635);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-04 11:03:08 +0200 (Thu, 04 May 2017) $");
  script_tag(name:"creation_date", value:"2012-11-26 11:10:03 +0530 (Mon, 26 Nov 2012)");
  script_name("Mozilla Thunderbird ESR Multiple Vulnerabilities-01 November12 (Mac OS X)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/51358");
  script_xref(name : "URL" , value : "http://securitytracker.com/id?1027791");
  script_xref(name : "URL" , value : "http://securitytracker.com/id?1027792");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-91.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-92.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-93.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-100.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-101.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-103.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-105.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2012/mfsa2012-106.html");
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

# Variable Initialization
tbesrVer = "";

# Get version from KB
tbesrVer = get_kb_item("ThunderBird-ESR/MacOSX/Version");

if(tbesrVer && tbesrVer =~ "^10.0")
{
  # Grep for Thunderbird version
  if(version_in_range(version:tbesrVer, test_version:"10.0", test_version2:"10.0.10"))
  {
    security_message(0);
    exit(0);
  }
}
