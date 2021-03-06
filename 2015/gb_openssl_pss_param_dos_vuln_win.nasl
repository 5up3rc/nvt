###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_pss_param_dos_vuln_win.nasl 6183 2017-05-22 09:03:43Z teissa $
#
# OpenSSL 'PSS' parameter Denial of Service Vulnerability (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806651");
  script_version("$Revision: 6183 $");
  script_cve_id("CVE-2015-3194");
  script_bugtraq_id(78623);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-22 11:03:43 +0200 (Mon, 22 May 2017) $");
  script_tag(name:"creation_date", value:"2015-12-18 08:22:17 +0530 (Fri, 18 Dec 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("OpenSSL 'PSS' parameter Denial of Service Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to a denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to error within
  crypto/rsa/rsa_ameth.c script as the signature verification routines crash
  with a NULL pointer dereference if presented with an ASN.1 signature using
  the RSA PSS algorithm and absent mask generation function parameter.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to cause a denial of service condition.

  Impact Level: Application");

  script_tag(name:"affected", value:"OpenSSL versions 1.0.1 before 1.0.1q and
  1.0.2 before 1.0.2e on Windows");

  script_tag(name:"solution", value:"Upgrade to OpenSSL 1.0.1q or 1.0.2e or
  later. For updates refer to https://www.openssl.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://openssl.org/news/secadv/20151203.txt");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization

sslVer = "";

## exit, if its not windows
if(host_runs("Windows") != "yes")exit(0);

## Get Version
if(!sslVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Checking for Vulnerable version
if(sslVer =~ "^(1\.0\.1)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.1q"))
  {
    fix = "1.0.1q";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.2)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.2e"))
  {
    fix = "1.0.2e";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = 'Installed version: ' + sslVer + '\n' +
           'Fixed version:     ' + fix + '\n';

  security_message(data:report);
  exit(0);
}
