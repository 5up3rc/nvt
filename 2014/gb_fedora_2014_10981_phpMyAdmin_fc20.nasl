###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for phpMyAdmin FEDORA-2014-10981
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.868201");
  script_version("$Revision: 6629 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:33:41 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-10-01 16:57:45 +0530 (Wed, 01 Oct 2014)");
  script_cve_id("CVE-2014-6300");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Fedora Update for phpMyAdmin FEDORA-2014-10981");
  script_tag(name: "insight", value: "phpMyAdmin is a tool written in PHP intended to handle the administration of
MySQL over the World Wide Web. Most frequently used operations are supported
by the user interface (managing databases, tables, fields, relations, indexes,
users, permissions), while you still have the ability to directly execute any
SQL statement.

Features include an intuitive web interface, support for most MySQL features
(browse and drop databases, tables, views, fields and indexes, create, copy,
drop, rename and alter databases, tables, fields and indexes, maintenance
server, databases and tables, with proposals on server configuration, execute,
edit and bookmark any SQL-statement, even batch-queries, manage MySQL users
and privileges, manage stored procedures and triggers), import data from CSV
and SQL, export data to various formats: CSV, SQL, XML, PDF, OpenDocument Text
and Spreadsheet, Word, Excel, LATEX and others, administering multiple servers,
creating PDF graphics of your database layout, creating complex queries using
Query-by-example (QBE), searching globally in a database or a subset of it,
transforming stored data into any format using a set of predefined functions,
like displaying BLOB-data as image or download-link and much more...
");
  script_tag(name: "affected", value: "phpMyAdmin on Fedora 20");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name: "FEDORA", value: "2014-10981");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-September/138655.html");
  script_summary("Check for the Version of phpMyAdmin");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC20")
{

  if ((res = isrpmvuln(pkg:"phpMyAdmin", rpm:"phpMyAdmin~4.2.8.1~2.fc20", rls:"FC20")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
