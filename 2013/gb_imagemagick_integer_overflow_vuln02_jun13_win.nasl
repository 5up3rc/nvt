###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_imagemagick_integer_overflow_vuln02_jun13_win.nasl 6079 2017-05-08 09:03:33Z teissa $
#
# ImageMagick Integer Overflow Vulnerability - 02 June13 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
###############################################################################

tag_impact = "Successful exploitation will allow an attacker to cause denial of service
  condition result in loss of availability for the application.
  Impact Level: Application";

tag_affected = "ImageMagick version before 6.7.6-4 on Windows.";
tag_insight = "Integer overflow error occurs due to improper sanitation of user supplied
  input when by a crafted JPEG EXIF tag with an excessive components count
  to the 'GetEXIFProperty()' and 'SyncImageProfiles()' functions in
  magick/profile.c";
tag_solution = "Upgrade to ImageMagick version 6.7.6-4 or later.
  http://www.imagemagick.org/script/download.php";
tag_summary = "The host is installed with ImageMagick and is prone to integer
  overflow Vulnerability.";

if(description)
{
  script_id(803817);
  script_version("$Revision: 6079 $");
  script_cve_id("CVE-2012-1610");
  script_bugtraq_id(52898);
  script_tag(name:"last_modification", value:"$Date: 2017-05-08 11:03:33 +0200 (Mon, 08 May 2017) $");
  script_tag(name:"creation_date", value:"2013-06-24 13:28:50 +0530 (Mon, 24 Jun 2013)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_name("ImageMagick Integer Overflow Vulnerability - 02 June13 (Windows)");
  script_xref(name : "URL" , value : "http://seclists.org/oss-sec/2012/q2/19");
  script_xref(name : "URL" , value : "http://www.cert.fi/en/reports/2012/vulnerability635606.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("secpod_imagemagick_detect_win.nasl");
  script_mandatory_keys("ImageMagick/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("version_func.inc");

imageVer = get_kb_item("ImageMagick/Win/Ver");
if(!imageVer){
  exit(0);
}

if(version_is_less(version:imageVer, test_version:"6.7.6.4"))
{
  security_message(0);
  exit(0);
}
