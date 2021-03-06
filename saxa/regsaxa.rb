#!/usr/bin/ruby

actual_dir = File.dirname(__FILE__)
data = ''

puts "ip do aparelho : "
ip = gets

puts "username : "
username = gets

puts "domain : "
domain = gets

puts "password : "
password = gets

puts "proxy : "
proxy = gets

puts "Prepare o Saxa para o upload ... press ENTER to continue"
gets

puts "Aguarde ....."
ip = ip.gsub(/\n/, "")
username = username.gsub(/\n/, "")
domain = domain.gsub(/\n/, "")
password = password.gsub(/\n/, "")
proxy = proxy.gsub(/\n/, "")

data = 'Version=02.08

[Auth]
NtwkPasswd=

[TCP_IP]
DHCP_Use=0
IpAddress=[IPADDRESS]
NetMask=255.255.255.0
DefGwAddress=192.168.191.254
DNS_Use=1
DNSAddress1=192.168.192.111
DNSAddress2=0.0.0.0

[Network]
NWPort=0
PCPort=0
TOSRTP=00
TOSSIP=00
GratuitousARP=2
VLAN=0
VLANID=1
VLANPRI=7
VLANIDDAT=2
VLANPRIDAT=0
VLANMODE=1

[NTP]
NTP_Use=1
NTPSrv1=192.168.192.111
NTPSrv2=
TimeOffset=9
PeerTimer=24
ClientMode=1

[Maintenance]
MntPCAddress=192.168.192.114
MntPCPort=4000
UserInfo1=
UserInfo2=
RegInfoInterval=10
RegInfoRetry=0

[SIP]
SipAddress=[USERNAME]@[DOMAIN]
ManagePortSIP=5060
ManagePort2SIP=5061
ManagePortRTP=10000
RtpPortRange=20000
ManagePortGW=5062
Authorization=1
UserID=[USERNAME]
Password=[PASSWORD]
DisplayName=[USERNAME]
DisplayNameNotice=1
HoldSel=1
ParkHoldSel=2
AttendedTransferSel=0
UnAttendedTransferSel=0
Server_Change=0
Proxy1=[PROXY]
Proxy1DomainName=[DOMAIN]
Proxy1Port=5060
Register1=[PROXY]
Register1DomainName=[DOMAIN]
Register1Port=5060
SubscribeServer1=[PROXY]
Subscribe1DomainName=[DOMAIN]
SubscribeServer1Port=5060
Proxy2=
Proxy2DomainName=
Proxy2Port=5060
Register2=
Register2DomainName=
Register2Port=5060
SubscribeServer2=
Subscribe2DomainName=
SubscribeServer2Port=5060
EmergencyGateway=
EmergencyGatewayPort=5060
SrvRegInterval=30
SrvRegRetry=6
RegHelthChkTime=3600
CallHelthChkTime=0
ConnWaitTimeVal=300
CallingRspWaitTime=5
Server_Unregist=1
qvalue=
AlertString1=
AlertString2=
AlertString3=
AlertString4=
AlertString5=
AlertString6=
AlertString7=
AlertString8=

[RTP]
u-law=20
G729=20
CodecPriority=1
Auto=1
uLawBegin=2
uLawMax=5
G729Begin=2
G729Max=5
RtpIdleTime=0
RtcpInterval=5

[Tel]
NotouchTimer=4
Privacy=1
PrivacyNotice=0
HeadSet=0
CallDialGuard=0
RelActMode=0
BackLight=1
IncomingDispMode=0
VoiceMailSel=1
MenuIdleTimer=30
AutoAnsAnalyze=0
AutoAnsRinger=0
RingerTypeIK=1
RingerTypeDIN=2
RingerType=0
AlertInfo=0
AlertRinger1=0
AlertRinger2=0
AlertRinger3=0
AlertRinger4=0
AlertRinger5=0
AlertRinger6=0
AlertRinger7=0
AlertRinger8=0
MicLevel=3
KeyTouchNotice=1
Howler=1

[FlexibleKey]
LK1=50
LK2=40
LK3=0
LK4=0
LK5=20
LK6=60
LK7=20
LK8=20
LK9=20
LK10=20
LK11=20
LK12=20
LK13=20
LK14=0
LK15=0
LK16=0
LK17=0
LK18=0
LK19=130
LK20=0
LK21=0
LK22=20
LK23=20
LK24=20
LK25=30
LK26=30
LK27=30
LK28=30
LK29=30
LK30=30
LineKeyInfo1=
LineKeyInfo2=
LineKeyInfo3=
LineKeyInfo4=
LineKeyInfo5=racha_cuca2
LineKeyInfo6=
LineKeyInfo7=bufalobill
LineKeyInfo8=bufalobill2
LineKeyInfo9=super_sam2
LineKeyInfo10=ring
LineKeyInfo11=hunt
LineKeyInfo12=acd
LineKeyInfo13=symbato_yamazaki2
LineKeyInfo14=
LineKeyInfo15=
LineKeyInfo16=
LineKeyInfo17=
LineKeyInfo18=
LineKeyInfo19=
LineKeyInfo20=
LineKeyInfo21=
LineKeyInfo22=abomineve_homem_das_naves
LineKeyInfo23=racha_cuca
LineKeyInfo24=symbato_yamazaki
LineKeyInfo25=850
LineKeyInfo26=840
LineKeyInfo27=830
LineKeyInfo28=820
LineKeyInfo29=810
LineKeyInfo30=800

[Tokuban]
DIN=0
CP=*38
PK=*40
DTMFGrpPark=
DTMFResponse=
DTMFHold=
ConnSignalMode=0
DTMFMode=0
RFC2833_PayloadType=96
RFC2833_Volume=10
RFC2833_Duration=100
CalledHeaderType=1
ParkGroupName=park

'

data = data.gsub "[IPADDRESS]", ip
data = data.gsub "[USERNAME]", username
data = data.gsub "[DOMAIN]", domain
data = data.gsub "[PASSWORD]", password
data = data.gsub "[PROXY]", proxy

File.open("/tmp/bip_sys_tmp.ini", 'w') {|f| f.write(data) }

ip = ip.gsub(/\n/, "")

system "ncftpput -a -u Ip_Net_Phone_S -p Mnt04313345933974933390 #{ip} . /tmp/bip_sys_tmp.ini "
system "rm /tmp/bip_sys_tmp.ini"

puts "Script Finalizado"
