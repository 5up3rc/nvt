# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2011-0600.nasl 6556 2017-07-06 11:54:54Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.122173");
script_version("$Revision: 6556 $");
script_tag(name:"creation_date", value:"2015-10-06 14:14:14 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:54:54 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2011-0600");
script_tag(name: "insight", value: "ELSA-2011-0600 -  dovecot security and enhancement update - [2.0.9-2]- fix issues and assert crashes found in 2.0.9 (lmtp,dotlock,zlib)[2.0.9-1]- dovecot updated to 2.0.9- fixed a high system CPU usage / high context switch count performance problem- lda: Fixed a crash when trying to send 'out of quota' reply[2.0.8-1]- dovecot updated to 2.0.8 (fixes #654226), pigeonhole updated to 0.2.2- IMAP: Fixed SELECT QRESYNC not to crash on mailbox close if a lot of changes were being sent. - Fixed leaking fds when writing to dovecot.mailbox.log.- Fixed rare dovecot.index.cache corruption- zlib: Fixed several crashes, which mainly showed up with mbox.- acl: Fixed crashing when sometimes listing shared mailboxes via dict proxy.- mdbox: Fixed potential assert-crash when saving multiple messages in one transaction- dsync: a lot of fixes- fixed lda + sieve crash"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2011-0600");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2011-0600.html");
script_cve_id("CVE-2010-3707","CVE-2010-3780");
script_tag(name:"cvss_base", value:"5.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:N");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"dovecot", rpm:"dovecot~2.0.9~2.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"dovecot-devel", rpm:"dovecot-devel~2.0.9~2.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"dovecot-mysql", rpm:"dovecot-mysql~2.0.9~2.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"dovecot-pgsql", rpm:"dovecot-pgsql~2.0.9~2.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"dovecot-pigeonhole", rpm:"dovecot-pigeonhole~2.0.9~2.el6", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

