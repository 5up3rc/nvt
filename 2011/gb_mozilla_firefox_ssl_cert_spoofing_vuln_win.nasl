###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_ssl_cert_spoofing_vuln_win.nasl 7024 2017-08-30 11:51:43Z teissa $
#
# Mozilla Firefox SSL Certificate Spoofing Vulnerability (Windows)
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

tag_impact = "Successful exploitation will allow remote attackers to perform
phishing-style attacks by bypassing security warnings when invalid certificates
are used in SSL HTTP connections.

Impact Level: Application";

tag_affected = "Mozilla Firefox versions 4.0.x through 4.0.1";

tag_insight = "The flaw is due to improper handling of validation/revalidation of
'SSL' certificates. When re-loading the browser and visiting the page, the
untrusted connection warning would appear, but incorrectly indicates that the
site provides a valid, verified certificate and there is no way to confirm the
exception.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is installed with Mozilla Firefox and is prone to SSL
certificate spoofing vulnerability.";

if(description)
{
  script_id(802100);
  script_version("$Revision: 7024 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-30 13:51:43 +0200 (Wed, 30 Aug 2017) $");
  script_tag(name:"creation_date", value:"2011-06-13 15:28:04 +0200 (Mon, 13 Jun 2011)");
  script_cve_id("CVE-2011-0082");
  script_bugtraq_id(48064);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Mozilla Firefox SSL Certificate Spoofing Vulnerability (Windows)");
  script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=709165");
  script_xref(name : "URL" , value : "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=627552");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_require_keys("Firefox/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

## Firefox Check
ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  ## Grep for Firefox versions 4.x through 4.0.1
  if(version_in_range(version:ffVer, test_version:"4.0", test_version2:"4.0.1")){
    security_message(0);
  }
}
