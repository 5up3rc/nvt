###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_grapheme_extract_dos_vuln.nasl 4502 2016-11-14 14:48:19Z cfi $
#
# PHP 'grapheme_extract()' NULL Pointer Dereference Denial Of Service Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:php:php";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801860");
  script_version("$Revision: 4502 $");
  script_tag(name:"last_modification", value:"$Date: 2016-11-14 15:48:19 +0100 (Mon, 14 Nov 2016) $");
  script_tag(name:"creation_date", value:"2011-03-10 13:33:28 +0100 (Thu, 10 Mar 2011)");
  script_cve_id("CVE-2011-0420");
  script_bugtraq_id(46429);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("PHP 'grapheme_extract()' NULL Pointer Dereference Denial Of Service Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_php_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/65437");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/16182");
  script_xref(name:"URL", value:"http://securityreason.com/achievement_securityalert/94");
  script_xref(name:"URL", value:"http://svn.php.net/viewvc/php/php-src/trunk/ext/intl/grapheme/grapheme_string.c?r1=306449&r2=306448&pathrev=306449");

  tag_solution = "Apply the patch
  http://svn.php.net/viewvc?view=revision&revision=306449

  *****
  NOTE: Ignore this warning, if above mentioned patch is already applied.
  *****";

  tag_impact = "Successful exploitation could allows context-dependent attackers to cause a
  denial of service.

  Impact Level: Network";

  tag_affected = "PHP version 5.3.5";

  tag_insight = "A flaw is caused by a NULL pointer dereference in the 'grapheme_extract()'
  function in the Internationalization extension (Intl) for ICU which allows
  context-dependent attackers to cause a denial of service via an invalid size
  argument.";

  tag_summary = "This host is running PHP and is prone to NULL pointer dereference
  denial of service vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

if(version_is_equal(version:phpVer, test_version:"5.3.5")){
  report = report_fixed_ver(installed_version:phpVer, fixed_version:"5.3.6");
  security_message(data:report, port:phpPort);
  exit(0);
}

exit(99);