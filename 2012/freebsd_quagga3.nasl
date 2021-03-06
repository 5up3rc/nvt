#
#VID 42a2c82a-75b9-11e1-89b4-001ec9578670
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 42a2c82a-75b9-11e1-89b4-001ec9578670
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
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
tag_insight = "The following packages are affected:
   quagga
   quagga-re

CVE-2012-0249
Buffer overflow in the ospf_ls_upd_list_lsa function in ospf_packet.c
in the OSPFv2 implementation in ospfd in Quagga before 0.99.20.1
allows remote attackers to cause a denial of service (assertion
failure and daemon exit) via a Link State Update (aka LS Update)
packet that is smaller than the length specified in its header.
CVE-2012-0250
Buffer overflow in the OSPFv2 implementation in ospfd in Quagga before
0.99.20.1 allows remote attackers to cause a denial of service (daemon
crash) via a Link State Update (aka LS Update) packet containing a
network-LSA link-state advertisement for which the data-structure
length is smaller than the value in the Length header field.
CVE-2012-0255
The BGP implementation in bgpd in Quagga before 0.99.20.1 does not
properly use message buffers for OPEN messages, which allows remote
attackers to cause a denial of service (assertion failure and daemon
exit) via a message associated with a malformed Four-octet AS Number
Capability (aka AS4 capability).";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://www.kb.cert.org/vuls/id/551715
http://www.vuxml.org/freebsd/42a2c82a-75b9-11e1-89b4-001ec9578670.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(71290);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_cve_id("CVE-2012-0249", "CVE-2012-0250", "CVE-2012-0255");
 script_version("$Revision: 5912 $");
 script_tag(name:"last_modification", value:"$Date: 2017-04-10 11:01:51 +0200 (Mon, 10 Apr 2017) $");
 script_tag(name:"creation_date", value:"2012-04-30 07:59:26 -0400 (Mon, 30 Apr 2012)");
 script_name("FreeBSD Ports: quagga");


 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-bsd.inc");
vuln = 0;
txt = "";
bver = portver(pkg:"quagga");
if(!isnull(bver) && revcomp(a:bver, b:"0.99.20.1")<0) {
    txt += "Package quagga version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}
bver = portver(pkg:"quagga-re");
if(!isnull(bver) && revcomp(a:bver, b:"0.99.17.8")<0) {
    txt += "Package quagga-re version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt ));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
