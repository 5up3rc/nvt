###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hp_onboard_4_22.nasl 6756 2017-07-18 13:31:14Z cfischer $
#
# HP BladeSystem c-Class Onboard Administrator (OA) running OpenSSL, Remote Disclosure of Information
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:hp:onboard_administrator";

tag_impact = "Successfully exploiting this issue may allow attackers to obtain
sensitive information by conducting a man-in-the-middle attack. This
may lead to other attacks.";

tag_affected = "Onboard Administrator < 4.22";

tag_summary = "A potential security vulnerability has been identified with HP BladeSystem
c-Class Onboard Administrator (OA) running OpenSSL. This vulnerability could be exploited
remotely to allow the disclosure of information.";

tag_solution = "Update to version 4.22";

tag_vuldetect = "Check the Onboard Administrator version";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105056");
 script_bugtraq_id(67899);
 script_cve_id("CVE-2014-0224");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_version ("$Revision: 6756 $");

 script_name("HP BladeSystem c-Class Onboard Administrator Remote Disclosure of Information");


 script_xref(name:"URL", value:"http://www.securityfocus.com/bid/67899");
 script_xref(name:"URL", value:"http://h20566.www2.hp.com/portal/site/hpsc/template.PAGE/public/kb/docDisplay/?spf_p.tpst=kbDocDisplay&spf_p.prp_kbDocDisplay=wsrp-navigationalState%3DdocId%253Demr_na-c04351097-1%257CdocLocale%253D%257CcalledBy%253D&javax.portlet.begCacheTok=com.vignette.cachetoken&javax.portlet.endCacheTok=com.vignette.cachetoken");
 
 script_tag(name:"last_modification", value:"$Date: 2017-07-18 15:31:14 +0200 (Tue, 18 Jul 2017) $");
 script_tag(name:"creation_date", value:"2014-07-04 10:53:22 +0200 (Fri, 04 Jul 2014)");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("gb_hp_onboard_administrator_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("hp_onboard_admin/installed");

 script_tag(name : "impact" , value : tag_impact);
 script_tag(name : "vuldetect" , value : tag_vuldetect);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "affected" , value : tag_affected);

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! ver = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"4.22" ) )
{
  report = 'Installed version: ' + vers + '\nFixed version:     4.22\n';
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
