###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for heartbeat MDVA-2011:024 (heartbeat)
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
tag_affected = "heartbeat on Mandriva Enterprise Server 5,
  Mandriva Enterprise Server 5/X86_64";
tag_insight = "This update fix module ipv6addr to abort start on x86_64. Moreover,
  old heartbeat-2.0.7-init patch has been removed.";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.mandriva.com/security-announce/2011-06/msg00009.php");
  script_id(831422);
  script_version("$Revision: 6565 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-06 14:56:06 +0200 (Thu, 06 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-07-08 16:31:28 +0200 (Fri, 08 Jul 2011)");
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_xref(name: "MDVA", value: "2011:024");
  script_name("Mandriva Update for heartbeat MDVA-2011:024 (heartbeat)");

  script_summary("Check for the Version of heartbeat");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release");
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

if(release == "MNDK_mes5")
{

  if ((res = isrpmvuln(pkg:"heartbeat", rpm:"heartbeat~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"heartbeat-ldirectord", rpm:"heartbeat-ldirectord~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"heartbeat-pils", rpm:"heartbeat-pils~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"heartbeat-stonith", rpm:"heartbeat-stonith~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libheartbeat1", rpm:"libheartbeat1~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libheartbeat1-devel", rpm:"libheartbeat1-devel~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libheartbeat-apphb0", rpm:"libheartbeat-apphb0~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libheartbeat-pils1", rpm:"libheartbeat-pils1~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libheartbeat-pils1-devel", rpm:"libheartbeat-pils1-devel~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libheartbeat-stonith1", rpm:"libheartbeat-stonith1~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libheartbeat-stonith1-devel", rpm:"libheartbeat-stonith1-devel~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64heartbeat1", rpm:"lib64heartbeat1~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64heartbeat1-devel", rpm:"lib64heartbeat1-devel~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64heartbeat-apphb0", rpm:"lib64heartbeat-apphb0~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64heartbeat-pils1", rpm:"lib64heartbeat-pils1~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64heartbeat-pils1-devel", rpm:"lib64heartbeat-pils1-devel~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64heartbeat-stonith1", rpm:"lib64heartbeat-stonith1~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64heartbeat-stonith1-devel", rpm:"lib64heartbeat-stonith1-devel~2.1.3~1.4mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
