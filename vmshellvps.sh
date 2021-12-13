#!/usr/bin/env bash

if [ -f /etc/redhat-release ]; then
    release="centos"
elif cat /etc/issue | grep -Eqi "debian"; then
    release="debian"
elif cat /etc/issue | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
elif cat /proc/version | grep -Eqi "debian"; then
    release="debian"
elif cat /proc/version | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
fi

# > /dev/null 2>&1
echo "���ڰ�װ��������..${release}"
if [ "${release}" == "centos" ]; then
    yum update
    yum -y install wget curl screen zip unzip
else
    apt-get update
    apt-get -y install wget curl screen zip unzip
fi


echo "���ؽű�..${release}"

mkdir -p /opt/script/cron
wget --no-check-certificate -qO /opt/script/cron/cleanCache.sh https://github.com/FoxBary/smallvps/blob/main/cleanCache.sh
wget --no-check-certificate -qO /opt/script/cron/cleanLog.sh https://github.com/FoxBary/smallvps/blob/main/cleanLog.sh

chmod +x /opt/script/cron/cleanCache.sh
chmod +x /opt/script/cron/cleanLog.sh


crontab -l > /opt/script/cron/tmp
echo "*/3 * * * * sh /opt/script/cron/cleanCache.sh" >> /opt/script/cron/tmp
echo "*/2 * * * * sh /opt/script/cron/cleanlog.sh" >> /opt/script/cron/tmp
crontab /opt/script/cron/tmp

echo "VPSС�ڴ�������������ɣ�"


echo "����:Vmshell INC"
echo "VPSС�ڴ�������,��Ҫ���VPS���ڴ治����ԣ������£���ҳ�滺�����־�ļ��ȵ�ռ����VPS��Ӳ�̺��ڴ�ռ䣬���ǽ������Զ���������⣬�ýű�����:Vmshell INC������������ע��������ҵ����ע��������������ӪASN��:147002���ṩ���CMI������������ɼ�G���Ƽ�����񣬹ٷ���ַ��https://vmshell.com/"
echo "TeleGram����:https://t.me/vmshellhk"
echo "TeleGramƵ��:https://t.me/vmshell"
echo "�ṩ΢��/֧����/����PayPal֧��(3�����������˿�)"
echo "����������ַ:  https://vmshell.com/"
echo "��ҵ��������:  https://tototel.com/"

echo ""
