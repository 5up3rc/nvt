###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_mult_vuln01_june15_win.nasl 2015-06-16 18:45:49 July$
#
# PHP Multiple Vulnerabilities - 01 - Jun15 (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.805650");
  script_version("$Revision: 5082 $");
  script_cve_id("CVE-2015-4148", "CVE-2015-4147", "CVE-2015-2787", "CVE-2015-2348",
                "CVE-2015-2331");
  script_bugtraq_id(73357, 73431, 73434);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-01-24 12:14:23 +0100 (Tue, 24 Jan 2017) $");
  script_tag(name:"creation_date", value:"2015-06-16 18:45:49 +0530 (Tue, 16 Jun 2015)");
  script_name("PHP Multiple Vulnerabilities - 01 - Jun15 (Windows)");

  script_tag(name:"summary", value:"This host is installed with PHP and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to,
  - 'do_soap_call' function in ext/soap/soap.c script in PHP does not verify
  that the uri property is a string.
  - 'SoapClient::__call' method in ext/soap/soap.c script in PHP does not verify
  that __default_headers is an array.
  -  use-after-free error related to the 'unserialize' function when using
  DateInterval input.
  - a flaw in the 'move_uploaded_file' function that is triggered when handling
  NULL bytes.
  - an integer overflow condition in the '_zip_cdir_new' function in
  'zip_dirent.c' script.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attackers to obtain sensitive information by providing crafted
  serialized data with an int data type and to execute arbitrary code by
  providing crafted serialized data with an unexpected data type.

  Impact Level: Application");

  script_tag(name:"affected", value:"PHP versions before 5.4.39, 5.5.x before
  5.5.23, and 5.6.x before 5.6.7");

  script_tag(name:"solution", value:"Upgrade to PHP 5.4.39 or 5.5.23 or 5.6.7 or
  later. For updates refer to http://www.php.net");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"http://php.net/ChangeLog-5.php");
  script_xref(name:"URL", value:"https://bugs.php.net/bug.php?id=69085");
  script_xref(name:"URL", value:"http://openwall.com/lists/oss-security/2015/06/01/4");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("php/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

# Variable Initialization
phpPort = "";
phpVer = "";

## exit, if its not Windows
if(host_runs("Windows") != "yes") exit(0);

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

## Check for version 5.5.x before 5.5.23
if(phpVer =~ "^(5\.5)")
{
  if(version_in_range(version:phpVer, test_version:"5.5.0", test_version2:"5.5.22"))
  {
    fix = "5.5.23";
    VULN = TRUE;
  }
}

## Check for version 5.6.x before 5.6.7
if(phpVer =~ "^(5\.6)")
{
  if(version_in_range(version:phpVer, test_version:"5.6.0", test_version2:"5.6.6"))
  {
    fix = "5.6.7";
    VULN = TRUE;
  }
}

##Check for version less 5.4.39
if(phpVer =~ "^(5\.4)")
{
  if(version_is_less(version:phpVer, test_version:"5.4.39"))
  {
    fix = "5.4.39";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = 'Installed Version: ' + phpVer + '\n' +
           'Fixed Version:     ' + fix + '\n';
  security_message(data:report, port:phpPort);
  exit(0);
}

exit(99);