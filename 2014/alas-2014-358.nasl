# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2014-358.nasl 6769 2017-07-20 09:56:33Z teissa $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.120317");
script_version("$Revision: 6769 $");
script_tag(name:"creation_date", value:"2015-09-08 13:23:26 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-20 11:56:33 +0200 (Thu, 20 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2014-358");
script_tag(name: "insight", value: "It was found [1] that the Capture::Tiny module, provided by the perl-Capture-Tiny package, used the File::temp::tmpnam module to generate temporary files:./lib/Capture/Tiny.pm:  $stash->{flag_files}{$which} = scalar tmpnam();This module makes use of the mktemp() function when called in the scalar context, which creates significantly more predictable temporary files. Additionally, the temporary file is created with world-writable (0666) permission. A local attacker could use this flaw to perform a symbolic link attack, overwriting arbitrary files accessible to a program using the Capture::Tiny module."); 
script_tag(name : "solution", value : "Run yum update perl-Capture-Tiny to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2014-358.html");
script_cve_id("CVE-2014-1875");
script_tag(name:"cvss_base", value:"3.6");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
script_family("Amazon Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"perl-Capture-Tiny", rpm:"perl-Capture-Tiny~0.24~1.5.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
