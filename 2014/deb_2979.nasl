# OpenVAS Vulnerability Test
# $Id: deb_2979.nasl 6724 2017-07-14 09:57:17Z teissa $
# Auto-generated from advisory DSA 2979-1 using nvtgen 1.0
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

tag_affected  = "fail2ban on Debian Linux";
tag_insight   = "Fail2ban monitors log files (e.g. /var/log/auth.log,
/var/log/apache/access.log) and temporarily or persistently bans
failure-prone addresses by updating existing firewall rules. Fail2ban allows
easy specification of different actions to be taken such as to ban an
IP using iptables or hostsdeny rules, or simply to send a
notification email.";
tag_solution  = "For the stable distribution (wheezy), these problems have been fixed in
version 0.8.6-3wheezy3.

For the testing distribution (jessie), these problems have been fixed in
version 0.8.11-1.

For the unstable distribution (sid), these problems have been fixed in
version 0.8.11-1.

We recommend that you upgrade your fail2ban packages.";
tag_summary   = "Two vulnerabilities were discovered in Fail2ban, a solution to ban hosts
that cause multiple authentication errors. When using Fail2ban to monitor
Postfix or Cyrus IMAP logs, improper input validation in log parsing
could enable a remote attacker to trigger an IP ban on arbitrary
addresses, resulting in denial of service.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_id(702979);
    script_version("$Revision: 6724 $");
    script_cve_id("CVE-2013-7176", "CVE-2013-7177");
    script_name("Debian Security Advisory DSA 2979-1 (fail2ban - security update)");
    script_tag(name: "last_modification", value:"$Date: 2017-07-14 11:57:17 +0200 (Fri, 14 Jul 2017) $");
    script_tag(name: "creation_date", value:"2014-07-17 00:00:00 +0200 (Thu, 17 Jul 2014)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-2979.html");


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
if ((res = isdpkgvuln(pkg:"fail2ban", ver:"0.8.6-3wheezy3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"fail2ban", ver:"0.8.6-3wheezy3", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"fail2ban", ver:"0.8.6-3wheezy3", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"fail2ban", ver:"0.8.6-3wheezy3", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
