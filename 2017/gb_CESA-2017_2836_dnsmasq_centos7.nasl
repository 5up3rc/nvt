###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2017_2836_dnsmasq_centos7.nasl 7345 2017-10-05 06:16:00Z santu $
#
# CentOS Update for dnsmasq CESA-2017:2836 centos7 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882780");
  script_version("$Revision: 7345 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-05 08:16:00 +0200 (Thu, 05 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-05 11:55:13 +0530 (Thu, 05 Oct 2017)");
  script_cve_id("CVE-2017-14491", "CVE-2017-14492", "CVE-2017-14493", "CVE-2017-14494", 
                "CVE-2017-14495", "CVE-2017-14496");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for dnsmasq CESA-2017:2836 centos7 ");
  script_tag(name: "summary", value: "Check the version of dnsmasq");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The dnsmasq packages contain Dnsmasq, a 
lightweight DNS (Domain Name Server) forwarder and DHCP (Dynamic Host Configuration Protocol) server.

Security Fix(es):

* A heap buffer overflow was found in dnsmasq in the code responsible for
building DNS replies. An attacker could send crafted DNS packets to dnsmasq
which would cause it to crash or, potentially, execute arbitrary code.
(CVE-2017-14491)

* A heap buffer overflow was discovered in dnsmasq in the IPv6 router
advertisement (RA) handling code. An attacker on the local network segment
could send crafted RAs to dnsmasq which would cause it to crash or,
potentially, execute arbitrary code. This issue only affected
configurations using one of these options: enable-ra, ra-only, slaac,
ra-names, ra-advrouter, or ra-stateless. (CVE-2017-14492)

* A stack buffer overflow was found in dnsmasq in the DHCPv6 code. An
attacker on the local network could send a crafted DHCPv6 request to
dnsmasq which would cause it to a crash or, potentially, execute arbitrary
code. (CVE-2017-14493)

* An information leak was found in dnsmasq in the DHCPv6 relay code. An
attacker on the local network could send crafted DHCPv6 packets to dnsmasq
causing it to forward the contents of process memory, potentially leaking
sensitive data. (CVE-2017-14494)

* A memory exhaustion flaw was found in dnsmasq in the EDNS0 code. An
attacker could send crafted DNS packets which would trigger memory
allocations which would never be freed, leading to unbounded memory
consumption and eventually a crash. This issue only affected configurations
using one of the options: add-mac, add-cpe-id, or add-subnet.
(CVE-2017-14495)

* An integer underflow flaw leading to a buffer over-read was found in
dnsmasq in the EDNS0 code. An attacker could send crafted DNS packets to
dnsmasq which would cause it to crash. This issue only affected
configurations using one of the options: add-mac, add-cpe-id, or
add-subnet. (CVE-2017-14496)

Red Hat would like to thank Felix Wilhelm (Google Security Team), Fermin J.
Serna (Google Security Team), Gabriel Campana (Google Security Team), Kevin
Hamacher (Google Security Team), and Ron Bowes (Google Security Team) for
reporting these issues.
");
  script_tag(name: "affected", value: "dnsmasq on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:2836");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-October/022555.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"dnsmasq", rpm:"dnsmasq~2.76~2.el7_4.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dnsmasq-utils", rpm:"dnsmasq-utils~2.76~2.el7_4.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
