###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for perl-IO-Socket-SSL MDVSA-2011:092 (perl-IO-Socket-SSL)
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
tag_insight = "A vulnerability has been found and corrected in perl-IO-Socket-SSL:

  IO::Socket::SSL Perl module 1.35, when verify_mode is not VERIFY_NONE,
  fails open to VERIFY_NONE instead of throwing an error when a
  ca_file/ca_path cannot be verified, which allows remote attackers to
  bypass intended certificate restrictions (CVE-2010-4334).
  
  The updated packages have been patched to correct this issue.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "perl-IO-Socket-SSL on Mandriva Linux 2010.1,
  Mandriva Linux 2010.1/X86_64";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.mandriva.com/security-announce/2011-05/msg00016.php");
  script_id(831398);
  script_version("$Revision: 6570 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:06:35 +0200 (Thu, 06 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-05-23 16:55:31 +0200 (Mon, 23 May 2011)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:N");
  script_xref(name: "MDVSA", value: "2011:092");
  script_cve_id("CVE-2010-4334");
  script_name("Mandriva Update for perl-IO-Socket-SSL MDVSA-2011:092 (perl-IO-Socket-SSL)");

  script_summary("Check for the Version of perl-IO-Socket-SSL");
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

if(release == "MNDK_2010.1")
{

  if ((res = isrpmvuln(pkg:"perl-IO-Socket-SSL", rpm:"perl-IO-Socket-SSL~1.330.0~1.1mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
