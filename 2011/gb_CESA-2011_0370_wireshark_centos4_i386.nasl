###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for wireshark CESA-2011:0370 centos4 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Wireshark is a program for monitoring network traffic. Wireshark was
  previously known as Ethereal.

  A heap-based buffer overflow flaw was found in Wireshark. If Wireshark
  opened a specially-crafted capture file, it could crash or, possibly,
  execute arbitrary code as the user running Wireshark. (CVE-2011-0024)
  
  Several denial of service flaws were found in Wireshark. Wireshark could
  crash or stop responding if it read a malformed packet off a network, or
  opened a malicious dump file. (CVE-2010-3445, CVE-2011-0538, CVE-2011-1139,
  CVE-2011-1140, CVE-2011-1141, CVE-2011-1143)
  
  Users of Wireshark should upgrade to these updated packages, which contain
  backported patches to correct these issues. All running instances of
  Wireshark must be restarted for the update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "wireshark on CentOS 4";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-March/017273.html");
  script_id(880481);
  script_version("$Revision: 6653 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:46:53 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-03-25 15:26:27 +0100 (Fri, 25 Mar 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:0370");
  script_cve_id("CVE-2010-3445", "CVE-2011-0024", "CVE-2011-0538", "CVE-2011-1139", "CVE-2011-1140", "CVE-2011-1141", "CVE-2011-1143");
  script_name("CentOS Update for wireshark CESA-2011:0370 centos4 i386");

  script_summary("Check for the Version of wireshark");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~1.0.15~2.el4", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"wireshark-gnome", rpm:"wireshark-gnome~1.0.15~2.el4", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
