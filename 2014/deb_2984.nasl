# OpenVAS Vulnerability Test
# $Id: deb_2984.nasl 6724 2017-07-14 09:57:17Z teissa $
# Auto-generated from advisory DSA 2984-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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

tag_affected  = "acpi-support on Debian Linux";
tag_insight   = "This package contains scripts to react to various ACPI events. It only
includes scripts for events that can be supported with some level of
safety cross platform.";
tag_solution  = "For the stable distribution (wheezy), this problem has been fixed in
version 0.140-5+deb7u1.

For the testing distribution (jessie), this problem has been fixed in
version 0.142-2.

For the unstable distribution (sid), this problem has been fixed in
version 0.142-2.

We recommend that you upgrade your acpi-support packages.";
tag_summary   = "CESG discovered a root escalation flaw in the acpi-support package. An
unprivileged user can inject the DBUS_SESSION_BUS_ADDRESS environment
variable to run arbitrary commands as root user via the policy-funcs
script.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_id(702984);
    script_version("$Revision: 6724 $");
    script_cve_id("CVE-2014-1419");
    script_name("Debian Security Advisory DSA 2984-1 (acpi-support - security update)");
    script_tag(name: "last_modification", value:"$Date: 2017-07-14 11:57:17 +0200 (Fri, 14 Jul 2017) $");
    script_tag(name: "creation_date", value:"2014-07-22 00:00:00 +0200 (Tue, 22 Jul 2014)");
    script_tag(name:"cvss_base", value:"6.9");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2984.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: tag_affected);
    script_tag(name: "insight",   value: tag_insight);
#    script_tag(name: "impact",    value: tag_impact);
    script_tag(name: "solution",  value: tag_solution);
    script_tag(name: "summary",   value: tag_summary);
    script_tag(name: "vuldetect", value: tag_vuldetect);
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"acpi-fakekey", ver:"0.140-5+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-support", ver:"0.140-5+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-support-base", ver:"0.140-5+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-fakekey", ver:"0.140-5+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-support", ver:"0.140-5+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-support-base", ver:"0.140-5+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-fakekey", ver:"0.140-5+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-support", ver:"0.140-5+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-support-base", ver:"0.140-5+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-fakekey", ver:"0.140-5+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-support", ver:"0.140-5+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"acpi-support-base", ver:"0.140-5+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
