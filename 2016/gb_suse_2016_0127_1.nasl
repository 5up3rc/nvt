###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for openssh openSUSE-SU-2016:0127-1 (openssh)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851155");
  script_version("$Revision: 6676 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:56:06 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-01-15 06:15:19 +0100 (Fri, 15 Jan 2016)");
  script_cve_id("CVE-2016-0777", "CVE-2016-0778");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for openssh openSUSE-SU-2016:0127-1 (openssh)");
  script_tag(name: "summary", value: "Check the version of openssh");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for openssh fixes the following issues:

  - CVE-2016-0777: A malicious or compromised server could cause the OpenSSH
  client to expose part or all of the client's private key through the
  roaming feature (bsc#961642)
  - CVE-2016-0778: A malicious or compromised server could could trigger a
  buffer overflow in the OpenSSH client through the roaming feature
  (bsc#961645)

  This update disables the undocumented feature supported by the OpenSSH
  client and a commercial SSH server.");
  script_tag(name: "affected", value: "openssh on openSUSE 13.2");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2016:0127_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2016-01/msg00013.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE13.2")
{

  if ((res = isrpmvuln(pkg:"openssh", rpm:"openssh~6.6p1~5.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssh-askpass-gnome", rpm:"openssh-askpass-gnome~6.6p1~5.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssh-askpass-gnome-debuginfo", rpm:"openssh-askpass-gnome-debuginfo~6.6p1~5.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssh-debuginfo", rpm:"openssh-debuginfo~6.6p1~5.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssh-debugsource", rpm:"openssh-debugsource~6.6p1~5.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssh-fips", rpm:"openssh-fips~6.6p1~5.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssh-helpers", rpm:"openssh-helpers~6.6p1~5.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssh-helpers-debuginfo", rpm:"openssh-helpers-debuginfo~6.6p1~5.3.1", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
