# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2013-155.nasl 6577 2017-07-06 13:43:46Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
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
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.120237");
script_version("$Revision: 6577 $");
script_tag(name:"creation_date", value:"2015-09-08 13:21:07 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:43:46 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2013-155");
script_tag(name: "insight", value: "Multiple improper permission check issues were discovered in the AWT, CORBA, JMX, and Libraries components in OpenJDK. An untrusted Java application or applet could use these flaws to bypass Java sandbox restrictions.Multiple flaws were found in the way image parsers in the 2D and AWT components handled image raster parameters. A specially-crafted image could cause Java Virtual Machine memory corruption and, possibly, lead to arbitrary code execution with the virtual machine privileges.A flaw was found in the AWT component's clipboard handling code. An untrusted Java application or applet could use this flaw to access clipboard data, bypassing Java sandbox restrictions.The default Java security properties configuration did not restrict access to certain com.sun.xml.internal packages. An untrusted Java application or applet could use this flaw to access information, bypassing certain Java sandbox restrictions. This update lists the whole package as restricted.Multiple improper permission check issues were discovered in the Libraries, Networking, and JAXP components. An untrusted Java application or applet could use these flaws to bypass certain Java sandbox restrictions.It was discovered that the RMI component's CGIHandler class used user inputs in error messages without any sanitization. An attacker could use this flaw to perform a cross-site scripting (XSS) attack.It was discovered that the SSL/TLS implementation in the JSSE component did not properly enforce handshake message ordering, allowing an unlimited number of handshake restarts. A remote attacker could use this flaw to make an SSL/TLS server using JSSE consume an excessive amount of CPU by continuously restarting the handshake.It was discovered that the JSSE component did not properly validate Diffie-Hellman public keys. An SSL/TLS client could possibly use this flaw to perform a small subgroup attack."); 
script_tag(name : "solution", value : "Run yum update java-1.6.0-openjdk to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2013-155.html");
script_cve_id("CVE-2013-1478","CVE-2013-0440","CVE-2013-0443","CVE-2013-0442","CVE-2013-0427","CVE-2013-0432","CVE-2013-0424","CVE-2013-0435");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
script_family("Amazon Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-src", rpm:"java-1.6.0-openjdk-src~1.6.0.0~54.1.11.6.48.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-demo", rpm:"java-1.6.0-openjdk-demo~1.6.0.0~54.1.11.6.48.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-javadoc", rpm:"java-1.6.0-openjdk-javadoc~1.6.0.0~54.1.11.6.48.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-devel", rpm:"java-1.6.0-openjdk-devel~1.6.0.0~54.1.11.6.48.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk", rpm:"java-1.6.0-openjdk~1.6.0.0~54.1.11.6.48.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-debuginfo", rpm:"java-1.6.0-openjdk-debuginfo~1.6.0.0~54.1.11.6.48.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
