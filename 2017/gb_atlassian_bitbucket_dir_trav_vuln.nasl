###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_atlassian_bitbucket_dir_trav_vuln.nasl 5974 2017-04-19 05:55:40Z ckuerste $
#
# Atlassian Bitbucket Directory Traversal Vulnerability
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

CPE = 'cpe:/a:atlassian:bitbucket';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106760");
  script_version("$Revision: 5974 $");
  script_tag(name: "last_modification", value: "$Date: 2017-04-19 07:55:40 +0200 (Wed, 19 Apr 2017) $");
  script_tag(name: "creation_date", value: "2017-04-18 11:24:13 +0200 (Tue, 18 Apr 2017)");
  script_tag(name: "cvss_base", value: "4.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:S/C:P/I:N/A:N");

  script_cve_id("CVE-2016-4320");
  script_bugtraq_id(97515);

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Atlassian Bitbucket Directory Traversal Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_atlassian_bitbucket_detect.nasl");
  script_mandatory_keys("atlassian_bitbucket/installed");

  script_tag(name: "summary", value: "Atlassian Bitbucket is prone to a directory traversal vulnerability.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "Atlassian Bitbucket allows remote attackers to read the first line of an
arbitrary file via a directory traversal attack on the pull requests resource.");

  script_tag(name: "affected", value: "Atlassian Bitbucket prior to version 4.7.1.");

  script_tag(name: "solution", value: "Update to verion 4.7.1 or later.");

  script_xref(name: "URL", value: "https://jira.atlassian.com/browse/BSERV-8819");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "4.7.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.7.1");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);