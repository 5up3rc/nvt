###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for java-1_6_0-openjdk openSUSE-SU-2013:0375-1 (java-1_6_0-openjdk)
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
tag_insight = "java-1_6_0-openjdk was updated to IcedTea 1.12.3
  (bnc#804654)  containing security and bugfixes:

  * Security fixes
  - S8006446: Restrict MBeanServer access (CVE-2013-1486)
  - S8006777: Improve TLS handling of invalid messages
  Lucky 13 (CVE-2013-0169)
  - S8007688: Blacklist known bad certificate (issued by
  DigiCert)
  * Backports
  - S8007393: Possible race condition after JDK-6664509
  - S8007611: logging behavior in applet changed
  * Bug fixes
  - PR1319: Support GIF lib v5.";


tag_affected = "java-1_6_0-openjdk on openSUSE 12.1";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.opensuse.org/opensuse-security-announce/2013-03/msg00000.html");
  script_id(850410);
  script_version("$Revision: 6673 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:45:02 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-03-11 18:29:44 +0530 (Mon, 11 Mar 2013)");
  script_cve_id("CVE-2013-0169", "CVE-2013-1486");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "openSUSE-SU", value: "2013:0375_1");
  script_name("SuSE Update for java-1_6_0-openjdk openSUSE-SU-2013:0375-1 (java-1_6_0-openjdk)");

  script_summary("Check for the Version of java-1_6_0-openjdk");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
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

if(release == "openSUSE12.1")
{

  if ((res = isrpmvuln(pkg:"java-1_6_0-openjdk", rpm:"java-1_6_0-openjdk~1.6.0.0_b27.1.12.3~28.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_6_0-openjdk-debuginfo", rpm:"java-1_6_0-openjdk-debuginfo~1.6.0.0_b27.1.12.3~28.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_6_0-openjdk-debugsource", rpm:"java-1_6_0-openjdk-debugsource~1.6.0.0_b27.1.12.3~28.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_6_0-openjdk-demo", rpm:"java-1_6_0-openjdk-demo~1.6.0.0_b27.1.12.3~28.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_6_0-openjdk-demo-debuginfo", rpm:"java-1_6_0-openjdk-demo-debuginfo~1.6.0.0_b27.1.12.3~28.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_6_0-openjdk-devel", rpm:"java-1_6_0-openjdk-devel~1.6.0.0_b27.1.12.3~28.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_6_0-openjdk-devel-debuginfo", rpm:"java-1_6_0-openjdk-devel-debuginfo~1.6.0.0_b27.1.12.3~28.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_6_0-openjdk-javadoc", rpm:"java-1_6_0-openjdk-javadoc~1.6.0.0_b27.1.12.3~28.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_6_0-openjdk-src", rpm:"java-1_6_0-openjdk-src~1.6.0.0_b27.1.12.3~28.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
