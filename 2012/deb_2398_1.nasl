# OpenVAS Vulnerability Test
# $Id: deb_2398_1.nasl 6612 2017-07-07 12:08:03Z cfischer $
# Description: Auto-generated from advisory DSA 2398-1 (curl)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
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

include("revisions-lib.inc");
tag_insight = "Several vulnerabilities have been discovered in Curl, an URL transfer
library. The Common Vulnerabilities and Exposures project identifies the
following problems:

CVE-2011-3389

This update enables OpenSSL workarounds against the BEAST attack.
Additional information can be found in the Curl advisory:
http://curl.haxx.se/docs/adv_20120124B.html

CVE-2012-0036

Dan Fandrich discovered that Curl performs insufficient sanitising
when extracting the file path part of an URL.

For the oldstable distribution (lenny), this problem has been fixed in
version 7.18.2-8lenny6.

For the stable distribution (squeeze), this problem has been fixed in
version 7.21.0-2.1+squeeze1.

For the unstable distribution (sid), this problem has been fixed in
version 7.24.0-1.

We recommend that you upgrade your curl packages.";
tag_summary = "The remote host is missing an update to curl
announced via advisory DSA 2398-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202398-1";

if(description)
{
 script_id(70715);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2011-3389", "CVE-2012-0036");
 script_version("$Revision: 6612 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 14:08:03 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2012-02-12 06:35:15 -0500 (Sun, 12 Feb 2012)");
 script_name("Debian Security Advisory DSA 2398-1 (curl)");


 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-deb.inc");
res = "";
report = "";
if((res = isdpkgvuln(pkg:"curl", ver:"7.18.2-8lenny6", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl3", ver:"7.18.2-8lenny6", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl3-dbg", ver:"7.18.2-8lenny6", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl3-gnutls", ver:"7.18.2-8lenny6", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl4-gnutls-dev", ver:"7.18.2-8lenny6", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl4-openssl-dev", ver:"7.18.2-8lenny6", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"curl", ver:"7.21.0-2.1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl3", ver:"7.21.0-2.1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl3-dbg", ver:"7.21.0-2.1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl3-gnutls", ver:"7.21.0-2.1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl4-gnutls-dev", ver:"7.21.0-2.1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcurl4-openssl-dev", ver:"7.21.0-2.1+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
