###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_mult_vuln_win_sep11.nasl 5085 2017-01-24 11:32:37Z cfi $
#
# PHP Multiple Vulnerabilities - Sep11 (Windows)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
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

CPE = "cpe:/a:php:php";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802330");
  script_version("$Revision: 5085 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-24 12:32:37 +0100 (Tue, 24 Jan 2017) $");
  script_tag(name:"creation_date", value:"2011-09-07 08:36:57 +0200 (Wed, 07 Sep 2011)");
  script_cve_id("CVE-2011-2483", "CVE-2011-1657", "CVE-2011-3182", "CVE-2011-3267",
                "CVE-2011-3268");
  script_bugtraq_id(49241, 49252);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("PHP Multiple Vulnerabilities - Sep11 (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("os_detection.nasl","gb_php_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed","Host/runs_windows");

  script_xref(name:"URL", value:"http://secunia.com/advisories/44874/");
  script_xref(name:"URL", value:"http://www.php.net/archive/2011.php#id2011-08-18-1");

  tag_impact = "Successful exploitation allows remote attackers to execute arbitrary code,
  obtain sensitive information or cause a denial of service.

  Impact Level: Application";

  tag_affected = "PHP version prior to 5.3.7 on Windows";

  tag_insight = "Multiple flaws are due to,
  - Improper handling of passwords with 8-bit characters by 'crypt_blowfish'
    function.
  - An error in 'ZipArchive::addGlob' and 'ZipArchive::addPattern' functions
    in ext/zip/php_zip.c file allows remote attackers to cause denial of
    service via certain flags arguments.
  - Improper validation of the return values of the malloc, calloc and realloc
    library functions.
  - Improper implementation of the error_log function.";

  tag_solution = "Upgrade to PHP version 5.3.7 or later.
  For updates refer to http://www.php.net/downloads.php";

  tag_summary = "This host is running PHP and is prone to multiple vulnerabilities.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## If its not windows exit
if(host_runs("windows") != "yes"){
  exit(0);
}

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

##To check PHP version prior to 5.3.7
if(version_is_less(version:phpVer, test_version:"5.3.7")){
  report = report_fixed_ver(installed_version:phpVer, fixed_version:"5.3.7");
  security_message(data:report, port:phpPort);
  exit(0);
}

exit(99);
