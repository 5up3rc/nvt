###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for openssl openSUSE-SU-2012:0083-1 (openssl)
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
tag_insight = "Various security vulnerabilities have been fixed in openssl:

  - DTLS plaintext recovery attack (CVE-2011-4108)
  - uninitialized SSL 3.0 padding (CVE-2011-4576)
  - malformed RFC 3779 data can cause assertion failures
  (CVE-2011-4577)
  - SGC restart DoS attack (CVE-2011-4619)
  - invalid GOST parameters DoS attack (CVE-2012-0027)";

tag_affected = "openssl on openSUSE 11.4, openSUSE 11.3";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://195.135.221.135/opensuse-security-announce/2012-01/msg00041.html");
  script_id(850181);
  script_version("$Revision: 6672 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:43:53 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-08-02 20:17:50 +0530 (Thu, 02 Aug 2012)");
  script_cve_id("CVE-2011-4108", "CVE-2011-4576", "CVE-2011-4577", "CVE-2011-4619", "CVE-2012-0027");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_xref(name: "openSUSE-SU", value: "2012:0083_1");
  script_name("SuSE Update for openssl openSUSE-SU-2012:0083-1 (openssl)");

  script_summary("Check for the Version of openssl");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
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

if(release == "openSUSE11.4")
{

  if ((res = isrpmvuln(pkg:"libopenssl-devel", rpm:"libopenssl-devel~1.0.0c~18.23.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl1_0_0", rpm:"libopenssl1_0_0~1.0.0c~18.23.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~1.0.0c~18.23.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl1_0_0-32bit", rpm:"libopenssl1_0_0-32bit~1.0.0c~18.23.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-doc", rpm:"openssl-doc~1.0.0c~18.23.1", rls:"openSUSE11.4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "openSUSE11.3")
{

  if ((res = isrpmvuln(pkg:"libopenssl-devel", rpm:"libopenssl-devel~1.0.0~6.13.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl1_0_0", rpm:"libopenssl1_0_0~1.0.0~6.13.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~1.0.0~6.13.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl1_0_0-32bit", rpm:"libopenssl1_0_0-32bit~1.0.0~6.13.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-doc", rpm:"openssl-doc~1.0.0~6.13.1", rls:"openSUSE11.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
