###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ruby_on_rails_active_support_dos_vuln_win.nasl 5867 2017-04-05 09:01:13Z teissa $
#
# Ruby on Rails Active Support Denial of Service Vulnerability (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = 'cpe:/a:rubyonrails:ruby_on_rails';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807383");
  script_version("$Revision: 5867 $");
  script_cve_id("CVE-2015-3227");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-04-05 11:01:13 +0200 (Wed, 05 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-10-13 16:29:50 +0530 (Thu, 13 Oct 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Ruby on Rails Active Support Denial of Service Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running Ruby on Rails and is
  prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to Specially crafted XML
  documents can cause applications to raise a SystemStackError and potentially
  cause a denial of service attack.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to cause denial of service attack.

  Impact Level: Application");

  script_tag(name:"affected", value:" 
  Ruby on Rails before 4.1.11 and
  Ruby on Rails 4.2.x before 4.2.2 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Ruby on Rails 4.1.11, 
  4.2.2 or later, For updates refer to http://rubyonrails.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://openwall.com/lists/oss-security/2015/06/16/16");
  script_xref(name : "URL" , value : "https://groups.google.com/forum/message/raw?msg=rubyonrails-security/bahr2JLnxvk/x4EocXnHPp8J");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_ruby_rails_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("RubyOnRails/installed", "Host/runs_windows");
  script_require_ports("Services/www", 3000);
  exit(0);
}


##
### Code Starts Here
##

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
RubyonRailPort = "";
RubyonRailVer = "";

## exit, if its not windows
if(host_runs("Windows") != "yes")exit(0);

## Get HTTP Port
if(!RubyonRailPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!RubyonRailVer = get_app_version(cpe:CPE, port:RubyonRailPort)){
  exit(0);
}

if(version_is_less(version:RubyonRailVer, test_version:"4.1.11"))
{
  fix = "4.1.11";
  VULN = TRUE;
}

## Check for version 4.2.x before 4.2.2
else if(RubyonRailVer =~ "^(4\.2)")
{ 
  if(version_is_less(version:RubyonRailVer, test_version:"4.2.2"))
  { 
    fix = "4.2.2";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:RubyonRailVer, fixed_version:fix);
  security_message(port:RubyonRailPort, data:report);
  exit(0);
}