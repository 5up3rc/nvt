###############################################################################
# OpenVAS Vulnerability Test
# $Id: dnsmasq_tftp.nasl 4466 2016-11-10 09:45:28Z teissa $
#
# Dnsmasq TFTP Service multiple vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

CPE = "cpe:/a:thekelleys:dnsmasq";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100267");
  script_version("$Revision: 4466 $");
  script_tag(name:"last_modification", value:"$Date: 2016-11-10 10:45:28 +0100 (Thu, 10 Nov 2016) $");
  script_tag(name:"creation_date", value:"2009-09-02 11:12:57 +0200 (Wed, 02 Sep 2009)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_bugtraq_id(36121,36120);
  script_cve_id("CVE-2009-2957","CVE-2009-2958");
  script_name("Dnsmasq TFTP Service multiple vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("Buffer overflow");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("dnsmasq_version.nasl");
  script_mandatory_keys("dnsmasq/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/36121");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/36120");
  script_xref(name:"URL", value:"http://www.thekelleys.org.uk/dnsmasq/doc.html");
  script_xref(name:"URL", value:"http://www.coresecurity.com/content/dnsmasq-vulnerabilities");

  tag_summary = "Dnsmasq is prone to a remotely exploitable heap-overflow vulnerability
  because the software fails to properly bounds-check user-supplied
  input before copying it into an insufficiently sized memory buffer.";

  tag_impact = "Remote attackers can exploit this issue to execute arbitrary machine
  code in the context of the vulnerable software on the targeted
  user's computer.

  Dnsmasq is also prone to a NULL-pointer dereference vulnerability.
  An attacker can exploit this issue to crash the affected application, denying
  service to legitimate users.";

  tag_insight = "NOTE: The TFTP service must be enabled for this issue to be exploitable; this
  is not the default.";

  tag_impact = "Versions *prior to* Dnsmasq 2.50 are vulnerable.";

  tag_solution = "Updates are available. Please see the references for more information.";

  tag_affected = " dnsmasq 2.40, dnsmasq 2.41, dnsmasq 2.42, dnsmasq 2.43, dnsmasq 2.44, dnsmasq 2.45, dnsmasq 2.46, dnsmasq 2.47, dnsmasq 2.48, dnsmasq 2.49, Older versions are probably affected too, but they were not checked.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"insight", value:tag_insight);

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}
     
include("tftp.inc");
include("version_func.inc");
include("host_details.inc");

tftpPort = get_kb_item( 'Services/udp/tftp' );
if( ! tftpPort ) tftpPort = 69;

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! infos = get_app_version_and_proto( cpe:CPE, port:port ) ) exit( 0 );

version = infos["version"];
proto = infos["proto"];

if( version_is_less( version:version, test_version:"2.50" ) ) {

  report = report_fixed_ver( installed_version:version, fixed_version:"2.50" );

  if( tftp_alive( port:tftpPort ) ) {
    report += string("\n\nOn port " + tftpPort + "/udp a running TFTPD was found at this host. If this is the\ndnsmasq-tftpd, you should disable it immediately until you have\nswitched to the latest version of dnsmasq.\n");
  } 
  security_message( data:report, port:port, proto:proto );
  exit( 0 );
}

exit( 99 );
