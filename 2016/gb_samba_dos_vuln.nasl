###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_samba_dos_vuln.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# Samba Denial of Service Vulnerability
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:samba:samba";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807710");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2016-0771");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2016-04-06 16:24:59 +0530 (Wed, 06 Apr 2016)");
  script_name("Samba Denial of Service Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("smb_nativelanman.nasl", "gb_samba_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("samba/detected");

  script_xref(name:"URL", value:"https://www.samba.org/samba/security/CVE-2016-0771.html");

  script_tag(name:"summary", value:"This host is running Samba and is prone
  to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an error in AD DC
  configuration in the internal DNS server.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to cause denial of service.

  Impact Level: Application");

  script_tag(name:"affected", value:"Samba versions 4.x before 4.1.23, 4.2.x
  before 4.2.9, 4.3.x before 4.3.6 and 4.4.x before 4.4.0rc4.");

  script_tag(name:"solution", value:"Upgrade to Samba 4.1.23 or 4.2.9 or 4.3.6
  or 4.4.0rc4 later.
  For updates refer to https://www.samba.org/");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! sambaPort = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! sambaVer = get_app_version( cpe:CPE, port:sambaPort ) ) exit( 0 );

if( version_in_range( version:sambaVer, test_version:"4.0.0", test_version2:"4.1.22" ) ) {
  fix = "4.1.23";
  VULN = TRUE ;
} else if( version_in_range( version:sambaVer, test_version:"4.2.0", test_version2:"4.2.8" ) ) {
  fix = "4.2.9";
  VULN = TRUE ;
} else if( version_in_range( version:sambaVer, test_version:"4.3.0", test_version2:"4.3.5" ) ) {
  fix = "4.3.6";
  VULN = TRUE ;
} else if( version_in_range( version:sambaVer, test_version:"4.4.0", test_version2:"4.4.0rc3" ) ) {
  fix = "4.4.0rc4";
  VULN = TRUE ;
}

if( VULN ) {
  report = report_fixed_ver( installed_version:sambaVer, fixed_version:fix );
  security_message( data:report, port:sambaPort );
  exit( 0 );
}

exit( 99 );