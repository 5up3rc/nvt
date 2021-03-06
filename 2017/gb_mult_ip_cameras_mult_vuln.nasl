###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mult_ip_cameras_mult_vuln.nasl 7180 2017-09-19 03:11:15Z ckuersteiner $
#
# Multiple IP-Cameras (P2P) WIFICAM Cameras Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106636");
  script_version("$Revision: 7180 $");
  script_cve_id("CVE-2017-8224", "CVE-2017-8222", "CVE-2017-8225", "CVE-2017-8223", "CVE-2017-8221");
  script_tag(name: "last_modification", value: "$Date: 2017-09-19 05:11:15 +0200 (Tue, 19 Sep 2017) $");
  script_tag(name: "creation_date", value: "2017-03-08 12:16:59 +0700 (Wed, 08 Mar 2017)");
  script_tag(name: "cvss_base", value: "10.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name: "qod_type", value: "exploit");

  script_tag(name: "solution_type", value: "NoneAvailable");

  script_name("Multiple IP-Cameras (P2P) WIFICAM Cameras Multiple Vulnerabilities");

  script_category(ACT_ATTACK);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_get_http_banner.nasl");
  script_require_ports("Services/www", 81);
  script_mandatory_keys("GoAhead-Webs/banner");

  script_tag(name: "summary", value: "The IP-Camera is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect", value: "Sends a crafted HTTP request to read the system configuration and checks
the response.");

  script_tag(name: "insight", value: "Multiple IP-Cameras are prone to multiple vulnerabilites:

- Backdoor account

- RSA key and certificates

- Pre-Auth Info Leak (credentials) within the GoAhead http server

- Authenticated RCE as root

- Pre-Auth RCE as root

- Streaming without authentication

- Unsecure Cloud functionality");

  script_tag(name: "impact", value: "An unauthenticated attacker may execute arbitrary code and read arbitrary
files.");

  script_tag(name: "solution", value: "No solution or patch is available as of 19th September, 2017. Information
regarding this issue will be updated once the solution details are available.");

  script_xref(name: "URL", value: "https://pierrekim.github.io/blog/2017-03-08-camera-goahead-0day.html");
  script_xref(name: "URL", value: "https://blogs.securiteam.com/index.php/archives/3043");

  exit(0);
}

include("dump.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port(default: 81);

url = "/system.ini?loginuse&loginpas";

req = http_get(port: port, item: url);
res = http_keepalive_send_recv(port: port, data: req, bodyonly: TRUE);

tmp = bin2string(ddata: res, nonprint_replace: " ");
if (strlen(res) > 4000 && (egrep(pattern: "([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})", string: tmp) ||
    "IPCAM" >< res || "admin" >< res)) {
  if (http_vuln_check(port: port, url: "login.cgi", pattern: 'var loginpass=".*";', check_header: TRUE)) {
    report = report_vuln_url(port: port, url: url);
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(0);
