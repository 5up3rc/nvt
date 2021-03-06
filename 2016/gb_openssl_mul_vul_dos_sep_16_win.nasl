##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_mul_vul_dos_sep_16_win.nasl 5083 2017-01-24 11:21:46Z cfi $
# OpenSSL 1.0.2 and 1.0.1 multiple vulnerability Sep 16 (Windows)
#
# Authors:
# Tameem Eissa <tameem.eissa..at..greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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

tag_insight = " OPENSSL suffers from the possibility of multiple vulnerabilities due to :

              1) Missing message length checks which results in Out of Bounds reads up to 2 bytes beyond the allocated buffer, this leads to Denial of Service. The attack works only if client authentication is enabled.

              2) Calling MDC2_Update() can cause an overflow if an attacker
is able to supply very large amounts of input data after a previous
call to EVP_EncryptUpdate() with a partial block then a length check
can overflow resulting in a heap corruption.

              3) A malfored SHA512 TLS session ticket resulting in an Out of Bounds read which leads to service crash.

              4) Unchecking the return value of BN_div_word() function causing  an Out of Bounds write if it is used with an overly large BIGNUM. TLS is not affected.

              5) Misusing OBJ_obj2txt() function by the function TS_OBJ_print_bio() will results in Out of Bounds reads when large OIDs are presented.

              6) DTLS out-of-order messages handling which enable an attacker to cause a DoS attack through memory exhaustion.

              7) A flaw in the DTLS replay attack protection mechanism enabling the attacker to send records for next epochs with a very large sequence number, this causes in dropping all the subsequent legitimate packets and causing a denial of service for a specific DTLS connection.";

tag_impact = "Successful exploitation could result in Denial of Service.";

tag_affected = "OpenSSL 1.0.2 and 1.0.1 .";

tag_summary = "This host is running OpenSSL and prone to multiple vulnerability.";

tag_solution = "OpenSSL 1.0.2 users should upgrade to 1.0.2i, OpenSSL 1.0.1 users should upgrade to 1.0.1u";

CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107049");
  script_version("$Revision: 5083 $");
  script_cve_id("CVE-2016-6306", "CVE-2016-6303", "CVE-2016-2181", "CVE-2016-6302", "CVE-2016-2182", "CVE-2016-2180", "CVE-2016-2179");
  script_tag(name:"last_modification", value:"$Date: 2017-01-24 12:21:46 +0100 (Tue, 24 Jan 2017) $");
  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"creation_date", value:"2016-09-26 06:40:16 +0200 (Mon, 26 Sep 2016)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("OpenSSL 1.0.2 and 1.0.1 multiple vulnerability Sep 16 (Windows)");
  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20160922.txt");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
sslVer = "";

## check if the server runs windows
if(host_runs("Windows") != "yes")   exit(0);

## Get Version
if(!sslVer = get_app_version(cpe:CPE))
{
  exit(0);
}

## Checking for Vulnerable version 

if(sslVer =~ "^(1\.0\.2)" && version_is_less(version:sslVer, test_version:"1.0.2i"))
{
  fix = "1.0.2i";
  VUL = TRUE;
}
else if (sslVer =~ "^(1\.0\.1)" && version_is_less( version:sslVer, test_version:"1.0.1u"))
{
  fix = "1.0.1u";
  VUL = TRUE;
}

if (VUL)
{
  report = report_fixed_ver(installed_version:sslVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}





