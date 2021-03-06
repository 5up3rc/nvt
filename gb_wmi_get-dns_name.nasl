###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wmi_get-dns_name.nasl 6893 2017-08-10 13:46:00Z cfischer $
#
# Get the DNS Name over WMI
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
#
# Set in an Workgroup Environment under Vista, Windows7 or Windows 8
# with enabled UAC this DWORD to access WMI:
# HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system\LocalAccountTokenFilterPolicy to 1
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

SCRIPT_OID = "1.3.6.1.4.1.25623.1.0.96216";
SCRIPT_DESC = "Get the DNS Name over WMI";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6893 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-10 15:46:00 +0200 (Thu, 10 Aug 2017) $");
  script_tag(name:"creation_date", value:"2013-10-21 12:47:04 +0200 (Mon, 21 Oct 2013)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name(SCRIPT_DESC);
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Windows");
  script_dependencies("gb_wmi_access.nasl");
  script_mandatory_keys("WMI/access_successful");

  script_tag(name:"summary", value:"The script gets the DNS Name over WMI.");

  script_tag(name:"qod_type", value:"registry");

  exit(0);
}

include("host_details.inc");

host    = get_host_ip();
usrname = get_kb_item( "SMB/login" );
passwd  = get_kb_item( "SMB/password" );

if( ! host || ! usrname || ! passwd ) exit( 0 );

domain = get_kb_item( "SMB/domain" );
if( domain ) usrname = domain + '\\' + usrname;

handle = wmi_connect( host:host, username:usrname, password:passwd );
if( ! handle ) exit( 0 );

#DomainRole
#0 (0x0) Standalone Workstation
#1 (0x1) Member Workstation
#2 (0x2) Standalone Server
#3 (0x3) Member Server
#4 (0x4) Backup Domain Controller
#5 (0x5) Primary Domain Controller

query = "select DNSHostName, Domain, DomainRole from Win32_ComputerSystem";

DNS = wmi_query( wmi_handle:handle, query:query );
wmi_close( wmi_handle:handle );

if( DNS ) {

  DNS       = split( DNS, keep:FALSE );
  val       = split( DNS[1], sep:'|', keep:FALSE );
  DNSName   = val[0];
  FQDNSName = val[1];
  DNSRole   = val[2];

  if( DNSRole == 1 || DNSRole > 2 ) {
    if( ! isnull( DNSName ) && ! isnull( FQDNSName ) ) {
      register_host_detail( name:"DNS-via-WMI-FQDNS", value:DNSName + "." + FQDNSName, nvt:SCRIPT_OID, desc:SCRIPT_DESC );
      set_kb_item( name:"DNS-via-WMI-FQDNS", value: DNSName + "." + FQDNSName );
    }
  }

  if( ! isnull( DNSName ) ) {
    register_host_detail( name:"DNS-via-WMI-DNS", value:DNSName, nvt:SCRIPT_OID, desc:SCRIPT_DESC );
    set_kb_item( name:"DNS-via-WMI-DNS", value:DNSName );
  }
}

exit( 0 );
