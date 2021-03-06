###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_use_after_free_vuln_jan15.nasl 4498 2016-11-14 13:59:33Z cfi $
#
# PHP Use-After-Free Remote Code EXecution Vulnerability - Jan15
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805411");
  script_version("$Revision: 4498 $");
  script_cve_id("CVE-2014-8142");
  script_bugtraq_id(71791);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2016-11-14 14:59:33 +0100 (Mon, 14 Nov 2016) $");
  script_tag(name:"creation_date", value:"2015-01-07 10:42:19 +0530 (Wed, 07 Jan 2015)");
  script_name("PHP Use-After-Free Remote Code EXecution Vulnerability - Jan15");

  script_tag(name: "summary" , value:"This host is installed with PHP and is
  prone to use-after-free vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "The flaw is due to Use-after-free
  vulnerability in the process_nested_data function in ext/standard/var
  _unserializer.re in PHP.");

  script_tag(name: "impact" , value: "Successful exploitation will allow remote
  attackers to execute arbitrary code via a crafted unserialize call.

  Impact Level: Application");

  script_tag(name: "affected" , value: "PHP versions 5.4.x before 5.4.36,
  5.5.x before 5.5.20 and 5.6.x before 5.6.4");

  script_tag(name: "solution" , value: "Upgrade to PHP version 5.4.36
  or 5.5.20 or 5.6.4 or later");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://php.net/ChangeLog-5.php");
  script_xref(name:"URL", value:"http://secunia.com/advisories/60920");
  script_xref(name:"URL", value:"https://bugs.php.net/bug.php?id=68594");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

if(phpVer =~ "^(5\.(4|5|6))"){
  ## check the version
  if(version_in_range(version:phpVer, test_version:"5.4.0", test_version2:"5.4.35")||
     version_in_range(version:phpVer, test_version:"5.5.0", test_version2:"5.5.19")||
     version_in_range(version:phpVer, test_version:"5.6.0", test_version2:"5.6.3")){
    report = report_fixed_ver(installed_version:phpVer, fixed_version:"5.4.36/5.5.20/5.6.4");
    security_message(data:report, port:phpPort);
    exit(0);
  }
}

exit(99);
