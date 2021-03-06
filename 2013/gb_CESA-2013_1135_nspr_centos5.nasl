###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for nspr CESA-2013:1135 centos5 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "Network Security Services (NSS) is a set of libraries designed to support
the cross-platform development of security-enabled client and server
applications. Netscape Portable Runtime (NSPR) provides platform
independence for non-GUI operating system facilities.

It was discovered that NSS leaked timing information when decrypting
TLS/SSL and DTLS protocol encrypted records when CBC-mode cipher suites
were used. A remote attacker could possibly use this flaw to retrieve plain
text from the encrypted packets by using a TLS/SSL or DTLS server as a
padding oracle. (CVE-2013-1620)

An out-of-bounds memory read flaw was found in the way NSS decoded certain
certificates. If an application using NSS decoded a malformed certificate,
it could cause the application to crash. (CVE-2013-0791)

Red Hat would like to thank the Mozilla project for reporting
CVE-2013-0791. Upstream acknowledges Ambroz Bizjak as the original reporter
of CVE-2013-0791.

This update also fixes the following bugs:

* A defect in the FreeBL library implementation of the Diffie-Hellman (DH)
protocol previously caused Openswan to drop connections. (BZ#958023)

 * A memory leak in the nssutil_ReadSecmodDB() function has been fixed.
(BZ#986969)

In addition, the nss package has been upgraded to upstream version 3.14.3,
and the nspr package has been upgraded to upstream version 4.9.5. These
updates provide a number of bug fixes and enhancements over the previous
versions. (BZ#949845, BZ#924741)

Note that while upstream NSS version 3.14 prevents the use of certificates
that have an MD5 signature, this erratum includes a patch that allows such
certificates by default. To prevent the use of certificates that have an
MD5 signature, set the 'NSS_HASH_ALG_SUPPORT' environment variable
to '-MD5'.

Users of NSS and NSPR are advised to upgrade to these updated packages,
which fix these issues and add these enhancements. After installing this
update, applications using NSS or NSPR must be restarted for this update to
take effect.";


if(description)
{
  script_id(881776);
  script_version("$Revision: 6655 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:58 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-08-08 11:34:14 +0530 (Thu, 08 Aug 2013)");
  script_cve_id("CVE-2013-0791", "CVE-2013-1620");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("CentOS Update for nspr CESA-2013:1135 centos5 ");


  tag_affected = "nspr on CentOS 5";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2013:1135");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-August/019892.html");
  script_summary("Check for the Version of nspr");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"nspr", rpm:"nspr~4.9.5~1.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nspr-devel", rpm:"nspr-devel~4.9.5~1.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.14.3~6.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.14.3~6.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.14.3~6.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.14.3~6.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
