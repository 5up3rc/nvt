###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_elasticsearch_kibana_xss_vuln_lin.nasl 5598 2017-03-17 10:00:43Z teissa $
#
# Elasticsearch Kibana Cross-site scripting (XSS) Vulnerability (Linux)
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

CPE = "cpe:/a:elasticsearch:kibana";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808503");
  script_version("$Revision: 5598 $");
  script_cve_id("CVE-2015-4093");
  script_bugtraq_id(75107);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-17 11:00:43 +0100 (Fri, 17 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-06-28 18:20:50 +0530 (Tue, 28 Jun 2016)");
  script_name("Elasticsearch Kibana Cross-site scripting (XSS) Vulnerability (Linux)");

  script_tag(name:"summary", value:"This host is running Elasticsearch Kibana
  and is prone to cross-site scripting (XSS) vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The Flaw is due to an insufficient
  validation of user supplied input.");

  script_tag(name:"impact", value:"Successful exploitation will allows remote
  attackers to inject arbitrary web script or HTML.

  Impact Level: Application");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"affected", value:"Elasticsearch Kibana version 4.0.x 
  before 4.0.3 on Linux.");

  script_tag(name:"solution", value:"Upgrade to Elasticsearch Kibana version 4.0.3,
  or later.
  For updates refer to https://www.elastic.co");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.elastic.co/community/security/");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/archive/1/535726/100/0/threaded");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_elasticsearch_kibana_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("Elasticsearch/Kibana/Installed","Host/runs_unixoide");
  script_require_ports("Services/www", 9200, 5601);
  exit(0);
}

include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

#Variable initialize
kibanaPort = "";
kibanaVer = "";

## exit, if its windows
if(host_runs("Windows") == "yes") exit(0);

## Get Port
if(!kibanaPort = get_app_port(cpe:CPE)){
 exit(0);
}

## Get the version
if(!kibanaVer = get_app_version(cpe:CPE, port:kibanaPort)){
 exit(0);
}

if(version_in_range(version:kibanaVer, test_version:"4.0.0", test_version2:"4.0.2"))
{
  report = report_fixed_ver(installed_version:kibanaVer, fixed_version:"4.0.3");
  security_message(data:report, port:kibanaPort);
  exit(0);
}
