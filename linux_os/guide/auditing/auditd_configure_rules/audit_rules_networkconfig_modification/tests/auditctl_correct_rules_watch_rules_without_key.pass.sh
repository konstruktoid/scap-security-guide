#!/bin/bash
# packages = audit


# use auditctl
{{{ setup_auditctl_environment() }}}


rm -rf /etc/audit/rules.d/*
rm /etc/audit/audit.rules

echo "-a always,exit -F arch=b32 -S sethostname,setdomainname -F key=audit_rules_networkconfig_modification" >> /etc/audit/audit.rules
echo "-a always,exit -F arch=b64 -S sethostname,setdomainname -F key=audit_rules_networkconfig_modification" >> /etc/audit/audit.rules
echo "-w /etc/issue -p wa" >> /etc/audit/audit.rules
echo "-w /etc/issue.net -p wa" >> /etc/audit/audit.rules
echo "-w /etc/hosts -p wa" >> /etc/audit/audit.rules
{{% if 'ubuntu' in product -%}}
echo "-w /etc/networks -p wa" >> /etc/audit/audit.rules
echo "-w /etc/network/ -p wa" >> /etc/audit/audit.rules
{{% else -%}}
echo "-w /etc/sysconfig/network -p wa" >> /etc/audit/audit.rules
{{% endif %}}
{{% if product in ['ubuntu2404'] %}}
echo "-w /etc/netplan/ -p wa" >> /etc/audit/audit.rules
{{% endif %}}
