###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for MySQL SUSE-SU-2015:0620-1 (MySQL)
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
  script_oid("1.3.6.1.4.1.25623.1.0.850760");
  script_version("$Revision: 6675 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:54:28 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-10-13 15:08:44 +0530 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2012-5615", "CVE-2014-0224", "CVE-2014-4274", "CVE-2014-4287",
                "CVE-2014-6463", "CVE-2014-6464", "CVE-2014-6469", "CVE-2014-6474",
                "CVE-2014-6478", "CVE-2014-6484", "CVE-2014-6489", "CVE-2014-6491",
                "CVE-2014-6494", "CVE-2014-6495", "CVE-2014-6496", "CVE-2014-6500",
                "CVE-2014-6505", "CVE-2014-6507", "CVE-2014-6520", "CVE-2014-6530",
                "CVE-2014-6551", "CVE-2014-6555", "CVE-2014-6559", "CVE-2014-6564",
                "CVE-2014-6568", "CVE-2015-0374", "CVE-2015-0381", "CVE-2015-0382",
                "CVE-2015-0385", "CVE-2015-0391", "CVE-2015-0409", "CVE-2015-0411",
                "CVE-2015-0432");
  script_tag(name:"cvss_base", value:"8.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for MySQL SUSE-SU-2015:0620-1 (MySQL)");
  script_tag(name: "summary", value: "Check the version of MySQL");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of
  detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  The MySQL datebase server was updated to 5.5.42, fixing various bugs and
  security issues.

  More information can be found on:

http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-42.html
http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-42.html 
http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-41.html
http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-41.html 
http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-40.html
http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-40.html 

  Also various issues with the mysql start script were fixed.
  (bsc#868673,bsc#878779)

  Security Issues:

  * CVE-2015-0411
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0411 
  * CVE-2015-0382
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0382 
  * CVE-2015-0381
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0381 
  * CVE-2015-0391
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0391 
  * CVE-2015-0432
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0432 
  * CVE-2015-0409
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0409 
  * CVE-2014-6568
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6568 
  * CVE-2015-0385
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0385 
  * CVE-2015-0374
http://cve.mitre.org/cgi-bin/cvename. ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "MySQL on SUSE Linux Enterprise Server 11 SP3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2015:0620_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2015-03/msg00033.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "SLES11.0SP3")
{

  if ((res = isrpmvuln(pkg:"libmysql55client18", rpm:"libmysql55client18~5.5.42~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysql55client_r18", rpm:"libmysql55client_r18~5.5.42~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient15", rpm:"libmysqlclient15~5.0.96~0.6.20", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient_r15", rpm:"libmysqlclient_r15~5.0.96~0.6.20", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql", rpm:"mysql~5.5.42~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-client", rpm:"mysql-client~5.5.42~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mysql-tools", rpm:"mysql-tools~5.5.42~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysql55client18-32bit", rpm:"libmysql55client18-32bit~5.5.42~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient15-32bit", rpm:"libmysqlclient15-32bit~5.0.96~0.6.20", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysql55client18-x86", rpm:"libmysql55client18-x86~5.5.42~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libmysqlclient15-x86", rpm:"libmysqlclient15-x86~5.0.96~0.6.20", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
