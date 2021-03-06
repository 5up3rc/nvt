###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for spice openSUSE-SU-2017:1843-1 (spice)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851579");
  script_version("$Revision: 6906 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-11 15:21:18 +0200 (Fri, 11 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-07-14 15:54:51 +0530 (Fri, 14 Jul 2017)");
  script_cve_id("CVE-2017-7506");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for spice openSUSE-SU-2017:1843-1 (spice)");
  script_tag(name: "summary", value: "Check the version of spice");
  script_tag(name: "vuldetect", value: "Get the installed version with the 
help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for spice fixes the following issues:

  - CVE-2017-7506: A possible buffer overflow via invalid monitor
  configurations (bsc#1046779)

  This update was imported from the SUSE:SLE-12-SP2:Update update project.");
  script_tag(name: "affected", value: "spice on openSUSE Leap 42.2");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2017:1843_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2017-07/msg00016.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.2")
{

  if ((res = isrpmvuln(pkg:"libspice-server-devel", rpm:"libspice-server-devel~0.12.7~5.4.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libspice-server1", rpm:"libspice-server1~0.12.7~5.4.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libspice-server1-debuginfo", rpm:"libspice-server1-debuginfo~0.12.7~5.4.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"spice-client", rpm:"spice-client~0.12.7~5.4.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"spice-debugsource", rpm:"spice-debugsource~0.12.7~5.4.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
