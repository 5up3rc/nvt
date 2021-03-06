###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for wordpress FEDORA-2014-5028
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_id(867733);
  script_version("$Revision: 6629 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:33:41 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-05-02 10:13:30 +0530 (Fri, 02 May 2014)");
  script_cve_id("CVE-2014-0165", "CVE-2014-0166", "CVE-2013-4338", "CVE-2013-4339",
                "CVE-2013-4340", "CVE-2013-2173", "CVE-2013-2199", "CVE-2013-2200",
                "CVE-2013-2201", "CVE-2013-2202", "CVE-2013-2203", "CVE-2013-2204");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Fedora Update for wordpress FEDORA-2014-5028");

  tag_insight = "Wordpress is an online publishing / weblog package that makes it very easy,
almost trivial, to get information out to people on the web.

Important information in /usr/share/doc/wordpress-3.8.3/README.fedora
";

  tag_affected = "wordpress on Fedora 19";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "FEDORA", value: "2014-5028");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-April/131989.html");
  script_summary("Check for the Version of wordpress");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC19")
{

  if ((res = isrpmvuln(pkg:"wordpress", rpm:"wordpress~3.8.3~1.fc19", rls:"FC19")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
