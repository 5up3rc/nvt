###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_qnap_qts_64719.nasl 6756 2017-07-18 13:31:14Z cfischer $
#
# QNAP QTS 'f' Parameter Directory Traversal Vulnerability
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

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103877";

tag_insight = "QNAP QTS is a Network-Attached Storage (NAS) system
accessible via a web interface. QNAP QTS 4.0.3 and possibly earlier
versions contain a path traversal vulnerability via the cgi-bin/jc.cgi
CGI script. The script accepts an 'f' parameter which takes an
unrestricted file path as input.";

tag_impact = "A remote attacker could exploit the vulnerability using directory-
traversal characters ('../') to access arbitrary files that contain
sensitive information. Information harvested may aid in launching
further attacks.";

tag_affected = "QNAP QTS 4.0.3 is vulnerable; other versions may also be affected.";

tag_summary = "QNAP QTS is prone to a directory-traversal vulnerability because it
fails to properly sanitize user-supplied input.";

tag_solution = "Update to 4.1.0";
tag_vuldetect = "Check the firmware version.";

if (description)
{
 script_oid(SCRIPT_OID);
 script_bugtraq_id(64719);
 script_cve_id("CVE-2013-7174");
 script_tag(name:"cvss_base", value:"7.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:N/A:N");
 script_version ("$Revision: 6756 $");

 script_name("QNAP QTS 'f' Parameter Directory Traversal Vulnerability");


 script_xref(name:"URL", value:"http://www.securityfocus.com/bid/64719");
 
 script_tag(name:"last_modification", value:"$Date: 2017-07-18 15:31:14 +0200 (Tue, 18 Jul 2017) $");
 script_tag(name:"creation_date", value:"2014-01-09 18:58:01 +0100 (Thu, 09 Jan 2014)");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("gb_qnap_nas_detect.nasl");
 script_require_ports("Services/www", 80, 8080);
 script_mandatory_keys("qnap/qts");

 script_tag(name : "impact" , value : tag_impact);
 script_tag(name : "vuldetect" , value : tag_vuldetect);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "affected" , value : tag_affected);

 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("version_func.inc");

if ( ! get_kb_item("qnap/qts") ) exit( 0 );
if ( ! version = get_kb_item( "qnap/version" ) ) exit(0); 

if ( version_is_less( version: version, test_version: "4.1.0")) {
    security_message(port:port);
    exit(0);
}

exit(0);
