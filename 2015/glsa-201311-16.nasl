# OpenVAS Vulnerability Test
# Description: Gentoo Linux security check
# $Id: glsa-201311-16.nasl 6592 2017-07-07 09:16:27Z cfischer $

# Authors:
# Eero Volotinen <eero.volotinen@solinor.com>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
script_oid("1.3.6.1.4.1.25623.1.0.121075");
script_version("$Revision: 6592 $");
script_tag(name:"creation_date", value:"2015-09-29 11:26:20 +0300 (Tue, 29 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:16:27 +0200 (Fri, 07 Jul 2017) $");
script_name("Gentoo Linux Local Check: https://security.gentoo.org/glsa/201311-16");
script_tag(name: "insight", value: "The fcrontab function contains a race condition relating to symlinks."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://security.gentoo.org/glsa/201311-16");
script_cve_id("CVE-2010-0792");
script_tag(name:"cvss_base", value:"1.9");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:N/A:N");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
script_category(ACT_GATHER_INFO);
script_summary("Gentoo Linux Local Security Checks https://security.gentoo.org/glsa/201311-16");
script_copyright("Eero Volotinen");
script_family("Gentoo Local Security Checks");
exit(0);
}
include("revisions-lib.inc");

include("pkg-lib-gentoo.inc");

res = "";
report = "";

if((res=ispkgvuln(pkg:"sys-process/fcron", unaffected: make_list("ge 3.0.5-r2"), vulnerable: make_list("lt 3.0.5-r2"))) != NULL) {

  report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
