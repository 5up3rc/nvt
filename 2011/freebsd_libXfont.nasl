#
#VID 304409c3-c3ef-11e0-8aa5-485d60cb5385
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 304409c3-c3ef-11e0-8aa5-485d60cb5385
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

include("revisions-lib.inc");
tag_insight = "The following package is affected: libXfont

CVE-2011-2895
The LZW decompressor in (1) the BufCompressedFill function in
fontfile/decompress.c in X.Org libXfont before 1.4.4 and (2)
compress/compress.c in 4.3BSD, as used in zopen.c in OpenBSD before
3.8, FreeBSD, NetBSD, FreeType 2.1.9, and other products, does not
properly handle code words that are absent from the decompression
table when encountered, which allows context-dependent attackers to
trigger an infinite loop or a heap-based buffer overflow, and possibly
execute arbitrary code, via a crafted compressed stream, a related
issue to CVE-2006-1168 and CVE-2011-2896.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

https://bugzilla.redhat.com/show_bug.cgi?id=725760
http://www.vuxml.org/freebsd/304409c3-c3ef-11e0-8aa5-485d60cb5385.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_id(70266);
 script_version("$Revision: 5424 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-25 17:52:36 +0100 (Sat, 25 Feb 2017) $");
 script_tag(name:"creation_date", value:"2011-09-21 05:47:11 +0200 (Wed, 21 Sep 2011)");
 script_tag(name:"cvss_base", value:"9.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-2895");
 script_name("FreeBSD Ports: libXfont");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-bsd.inc");

txt = "";
vuln = 0;
bver = portver(pkg:"libXfont");
if(!isnull(bver) && revcomp(a:bver, b:"1.4.4,1")<0) {
    txt += 'Package libXfont version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
