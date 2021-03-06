###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ruby_random_number_values_info_disc_vuln.nasl 7052 2017-09-04 11:50:51Z teissa $
#
# Ruby Random Number Values Information Disclosure Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploits may allow attackers to predict random number values.
  Impact Level: Application";
tag_affected = "Ruby Versions prior to Ruby 1.8.6-p114";
tag_insight = "The flaw exists because ruby does not reset the random seed upon forking,
  which makes it easier for context-dependent attackers to predict the values
  of random numbers by leveraging knowledge of the number sequence obtained in
  a different child process.";
tag_solution = "Upgrade to Ruby version 1.8.6-p114 or later
  For updates refer to http://rubyforge.org/frs/?group_id=167";
tag_summary = "This host is installed with Ruby and is prone to information
  disclosure vulnerability.";

if(description)
{
  script_id(902559);
  script_version("$Revision: 7052 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-04 13:50:51 +0200 (Mon, 04 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-08-29 16:22:41 +0200 (Mon, 29 Aug 2011)");
  script_cve_id("CVE-2011-3009");
  script_bugtraq_id(49126);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Ruby Random Number Values Information Disclosure Vulnerability");
  script_xref(name : "URL" , value : "http://redmine.ruby-lang.org/issues/show/4338");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2011/07/20/1");

  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (c) 2011 SecPod");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("secpod_ruby_detect_win.nasl");
  script_require_keys("Ruby/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

## Get Version from KB
rubyVer = get_kb_item("Ruby/Win/Ver");
if(!rubyVer){
  exit(0);
}

## Check for Ruby Versions prior to 1.8.6-p114
if(version_is_less(version:rubyVer, test_version:"1.8.6.p114")) {
  security_message(0);
}
