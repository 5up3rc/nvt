###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_activemq_arbitrary_code_exec_vuln_june16.nasl 7431 2017-10-13 13:02:56Z cfischer $
#
# Apache ActiveMQ Arbitrary Code Execution Vulnerability June16
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:apache:activemq";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808146");
  script_version("$Revision: 7431 $");
  script_cve_id("CVE-2016-3088");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-13 15:02:56 +0200 (Fri, 13 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-06-06 16:11:05 +0530 (Mon, 06 Jun 2016)");
  script_name("Apache ActiveMQ Arbitrary Code Execution Vulnerability June16");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_apache_activemq_detect.nasl");
  script_require_ports("Services/www", 8161, "Services/activemq_jms", 61616);
  script_mandatory_keys("ActiveMQ/installed");

  script_xref(name:"URL", value:"http://activemq.apache.org/security-advisories.data/CVE-2016-3088-announcement.txt");

  script_tag(name:"summary", value:"This host is running Apache ActiveMQ and is
  prone to arbitrary code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to an error in 
  'fileserver' web application, which does not validate 
  'HTTP PUT' and 'HTTP MOVE' requests properly.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to replace web application files with malicious code and perform
  remote code execution on the system.

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache ActiveMQ Version 5.x to 5.13.2.");

  script_tag(name:"solution", value:"Upgrade to Apache ActiveMQ Version 5.14.0 or
  later. For updates refer to http://activemq.apache.org");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! appVer = get_app_version( cpe:CPE, nofork:TRUE ) ) exit( 0 );

if( version_in_range( version:appVer, test_version:"5.0.0", test_version2:"5.13.2" ) ) {
  report = report_fixed_ver( installed_version:appVer, fixed_version:"5.14.0" );
  security_message( data:report, port:0 );
  exit( 0 );
}

exit( 99 );