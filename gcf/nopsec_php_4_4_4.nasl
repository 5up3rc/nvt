##############################################################################
# OpenVAS Vulnerability Test
# $Id: nopsec_php_4_4_4.nasl 6841 2017-08-03 11:59:21Z emoss $
# 
# PHP Version < 4.4.4 Multiple Vulnerabilities
#
# Authors:
# Songhan Yu <syu@nopsec.com>
#
# Copyright:
# Copyright NopSec Inc. 2012, http://www.nopsec.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.110188");
  script_version("$Revision: 6841 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-03 13:59:21 +0200 (Thu, 03 Aug 2017) $");
  script_tag(name:"creation_date", value:"2012-06-21 11:43:12 +0100 (Thu, 21 Jun 2012)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2006-1017", "CVE-2006-4020");
  script_bugtraq_id(16878, 19415);
  script_name("PHP Version < 4.4.4 Multiple Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright NopSec Inc. 2012");
  script_dependencies("gb_php_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed");

  tag_solution = "Update PHP to version 4.4.4 or later.";

  tag_summary = "PHP version smaller than 4.4.4 suffers from multiple vulnerabilities.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"4.4.4" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"4.4.4" );
  security_message( data:report, port:port );
  exit( 0 );
}

exit( 99 );