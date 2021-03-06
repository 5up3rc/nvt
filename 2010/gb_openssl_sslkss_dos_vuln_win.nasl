###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_sslkss_dos_vuln_win.nasl 5323 2017-02-17 08:49:23Z teissa $
#
# OpenSSL 'kssl_keytab_is_available()' Denial Of Service Vulnerability (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attacker to cause denial of service
  conditions.
  Impact Level: Application";
tag_affected = "OpenSSL version prior to 0.9.8n on Windows.";
tag_insight = "The flaw is due to error in 'kssl_keytab_is_available()' function in
  'ssl/kssl.c' which does not check a certain return value when Kerberos is
  enabled. This allows NULL pointer dereference and daemon crash via SSL
  cipher negotiation.";
tag_solution = "Upgrade to version 0.9.8n or later.
  For updates refer tohttp://www.slproweb.com/products/Win32OpenSSL.html";
tag_summary = "This host is installed with OpenSSL and is prone to Denial Of
  Service Vulnerability.";

if(description)
{
  script_id(800490);
  script_version("$Revision: 5323 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-17 09:49:23 +0100 (Fri, 17 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-03-10 15:48:25 +0100 (Wed, 10 Mar 2010)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2010-0433");
  script_name("OpenSSL 'kssl_keytab_is_available()' Denial Of Service Vulnerability (Windows)");
  script_xref(name : "URL" , value : "http://seclists.org/oss-sec/2010/q1/175");
  script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=569774");
  script_xref(name : "URL" , value : "https://bugzilla.redhat.com/show_bug.cgi?id=567711");
  script_xref(name : "URL" , value : "http://permalink.gmane.org/gmane.comp.security.oss.general/2636");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_openssl_detect_win.nasl");
  script_require_keys("OpenSSL/Win/Ver");
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

opensslVer = get_kb_item("OpenSSL/Win/Ver");
if(isnull(opensslVer)){
  exit(0);
}

if(version_is_less(version:opensslVer, test_version:"0.9.8n")){
   security_message(0);
}
