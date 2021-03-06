###############################################################################
#OpenVAS Vulnerability Test
# $Id: gb_openssh_security_bypass_vuln.nasl 6194 2017-05-23 09:04:00Z teissa $
#
# OpenSSH Security Bypass Vulnerability
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

CPE = "cpe:/a:openbsd:openssh";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806049");
  script_version("$Revision: 6194 $");
  script_cve_id("CVE-2015-5352");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-23 11:04:00 +0200 (Tue, 23 May 2017) $");
  script_tag(name:"creation_date", value:"2015-09-10 14:36:41 +0530 (Thu, 10 Sep 2015)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSH Security Bypass Vulnerability");

  script_tag(name:"summary", value:"This host is running OpenSSH and is prone
  to security bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to the refusal
  deadline was not checked within the x11_open_helper function.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to bypass intended access restrictions.

  Impact Level: Application");

  script_tag(name:"affected", value:"OpenSSH versions before 6.9");

  script_tag(name:"solution", value:"Upgrade to OpenSSH version 6.9 or later.
  For updates refer to http://www.openssh.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value :"http://openwall.com/lists/oss-security/2015/07/01/10");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("ssh_detect.nasl");
  script_require_ports("Services/ssh", 22);
  script_mandatory_keys("openssh/detected");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
sshPort = 0;
sshVer = "";

## Get HTTP Port
if(!sshPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!sshVer = get_app_version(cpe:CPE, port:sshPort)){
  exit(0);
}

## Checking for Vulnerable version
if(version_is_less(version:sshVer, test_version:"6.9"))
{
  report = 'Installed version: ' + sshVer + '\n' +
           'Fixed version:     6.9' + '\n';

  security_message(data:report, port:sshPort);
  exit(0);
}

