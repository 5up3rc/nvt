###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_java_jre_xml4j_unspecified_vuln.nasl 4869 2016-12-29 11:01:45Z teissa $
#
# IBM Runtimes for Java Technology XML4J Unspecified Vulnerability
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

tag_solution = "Apply the following patch.
  http://www-01.ibm.com/support/docview.wss?rs=71&uid=swg1IZ63920

  *****
  NOTE: Ignore this warning if above mentioned patch is already applied.
  *****";

tag_impact = "Unknown impact.";
tag_affected = "IBM Runtimes for Java Technology 5.0.0 before SR10 on Linux.";
tag_insight = "An unspecified error occurs in the 'XML4J' component while parsing XML
  code.";
tag_summary = "This host is installed with IBM Runtime for Java Technology and
  is prone to unspecified vulnerability.";

if(description)
{
  script_id(800974);
  script_version("$Revision: 4869 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-29 12:01:45 +0100 (Thu, 29 Dec 2016) $");
  script_tag(name:"creation_date", value:"2009-11-09 14:01:44 +0100 (Mon, 09 Nov 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-3852");
  script_bugtraq_id(36894);
  script_name("IBM Runtimes for Java Technology XML4J Unspecified Vulnerability");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/37210");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/54069");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2009/3106");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_lin.nasl");
  script_require_keys("IBM/Java/JRE/Linux/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  exit(0);
}


include("version_func.inc");

jreVer = get_kb_item("IBM/Java/JRE/Linux/Ver");
if(!jreVer){
  exit(0);
}

jreVer = ereg_replace(pattern:"_", string:jreVer, replace: ".");
if(jreVer)
{
  # Check for version < 5.0.0 SR10 (1.5.0.SR10)
  if(version_in_range(version:jreVer, test_version:"1.5", test_version2:"1.5.0.SR9")){
    security_message(0);
  }
}
