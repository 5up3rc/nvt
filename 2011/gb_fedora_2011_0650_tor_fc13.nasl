###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for tor FEDORA-2011-0650
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
tag_insight = "Tor is a connection-based low-latency anonymous communication system.

  Applications connect to the local Tor proxy using the SOCKS protocol. The
  local proxy chooses a path through a set of relays, in which each relay
  knows its predecessor and successor, but no others. Traffic flowing down
  the circuit is unwrapped by a symmetric key at each relay, which reveals
  the downstream relay.
  
  Warnings: Tor does no protocol cleaning.  That means there is a danger
  that application protocols and associated programs can be induced to
  reveal information about the initiator. Tor depends on Privoxy and
  similar protocol cleaners to solve this problem. This is alpha code,
  and is even more likely than released code to have anonymity-spoiling
  bugs. The present network is very small -- this further reduces the
  strength of the anonymity provided. Tor is not presently suitable for
  high-stakes anonymity.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "tor on Fedora 13";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2011-June/061286.html");
  script_id(863130);
  script_version("$Revision: 6626 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:30:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-06-10 16:29:51 +0200 (Fri, 10 Jun 2011)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "FEDORA", value: "2011-0650");
  script_cve_id("CVE-2011-0427", "CVE-2011-0015", "CVE-2011-0016", "CVE-2011-0490", "CVE-2011-0491", "CVE-2011-0492", "CVE-2011-0493");
  script_name("Fedora Update for tor FEDORA-2011-0650");

  script_summary("Check for the Version of tor");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
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

if(release == "FC13")
{

  if ((res = isrpmvuln(pkg:"tor", rpm:"tor~0.2.1.29~1300.fc13", rls:"FC13")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
