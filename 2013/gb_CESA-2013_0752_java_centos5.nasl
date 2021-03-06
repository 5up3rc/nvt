###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for java CESA-2013:0752 centos5
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
tag_insight = "These packages provide the OpenJDK 7 Java Runtime Environment and the
  OpenJDK 7 Software Development Kit.

  Multiple flaws were discovered in the font layout engine in the 2D
  component. An untrusted Java application or applet could possibly use these
  flaws to trigger Java Virtual Machine memory corruption. (CVE-2013-1569,
  CVE-2013-2383, CVE-2013-2384)

  Multiple improper permission check issues were discovered in the Beans,
  Libraries, JAXP, and RMI components in OpenJDK. An untrusted Java
  application or applet could use these flaws to bypass Java sandbox
  restrictions. (CVE-2013-1558, CVE-2013-2422, CVE-2013-2436, CVE-2013-1518,
  CVE-2013-1557)

  The previous default value of the java.rmi.server.useCodebaseOnly property
  permitted the RMI implementation to automatically load classes from
  remotely specified locations. An attacker able to connect to an application
  using RMI could use this flaw to make the application execute arbitrary
  code. (CVE-2013-1537)

  Note: The fix for CVE-2013-1537 changes the default value of the property
  to true, restricting class loading to the local CLASSPATH and locations
  specified in the java.rmi.server.codebase property. Refer to Red Hat
  Bugzilla bug 952387 for additional details.

  The 2D component did not properly process certain images. An untrusted Java
  application or applet could possibly use this flaw to trigger Java Virtual
  Machine memory corruption. (CVE-2013-2420)

  It was discovered that the Hotspot component did not properly handle
  certain intrinsic frames, and did not correctly perform access checks and
  MethodHandle lookups. An untrusted Java application or applet could
  use these flaws to bypass Java sandbox restrictions. (CVE-2013-2431,
  CVE-2013-2421, CVE-2013-2423)

  It was discovered that JPEGImageReader and JPEGImageWriter in the ImageIO
  component did not protect against modification of their state while
  performing certain native code operations. An untrusted Java application or
  applet could possibly use these flaws to trigger Java Virtual Machine
  memory corruption. (CVE-2013-2429, CVE-2013-2430)

  The JDBC driver manager could incorrectly call the toString() method in
  JDBC drivers, and the ConcurrentHashMap class could incorrectly call the
  defaultReadObject() method. An untrusted Java application or applet could
  possibly use these flaws to bypass Java sandbox restrictions.
  (CVE-2013-1488, CVE-2013-2426)

  The sun.awt.datatransfer.ClassLoaderObjectInputStream class may incorrectly
  invoke the system class loader. An untrusted Java application or applet
  could possibly u ...

  Description truncated, for more information please check the Reference URL";


tag_affected = "java on CentOS 5";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_id(881718);
  script_version("$Revision: 6655 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:58 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-04-19 10:06:25 +0530 (Fri, 19 Apr 2013)");
  script_cve_id("CVE-2013-0401", "CVE-2013-1488", "CVE-2013-1518", "CVE-2013-1537",
                "CVE-2013-1557", "CVE-2013-1558", "CVE-2013-1569", "CVE-2013-2383",
                "CVE-2013-2384", "CVE-2013-2415", "CVE-2013-2417", "CVE-2013-2419",
                "CVE-2013-2420", "CVE-2013-2421", "CVE-2013-2422", "CVE-2013-2423",
                "CVE-2013-2424", "CVE-2013-2426", "CVE-2013-2429", "CVE-2013-2430",
                "CVE-2013-2431", "CVE-2013-2436");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("CentOS Update for java CESA-2013:0752 centos5 ");

  script_xref(name: "CESA", value: "2013:0752");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-April/019693.html");
  script_summary("Check for the Version of java");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.19~2.3.9.1.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-demo", rpm:"java-1.7.0-openjdk-demo~1.7.0.19~2.3.9.1.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.19~2.3.9.1.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.19~2.3.9.1.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-src", rpm:"java-1.7.0-openjdk-src~1.7.0.19~2.3.9.1.el5_9", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
