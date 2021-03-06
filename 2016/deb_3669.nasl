# OpenVAS Vulnerability Test
# $Id: deb_3669.nasl 6608 2017-07-07 12:05:05Z cfischer $
# Auto-generated from advisory DSA 3669-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_id(703669);
    script_version("$Revision: 6608 $");
    script_cve_id("CVE-2016-1240");
    script_name("Debian Security Advisory DSA 3669-1 (tomcat7 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-07-07 14:05:05 +0200 (Fri, 07 Jul 2017) $");
    script_tag(name: "creation_date", value: "2016-09-15 00:00:00 +0200 (Thu, 15 Sep 2016)");
    script_tag(name:"cvss_base", value:"7.2");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3669.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "tomcat7 on Debian Linux");
    script_tag(name: "insight",   value: "Apache Tomcat implements the Java Servlet
and the JavaServer Pages (JSP) specifications from Sun Microsystems, and provides a
'pure Java' HTTP web server environment for Java code to run.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this
problem has been fixed in version 7.0.56-3+deb8u4.

We recommend that you upgrade your tomcat7 packages.");
    script_tag(name: "summary",   value: "Dawid Golunski of LegalHackers discovered
that the Tomcat init script performed unsafe file handling, which could result in
local privilege escalation.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager."); 
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libservlet3.0-java", ver:"7.0.56-3+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libservlet3.0-java-doc", ver:"7.0.56-3+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtomcat7-java", ver:"7.0.56-3+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7", ver:"7.0.56-3+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-admin", ver:"7.0.56-3+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-common", ver:"7.0.56-3+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-docs", ver:"7.0.56-3+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-examples", ver:"7.0.56-3+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-user", ver:"7.0.56-3+deb8u4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
