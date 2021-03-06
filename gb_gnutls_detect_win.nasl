##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_gnutls_detect_win.nasl 6516 2017-07-04 12:20:47Z cfischer $
#
# GnuTLS Version Detection (Windows)
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800916");
  script_version("$Revision: 6516 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 14:20:47 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-02-03 13:43:16 +0530 (Mon, 03 Feb 2014)");
  script_tag(name:"qod_type", value:"registry");
  script_name("GnuTLS Version Detection (Windows)");

  tag_summary =
"Detection of installed version of GnuTLS on Windows.

The script logs in via smb, searches for GnuTLS in the registry
and gets the version from registry.";


  script_tag(name : "summary" , value : tag_summary);
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

## Variable Initialization
gnuTLSName="";
gnuTLSPath="";
gnuTLSName="";
osArch = "";
key_list = "";

osArch = get_kb_item("SMB/Windows/Arch");
if(!osArch)
{
  exit(-1);
}

## if os is 32 bit iterate over comman path
if("x86" >< osArch){
  key_list = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}

## Check for 64 bit platform
else if("x64" >< osArch){
 key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                      "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    gnuTLSName = registry_get_sz(key:key + item, item:"DisplayName");

    ## confirm the application
    if("GnuTLS" >< gnuTLSName)
    {

      ## Get the version
      gnuTLSName = registry_get_sz(key:key + item, item:"DisplayVersion");

      ## Get the installed path
      gnuTLSPath = registry_get_sz(key:key + item, item:"InstallLocation");
      if(!gnuTLSPath){
        gnuTLSPath = "Couldn find the install location from registry";
      }

      if(gnuTLSName)
      {
        replace_kb_item(name:"GnuTLS_or_OpenSSL/Win/Installed", value:TRUE);
        set_kb_item(name:"GnuTLS/Win/Ver", value:gnuTLSName);

        ## build cpe
        cpe = build_cpe(value:gnuTLSName, exp:"^([0-9.]+)", base:"cpe:/a:gnu:gnutls:");
        if(!cpe)
          cpe = "cpe:/a:gnu:gnutls";

        ## Register Product and Build Report
        build_report(app: "GnuTLS", ver:gnuTLSName, cpe:cpe, insloc:gnuTLSPath);

        if("x64" >< osArch && "Wow6432Node" >!< key)
        {
          replace_kb_item(name:"GnuTLS_or_OpenSSL/Win/Installed", value:TRUE);
          set_kb_item(name:"GnuTLS64/Win/Ver", value:gnuTLSName);

          ## build cpe
          cpe = build_cpe(value:gnuTLSName, exp:"^([0-9.]+)", base:"cpe:/a:gnu:gnutls:x64:");
          if(!cpe)
            cpe = "cpe:/a:gnu:gnutls:x64";

          ## Register Product and Build Report
          build_report(app: "GnuTLS", ver:gnuTLSName, cpe:cpe, insloc:gnuTLSPath);
        }

        ## To improve performance by avoiding extra iteration over uninstall path
        exit(0);
      }
    }
  }
}
