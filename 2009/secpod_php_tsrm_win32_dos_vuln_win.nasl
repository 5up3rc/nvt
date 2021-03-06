###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_php_tsrm_win32_dos_vuln_win.nasl 5077 2017-01-24 10:51:38Z cfi $
#
# PHP 'tsrm_win32.c' Denial Of Service Vulnerability (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

CPE = "cpe:/a:php:php";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900872");
  script_version("$Revision: 5077 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-24 11:51:38 +0100 (Tue, 24 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-09-29 09:16:03 +0200 (Tue, 29 Sep 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2009-3294");
  script_bugtraq_id(36449);
  script_name("PHP 'tsrm_win32.c' Denial Of Service Vulnerability (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Denial of Service");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed");

  script_xref(name:"URL", value:"http://en.securitylab.ru/nvd/383831.php");
  script_xref(name:"URL", value:"http://downloads.securityfocus.com/vulnerabilities/exploits/31064.php");

  tag_impact = "Successful exploitation will allow attackers to cause Denial of Service in
  the victim's system.

  Impact Level: Application";

  tag_affected = "PHP version prior to 5.2.11 on Windows.";

  tag_insight = "An error occurs in popem 'API' function in TSRM/tsrm_win32.c, when running on
  certain Windows operating systems. It can be caused via a crafted 'e' or 'er'
  string in the second argument (aka mode), possibly related to the '_fdopen'
  function in the Microsoft C runtime library.";

  tag_solution = "Upgrade to version 5.2.11 or later
  http://www.php.net/downloads.php";

  tag_summary = "This host is running PHP and is prone to Denial of Service
  vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## exit, if its not Windows
if( host_runs( "Windows" ) != "yes" ) exit( 0 );

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

# Check for PHP version 5.2.11
if( version_is_less( version:phpVer, test_version:"5.2.11" ) ) {
  report = report_fixed_ver( installed_version:phpVer, fixed_version:"5.2.11" );
  security_message( data:report, port:phpPort );
  exit( 0 );
}

exit( 99 );