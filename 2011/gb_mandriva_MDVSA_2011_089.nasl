###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for mplayer MDVSA-2011:089 (mplayer)
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
tag_insight = "Multiple vulnerabilities have been identified and fixed in mplayer:

  FFmpeg 0.5 allows remote attackers to cause a denial of service (hang)
  via a crafted file that triggers an infinite loop. (CVE-2009-4636)
  
  flicvideo.c in libavcodec 0.6 and earlier in FFmpeg, as used in MPlayer
  and other products, allows remote attackers to execute arbitrary code
  via a crafted flic file, related to an arbitrary offset dereference
  vulnerability. (CVE-2010-3429)
  
  libavcodec/vorbis_dec.c in the Vorbis decoder in FFmpeg 0.6.1
  and earlier allows remote attackers to cause a denial of service
  (application crash) via a crafted .ogg file, related to the
  vorbis_floor0_decode function. (CVE-2010-4704)
  
  Fix heap corruption crashes (CVE-2011-0722)
  
  Fix invalid reads in VC-1 decoding (CVE-2011-0723)
  
  And several additional vulnerabilites originally discovered by Google
  Chrome developers were also fixed with this advisory.
  
  The updated packages have been patched to correct these issues.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "mplayer on Mandriva Linux 2010.1,
  Mandriva Linux 2010.1/X86_64";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.mandriva.com/security-announce/2011-05/msg00011.php");
  script_id(831389);
  script_version("$Revision: 6570 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:06:35 +0200 (Thu, 06 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-05-17 15:58:48 +0200 (Tue, 17 May 2011)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "MDVSA", value: "2011:089");
  script_cve_id("CVE-2009-4636", "CVE-2010-3429", "CVE-2010-4704", "CVE-2011-0722", "CVE-2011-0723");
  script_name("Mandriva Update for mplayer MDVSA-2011:089 (mplayer)");

  script_summary("Check for the Version of mplayer");
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

  if ((res = isrpmvuln(pkg:"mencoder", rpm:"mencoder~1.0~1.rc4.0.r31086.3.1mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mplayer", rpm:"mplayer~1.0~1.rc4.0.r31086.3.1mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mplayer-doc", rpm:"mplayer-doc~1.0~1.rc4.0.r31086.3.1mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mplayer-gui", rpm:"mplayer-gui~1.0~1.rc4.0.r31086.3.1mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
