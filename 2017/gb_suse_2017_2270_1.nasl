###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2017_2270_1.nasl 7032 2017-08-31 12:58:05Z santu $
#
# SuSE Update for freeradius-server openSUSE-SU-2017:2270-1 (freeradius-server)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.851600");
  script_version("$Revision: 7032 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-31 14:58:05 +0200 (Thu, 31 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-29 08:06:49 +0200 (Tue, 29 Aug 2017)");
  script_cve_id("CVE-2017-10978", "CVE-2017-10983", "CVE-2017-10984", "CVE-2017-10985", 
                "CVE-2017-10986", "CVE-2017-10987", "CVE-2017-10988");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for freeradius-server openSUSE-SU-2017:2270-1 (freeradius-server)");
  script_tag(name: "summary", value: "Check the version of freeradius-server");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for freeradius-server fixes the following issues:

  - update to 3.0.15 (bsc#1049086)
  * Bind the lifetime of program name and python path to the module
  * CVE-2017-10978: FR-GV-201: Check input / output length in
  make_secret() (bsc#1049086)
  * CVE-2017-10983: FR-GV-206: Fix read overflow when decoding DHCP option
  63 (bsc#1049086)
  * CVE-2017-10984: FR-GV-301: Fix write overflow in data2vp_wimax()
  (bsc#1049086)
  * CVE-2017-10985: FR-GV-302: Fix infinite loop and memory exhaustion
  with 'concat' attributes (bsc#1049086)
  * CVE-2017-10986: FR-GV-303: Fix infinite read in dhcp_attr2vp()
  (bsc#1049086)
  * CVE-2017-10987: FR-GV-304: Fix buffer over-read in
  fr_dhcp_decode_suboptions() (bsc#1049086)
  * CVE-2017-10988: FR-GV-305: Decode 'signed' attributes correctly.
  (bsc#1049086)
  * FR-AD-001: use strncmp() instead of memcmp() for bounded data
  * Print messages when we see deprecated configuration items
  * Show reasons why we couldn't parse a certificate expiry time
  * Be more accepting about truncated ASN1 times.
  * Fix OpenSSL API issue which could leak small amounts of memory.
  * For Access-Reject, call rad_authlog() after running the post-auth
  section, just like for Access-Accept.
  * Don't crash when reading corrupted data from session resumption cache.
  * Parse port in dhcpclient.
  * Don't leak memory for OpenSSL.
  * Portability fixes taken from OpenBSD port collection.
  * run rad_authlog after post-auth for Access-Reject.
  * Don't process VMPS packets twice.
  * Fix attribute truncation in rlm_perl
  * Fix bug when processing huntgroups.
  * FR-AD-002 - Bind the lifetime of program name and python path to the
  module
  * FR-AD-003 - Pass correct statement length into sqlite3_prepare[_v2]

  This update was imported from the SUSE:SLE-12-SP3:Update update project.");
  script_tag(name: "affected", value: "freeradius-server on openSUSE Leap 42.3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2017:2270_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2017-08/msg00067.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"freeradius-server", rpm:"freeradius-server~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-debuginfo", rpm:"freeradius-server-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-debugsource", rpm:"freeradius-server-debugsource~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-devel", rpm:"freeradius-server-devel~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-doc", rpm:"freeradius-server-doc~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-krb5", rpm:"freeradius-server-krb5~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-krb5-debuginfo", rpm:"freeradius-server-krb5-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-ldap", rpm:"freeradius-server-ldap~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-ldap-debuginfo", rpm:"freeradius-server-ldap-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-libs", rpm:"freeradius-server-libs~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-libs-debuginfo", rpm:"freeradius-server-libs-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-mysql", rpm:"freeradius-server-mysql~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-mysql-debuginfo", rpm:"freeradius-server-mysql-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-perl", rpm:"freeradius-server-perl~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-perl-debuginfo", rpm:"freeradius-server-perl-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-postgresql", rpm:"freeradius-server-postgresql~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-postgresql-debuginfo", rpm:"freeradius-server-postgresql-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-python", rpm:"freeradius-server-python~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-python-debuginfo", rpm:"freeradius-server-python-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-sqlite", rpm:"freeradius-server-sqlite~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-sqlite-debuginfo", rpm:"freeradius-server-sqlite-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-utils", rpm:"freeradius-server-utils~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-server-utils-debuginfo", rpm:"freeradius-server-utils-debuginfo~3.0.15~3.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
