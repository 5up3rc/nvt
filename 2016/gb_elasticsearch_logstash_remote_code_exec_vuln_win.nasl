###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_elasticsearch_logstash_remote_code_exec_vuln_win.nasl 5505 2017-03-07 10:00:18Z teissa $
#
# Elasticsearch Logstash Remote Code Execution Vulnerability (Windows)
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

CPE = "cpe:/a:elasticsearch:logstash";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808095");
  script_version("$Revision: 5505 $");
  script_cve_id("CVE-2014-4326");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-07 11:00:18 +0100 (Tue, 07 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-06-24 17:58:32 +0530 (Fri, 24 Jun 2016)");
  script_name("Elasticsearch Logstash Remote Code Execution Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running Elasticsearch Logstash
  and is prone to remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The Flaw is due improper validation of
  inputs passed to 'zabbix.rb' and 'nagios_nsca.rb' outputs.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  remote attackers to execute arbitrary commands.

  Impact Level: Application");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"affected", value:"Elasticsearch Logstash version prior to
  1.4.2 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Elasticsearch Logstash version
  1.4.2 or later.
  For updates refer to https://www.elastic.co");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.elastic.co/community/security/");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/archive/1/532841/100/0/threaded");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_elasticsearch_logstash_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("Elastisearch/Logstash/Installed","Host/runs_windows");
  script_require_ports("Services/www", 9200);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

#Variable initialize
esPort = "";
esVer = "";

## exit, if its not windows
if(host_runs("Windows") != "yes") exit(0);

## Get Port
if(!esPort = get_app_port(cpe:CPE)){
 exit(0);
}

## Get the version
if(!esVer = get_app_version(cpe:CPE, port:esPort)){
 exit(0);
}

if(version_is_less(version:esVer, test_version:"1.4.2"))
{
  report = report_fixed_ver(installed_version:esVer, fixed_version:"1.4.2");
  security_message(data:report, port:esPort);
  exit(0);
}

