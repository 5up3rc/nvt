###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for java CESA-2011:0176 centos5 i386
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
tag_insight = "These packages provide the OpenJDK 6 Java Runtime Environment and the
  OpenJDK 6 Software Development Kit. The javaws command can be used to
  launch Java Web Start applications.

  A public static field declaration allowed untrusted JNLP (Java Network
  Launching Protocol) applications to read privileged data. A remote attacker
  could directly or indirectly read the values of restricted system
  properties, such as &quot;user.name&quot;, &quot;user.home&quot;, and &quot;java.home&quot;, which
  untrusted applications should not be allowed to read. (CVE-2010-3860)
  
  It was found that JNLPSecurityManager could silently return without
  throwing an exception when permission was denied. If the javaws command was
  used to launch a Java Web Start application that relies on this exception
  being thrown, it could result in that application being run with elevated
  privileges, allowing it to bypass security manager restrictions and gain
  access to privileged functionality. (CVE-2010-4351)
  
  Note: The RHSA-2010:0339 java-1.6.0-openjdk update installed javaws by
  mistake. As part of the fixes for CVE-2010-3860 and CVE-2010-4351, this
  update removes javaws.
  
  Red Hat would like to thank the TippingPoint Zero Day Initiative project
  for reporting CVE-2010-4351. The original issue reporter wishes to stay
  anonymous.
  
  This erratum also upgrades the OpenJDK package to IcedTea6 1.7.7. Refer to
  the NEWS file, linked to in the References, for further information.
  
  All users of java-1.6.0-openjdk are advised to upgrade to these updated
  packages, which resolve these issues. All running instances of OpenJDK Java
  must be restarted for the update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "java on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-April/017309.html");
  script_id(880546);
  script_version("$Revision: 6653 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:46:53 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2011:0176");
  script_cve_id("CVE-2010-3860", "CVE-2010-4351");
  script_name("CentOS Update for java CESA-2011:0176 centos5 i386");

  script_summary("Check for the Version of java");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-1.6.0.0", rpm:"java-1.6.0-openjdk-1.6.0.0~1.17.b17.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-demo-1.6.0.0", rpm:"java-1.6.0-openjdk-demo-1.6.0.0~1.17.b17.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-devel", rpm:"java-1.6.0-openjdk-devel~1.6.0.0~1.17.b17.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-javadoc", rpm:"java-1.6.0-openjdk-javadoc~1.6.0.0~1.17.b17.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-src-1.6.0.0", rpm:"java-1.6.0-openjdk-src-1.6.0.0~1.17.b17.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
