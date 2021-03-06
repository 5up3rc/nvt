###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for apache2 USN-1368-1
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
tag_insight = "It was discovered that the Apache HTTP Server incorrectly handled the
  SetEnvIf .htaccess file directive. An attacker having write access to a
  .htaccess file may exploit this to possibly execute arbitrary code.
  (CVE-2011-3607)

  Prutha Parikh discovered that the mod_proxy module did not properly
  interact with the RewriteRule and ProxyPassMatch pattern matches in the
  configuration of a reverse proxy. This could allow remote attackers to
  contact internal webservers behind the proxy that were not intended for
  external exposure. (CVE-2011-4317)

  Rainer Canavan discovered that the mod_log_config module incorrectly
  handled a certain format string when used with a threaded MPM. A remote
  attacker could exploit this to cause a denial of service via a specially-
  crafted cookie. This issue only affected Ubuntu 11.04 and 11.10.
  (CVE-2012-0021)

  It was discovered that the Apache HTTP Server incorrectly handled certain
  type fields within a scoreboard shared memory segment. A local attacker
  could exploit this to to cause a denial of service. (CVE-2012-0031)

  Norman Hippert discovered that the Apache HTTP Server incorrecly handled
  header information when returning a Bad Request (400) error page. A remote
  attacker could exploit this to obtain the values of certain HTTPOnly
  cookies. (CVE-2012-0053)";

tag_summary = "Ubuntu Update for Linux kernel vulnerabilities USN-1368-1";
tag_affected = "apache2 on Ubuntu 11.04 ,
  Ubuntu 10.10 ,
  Ubuntu 10.04 LTS ,
  Ubuntu 8.04 LTS";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://lists.ubuntu.com/archives/ubuntu-security-announce/2012-February/001593.html");
  script_id(840900);
  script_version("$Revision: 6643 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:00:30 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-02-21 19:00:08 +0530 (Tue, 21 Feb 2012)");
  script_cve_id("CVE-2011-3607", "CVE-2011-4317", "CVE-2012-0021", "CVE-2012-0031", "CVE-2012-0053");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "USN", value: "1368-1");
  script_name("Ubuntu Update for apache2 USN-1368-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"apache2.2-common", ver:"2.2.16-1ubuntu3.5", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apache2.2-common", ver:"2.2.14-5ubuntu8.8", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"apache2.2-common", ver:"2.2.17-1ubuntu1.5", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "UBUNTU8.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"apache2.2-common", ver:"2.2.8-1ubuntu0.23", rls:"UBUNTU8.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
