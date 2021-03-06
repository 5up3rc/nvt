###############################################################################
#OpenVAS Vulnerability Test
# $Id: gb_openssl_mult_vuln02_nov15_win.nasl 6333 2017-06-14 10:00:49Z teissa $
#
# OpenSSL Multiple Vulnerabilities -02 Nov15 (Windows)
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

CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806733");
  script_version("$Revision: 6333 $");
  script_cve_id("CVE-2015-0293", "CVE-2015-0289", "CVE-2015-0288", "CVE-2015-0287",
                "CVE-2015-0286", "CVE-2015-0209");
  script_bugtraq_id(73232,73231, 73237, 73227, 73225,73239);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-06-14 12:00:49 +0200 (Wed, 14 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-11-26 11:33:57 +0530 (Thu, 26 Nov 2015)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("OpenSSL Multiple Vulnerabilities -02 Nov15 (Windows)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to:
  - Error in 'SSLv2' implementation.
  - Incorrect handling of missing outer ContentInfo when parsing PKCS#7
    structures in PKCS#7 implementation.
  - 'X509_to_X509_REQ' function in 'crypto/x509/x509_req.c' script incorrectly
    handle invalid certificate keys.
  - Incorrect handling of ASN.1 structure reuse.
  - 'ASN1_TYPE_cmp' function in 'crypto/asn1/a_type.c' script incorrectly handle
    boolean-type comparisons.
  - Use-after-free vulnerability in the 'd2i_ECPrivateKey' function in
    'crypto/ec/ec_asn1.c' script.");

  script_tag(name:"impact", value:"Successful exploitation will allow an remote
  attackers to cause a denial of service or execute arbitrary code or possibly
  have unspecified other impact .

  Impact Level: System/Application");

  script_tag(name:"affected", value:"OpenSSL versions before 0.9.8zf, 1.0.0
  before 1.0.0r, 1.0.1 before 1.0.1m, and 1.0.2 before 1.0.2a on Windows");

  script_tag(name:"solution", value:"Upgrade to OpenSSL 0.9.8zf or 1.0.0r or
  1.0.1m or 1.0.2a or later.
  For updates refer to https://www.openssl.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://www.ubuntu.com/usn/USN-2537-1");
  script_xref(name : "URL" , value : "https://bto.bluecoat.com/security-advisory/sa92");
  script_xref(name : "URL" , value : "https://www.openssl.org/news/secadv/20150319.txt");

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
if(sslVer =~ "^(1\.0\.2)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.2a"))
  {
    fix = "1.0.2a";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.1)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.1m"))
  {
    fix = "1.0.1m";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.0)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.0r"))
  {
    fix = "1.0.0r";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(0\.9\.8)")
{
  if(version_is_less(version:sslVer, test_version:"0.9.8zf"))
  {
    fix = "0.9.8zf";
    VULN = TRUE;
  }
}
if(VULN)
{
  report = 'Installed version: ' + sslVer + '\n' +
           'Fixed version:     ' + fix    + '\n';

  security_message(data:report);
  exit(0);
}
