###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for oxide-qt USN-2992-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842782");
  script_version("$Revision: 6647 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:04:05 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-06-07 05:24:55 +0200 (Tue, 07 Jun 2016)");
  script_cve_id("CVE-2016-1673", "CVE-2016-1675", "CVE-2016-1677", "CVE-2016-1678",
		"CVE-2016-1679", "CVE-2016-1680", "CVE-2016-1682", "CVE-2016-1683",
		"CVE-2016-1684", "CVE-2016-1688", "CVE-2016-1689", "CVE-2016-1691",
		"CVE-2016-1692", "CVE-2016-1695", "CVE-2016-1703", "CVE-2016-1697", 
		"CVE-2016-1699", "CVE-2016-1702");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for oxide-qt USN-2992-1");
  script_tag(name: "summary", value: "Check the version of oxide-qt");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not."); 
  script_tag(name: "insight", value: "An unspecified security issue was discovered
  in Blink. If a user were tricked in to opening a specially crafted website, an
  attacker could potentially exploit this to bypass same-origin restrictions.
  (CVE-2016-1673)

  An issue was discovered with Document reattachment in Blink in some
  circumstances. If a user were tricked in to opening a specially crafted
  website, an attacker could potentially exploit this to bypass same-origin
  restrictions. (CVE-2016-1675)

  A type confusion bug was discovered in V8. If a user were tricked in to
  opening a specially crafted website, an attacker could potentially exploit
  this to obtain sensitive information. (CVE-2016-1677)

  A heap overflow was discovered in V8. If a user were tricked in to opening
  a specially crafted website, an attacker could potentially exploit this to
  cause a denial of service (application crash) or execute arbitrary code.
  (CVE-2016-1678)

  A use-after-free was discovered in the V8ValueConverter implementation in
  Chromium in some circumstances. If a user were tricked in to opening a
  specially crafted website, an attacker could potentially exploit this to
  cause a denial of service (application crash) or execute arbitrary code.
  (CVE-2016-1679)

  A use-after-free was discovered in Skia. If a user were tricked in to
  opening a specially crafted website, an attacker could potentially exploit
  this to cause a denial of service (application crash) or execute arbitrary
  code. (CVE-2016-1680)

  A security issue was discovered in ServiceWorker registration in Blink in
  some circumstances. If a user were tricked in to opening a specially
  crafted website, an attacker could potentially exploit this to bypass
  Content Security Policy (CSP) protections. (CVE-2016-1682)

  An out-of-bounds memory access was discovered in libxslt. If a user were
  tricked in to opening a specially crafted website, an attacker could
  potentially exploit this to cause a denial of service (application crash)
  or execute arbitrary code. (CVE-2016-1683)

  An integer overflow was discovered in libxslt. If a user were tricked in
  to opening a specially crafted website, an attacker could potentially
  exploit this to cause a denial of service (application crash or resource
  consumption). (CVE-2016-1684)

  An out-of-bounds read was discovered in the regular expression
  implementation in V8. If a user were tricked in to opening a specially
  crafted website, an attacker could potentially exploit this to cause a
  denial of service (application crash). (CVE-2016-1688)

  A heap overflow was discovered in Chromium. If a user were tricked in to
  opening a specially crafted ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "oxide-qt on Ubuntu 16.04 LTS ,
  Ubuntu 15.10 ,
  Ubuntu 14.04 LTS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "USN", value: "2992-1");
  script_xref(name: "URL" , value: "https://lists.ubuntu.com/archives/ubuntu-security-announce/2016-June/003449.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:i386", ver:"1.15.7-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:amd64", ver:"1.15.7-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:i386", ver:"1.15.7-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:amd64", ver:"1.15.7-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:i386", ver:"1.15.7-0ubuntu0.15.10.1", rls:"UBUNTU15.10")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:amd64", ver:"1.15.7-0ubuntu0.15.10.1", rls:"UBUNTU15.10")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
