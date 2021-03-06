###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_mod_proxy_fcgi_dos_vuln.nasl 6194 2017-05-23 09:04:00Z teissa $
#
# Apache HTTP Server Mod_Proxi_Fcgi Denial of service Vulnerability May15
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

CPE = "cpe:/a:apache:http_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805636");
  script_version("$Revision: 6194 $");
  script_cve_id("CVE-2014-3583");
  script_bugtraq_id(71657);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-23 11:04:00 +0200 (Tue, 23 May 2017) $");
  script_tag(name:"creation_date", value:"2015-05-27 12:15:46 +0530 (Wed, 27 May 2015)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Apache HTTP Server Mod_Proxi_Fcgi Denial of service Vulnerability May15");

  script_tag(name:"summary", value:"This host is installed with Apache HTTP Server
  and is prone to denial of service  vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Flaw is due to an out-of-bounds read
  condition in the 'handle_headers' function in mod_proxy_fcgi that is triggered
  as user-supplied input is not properly validated when handling responses from
  FastCGI servers.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attackers to cause a denial of service via specially crafted response.

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache HTTP Server version 2.4.10.");

  script_tag(name:"solution", value:"Upgrade to version 2.4.12 or
  later, For updates refer http://www.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=1163555");
  script_xref(name : "URL" , value : "http://httpd.apache.org/security/vulnerabilities_24.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("secpod_apache_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("apache/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
httpd_port = 0;
httpd_ver = "";

## exit, if its not windows
if(host_runs("Windows") != "yes")exit(0);

## Get HTTP Port
if(!httpd_port = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!httpd_ver = get_app_version(cpe:CPE, port:httpd_port)){
  exit(0);
}

## Checking for Vulnerable version
if(version_is_equal(version:httpd_ver, test_version:"2.4.10"))
{
  report = 'Installed version: ' + httpd_ver + '\n' +
           'Fixed version:     ' + "2.4.12" + '\n';
  security_message(data:report, port:httpd_port);
  exit(0);
}
