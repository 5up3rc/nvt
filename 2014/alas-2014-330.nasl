# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2014-330.nasl 6637 2017-07-10 09:58:13Z teissa $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120046");
script_version("$Revision: 6637 $");
script_tag(name:"creation_date", value:"2015-09-08 13:16:12 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-10 11:58:13 +0200 (Mon, 10 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2014-330");
script_tag(name: "insight", value: "Two flaws were found in Wireshark. If Wireshark read a malformed packet off a network or opened a malicious dump file, it could crash or, possibly, execute arbitrary code as the user running Wireshark. (CVE-2014-2281 , CVE-2014-2299 )Several denial of service flaws were found in Wireshark. Wireshark could crash or stop responding if it read a malformed packet off a network, or opened a malicious dump file. (CVE-2013-6336 , CVE-2013-6337 , CVE-2013-6338 , CVE-2013-6339 , CVE-2013-6340 , CVE-2014-2283 , CVE-2013-7112 , CVE-2013-7114 )"); 
script_tag(name : "solution", value : "Run yum update wireshark to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2014-330.html");
script_cve_id("CVE-2013-6339", "CVE-2013-6338", "CVE-2013-7112", "CVE-2013-6337", "CVE-2013-6336", "CVE-2013-7114", "CVE-2014-2299", "CVE-2013-6340", "CVE-2014-2281", "CVE-2014-2283");
script_tag(name:"cvss_base", value:"9.3");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
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
if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~1.8.10~7.13.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"wireshark-devel", rpm:"wireshark-devel~1.8.10~7.13.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"wireshark-debuginfo", rpm:"wireshark-debuginfo~1.8.10~7.13.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
