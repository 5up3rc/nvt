###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for dhcp MDVSA-2012:115 (dhcp)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Multiple vulnerabilities has been discovered and corrected in ISC DHCP:

  An unexpected client identifier parameter can cause the ISC DHCP
  daemon to segmentation fault when running in DHCPv6 mode, resulting
  in a denial of service to further client requests. In order to exploit
  this condition, an attacker must be able to send requests to the DHCP
  server (CVE-2012-3570)

  Two memory leaks have been found and fixed in ISC DHCP. Both are
  reproducible when running in DHCPv6 mode (with the -6 command-line
  argument.) The first leak is confirmed to only affect servers
  operating in DHCPv6 mode, but based on initial code analysis the
  second may theoretically affect DHCPv4 servers (though this has not
  been demonstrated.) (CVE-2012-3954).

  The updated packages have been upgraded to the latest version
  (4.2.4-P1) which is not affected by these issues.";

tag_affected = "dhcp on Mandriva Linux 2011.0";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://www.mandriva.com/en/support/security/advisories/?name=MDVSA-2012:115");
  script_id(831703);
  script_version("$Revision: 6571 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:07:20 +0200 (Thu, 06 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-30 11:22:50 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-3570", "CVE-2012-3571", "CVE-2012-3954");
  script_tag(name:"cvss_base", value:"6.1");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:N/I:N/A:C");
  script_xref(name: "MDVSA", value: "2012:115");
  script_name("Mandriva Update for dhcp MDVSA-2012:115 (dhcp)");

  script_summary("Check for the Version of dhcp");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "MNDK_2011.0")
{

  if ((res = isrpmvuln(pkg:"dhcp-client", rpm:"dhcp-client~4.2.4~0.P1.1.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dhcp-common", rpm:"dhcp-common~4.2.4~0.P1.1.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dhcp-devel", rpm:"dhcp-devel~4.2.4~0.P1.1.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dhcp-doc", rpm:"dhcp-doc~4.2.4~0.P1.1.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dhcp-relay", rpm:"dhcp-relay~4.2.4~0.P1.1.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dhcp-server", rpm:"dhcp-server~4.2.4~0.P1.1.1", rls:"MNDK_2011.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
