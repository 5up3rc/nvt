###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_elasticsearch_kibana_csrf_vuln_lin.nasl 5650 2017-03-21 10:00:45Z teissa $
#
# Elasticsearch Kibana Cross-site Request Forgery (CSRF) Vulnerability (Linux)
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
  script_oid("1.3.6.1.4.1.25623.1.0.808501");
  script_version("$Revision: 5650 $");
  script_cve_id("CVE-2015-8131");
  script_bugtraq_id(77657);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-21 11:00:45 +0100 (Tue, 21 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-06-28 16:01:44 +0530 (Tue, 28 Jun 2016)");
  script_name("Elasticsearch Kibana Cross-site Request Forgery (CSRF) Vulnerability (Linux)");

  script_tag(name:"summary", value:"This host is running Elasticsearch Kibana
  and is prone to Cross-site Request Forgery (CSRF) vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The Flaw is due to an improper validation
  in the administrative console.");

  script_tag(name:"impact", value:"Successful exploitation will allows remote
  attackers to hijack the authentication of unspecified victims.

  Impact Level: Application");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"affected", value:"Elasticsearch Kibana version before 4.1.3 and
  4.2.x before 4.2.1 on Linux.");

  script_tag(name:"solution", value:"Upgrade to Elasticsearch Kibana version 4.1.3,
  or 4.2.1 or later.
  For updates refer to https://www.elastic.co");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.elastic.co/blog/kibana-4-2-1-and-4-1-3");
  script_xref(name:"URL", value:"https://www.elastic.co/community/security/");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/archive/1/536935/100/0/threaded");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_elasticsearch_kibana_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("Elasticsearch/Kibana/Installed","Host/runs_unixoide");
  script_require_ports("Services/www", 9200, 5601);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

#Variable initialize
kibanaPort = "";
kibanaVer = "";

## exit, if its windows
if(host_runs("Linux") != "yes") exit(0);

## Get Port
if(!kibanaPort = get_app_port(cpe:CPE)){
 exit(0);
}

## Get the version
if(!kibanaVer = get_app_version(cpe:CPE, port:kibanaPort)){
 exit(0);
}

## Check for vulnerable versions
if(version_is_less(version:kibanaVer, test_version:"4.1.3"))
{
  fix = "4.1.3";
  VULN = TRUE;
}

else if(version_is_equal(version:kibanaVer, test_version:"4.2.0"))
{
  fix = "4.2.1";
  VULN = TRUE;
}

if(VULN)
{
  report = report_fixed_ver(installed_version:kibanaVer, fixed_version:fix);
  security_message(data:report, port:kibanaPort);
  exit(0);
}
