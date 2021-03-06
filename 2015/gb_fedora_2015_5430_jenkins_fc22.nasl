###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for jenkins FEDORA-2015-5430
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.869528");
  script_version("$Revision: 6630 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:34:32 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-07-07 06:22:19 +0200 (Tue, 07 Jul 2015)");
  script_cve_id("CVE-2015-1806", "CVE-2015-1807", "CVE-2015-1813", "CVE-2015-1812",
                "CVE-2015-1810", "CVE-2015-1808", "CVE-2015-1809", "CVE-2015-1814",
                "CVE-2015-1811");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for jenkins FEDORA-2015-5430");
  script_tag(name: "summary", value: "Check the version of jenkins");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Jenkins is an award-winning application that monitors executions of repeated
jobs, such as building a software project or jobs run by cron. Among those
things, current Jenkins focuses on the following two jobs:

- building/testing software projects continuously. In a nutshell, Jenkins
  provides an easy-to-use so-called continuous integration system, making it
  easier for developers to integrate changes to the project, and making it
  easier for users to obtain a fresh build. The automated, continuous build
  increases the productivity.

- monitoring executions of externally-run jobs, such as cron jobs and procmail
  jobs, even those that are run on a remote machine. For example, with cron, all
  you receive is regular e-mails that capture the output, and it is up to you to
  look at them diligently and notice when it broke. Jenkins keeps those outputs
  and makes it easy for you to notice when something is wrong.
");
  script_tag(name: "affected", value: "jenkins on Fedora 22");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2015-5430");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2015-April/155398.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC22")
{

  if ((res = isrpmvuln(pkg:"jenkins", rpm:"jenkins~1.606~1.fc22", rls:"FC22")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
