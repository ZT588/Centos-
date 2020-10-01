#!/bin/bash
#
rm IDC-host-list.txt
wget https://zabbix.zenlayer.win/IDC-host-list.txt

rm -rf /root/xshell/*

pack=1   #pack=1会话打包；
ini=tem.txt
info=IDC-host-list.txt
path=./xshell/


while read line
do
        arr=(${line//,/ })
        name=${arr[0]}
        ip=${arr[1]}
        cp ${ini} ${path}${name}-${ip}.xsh
        sed -i 's/192.168.1.1/'$ip'/' ${path}${name}-${ip}.xsh
        #vim -c ":%s/192.168.1.1/$ip/g" -c ":x" ${path}${ip}.xsh
        #echo "$name-$ip"
done<${info}


if [ $pack -eq 1 ] ;then
        tar -zvcf home.tar.gz ${path} >/dev/null

cd /root/xshell
mkdir 欧洲
cd 欧洲
mkdir 欧洲-德国法兰克福
mkdir 欧洲-俄罗斯莫斯科
mkdir 欧洲-法国巴黎
mkdir 欧洲-法国马赛
mkdir 欧洲-荷兰阿姆斯特丹
mkdir 欧洲-土耳其伊斯坦布尔
mkdir 欧洲-西班牙马德里
mkdir 欧洲-英国伦敦
cd /root/xshell
mkdir 美洲
cd 美洲
mkdir 北美-美国达拉斯
mkdir 北美-美国华盛顿
mkdir 北美-美国洛杉矶
mkdir 北美-美国迈阿密
mkdir 北美-美国纽约
mkdir 北美-美国圣何塞
mkdir 北美-美国西雅图
mkdir 北美-美国亚特兰大
mkdir 北美-美国芝加哥
mkdir 南美-巴西圣保罗
mkdir 北美-美国墨西哥
cd /root/xshell
mkdir 非洲
cd 非洲
mkdir 非洲-南非
mkdir 非洲-尼利日亚
mkdir 非洲-坦桑尼亚达累斯萨拉姆
cd /root/xshell
mkdir 亚太
cd 亚太
mkdir 亚洲-阿联酋迪拜
mkdir 亚洲-阿联酋富吉拉
mkdir 亚洲-卡塔尔
mkdir 亚洲-菲律宾马尼拉
mkdir 亚洲-韩国首尔
mkdir 亚洲-马来西亚吉隆坡
mkdir 亚洲-日本东京
mkdir 亚洲-日本大阪
mkdir 亚洲-台湾高雄
mkdir 亚洲-台湾台北
mkdir 亚洲-泰国曼谷
mkdir 亚洲-香港
mkdir 亚洲-新加坡
mkdir 亚洲-印度
cd 亚洲-印度
mkdir 亚洲-印度班加罗尔
mkdir 亚洲-印度海得拉巴
mkdir 亚洲-印度加尔各答
mkdir 亚洲-印度孟买
mkdir 亚洲-印度清奈
mkdir 亚洲-印度新德里
cd ..
mkdir 亚洲-印尼雅加达
mkdir 亚洲-越南胡志明
mkdir 亚洲-缅甸仰光
cd /root/xshell
mkdir 大洋洲
cd 大洋洲
mkdir 大洋洲-新西兰墨尔本

cd /root/xshell

mkdir 中国
cd 中国
mkdir 中国-北京
mkdir 中国-上海
mkdir 中国-广州
mkdir 中国-成都
mkdir 中国-佛山
mkdir 中国-杭州
mkdir 中国-南京
mkdir 中国-深圳
mkdir 中国-天津
mkdir 中国-济南
mkdir 中国-武汉
mkdir 中国-西安
mkdir 中国-温州
mkdir 中国-无锡
mkdir 中国-石家庄
mkdir 中国-沈阳
cd /root/xshell


mv *JNB* /root/xshell/非洲/非洲-南非
mv *LOS* /root/xshell/非洲/非洲-尼利日亚


mv *MEL*  /root/xshell/大洋洲/大洋洲-新西兰墨尔本

mv US-LAX* /root/xshell/美洲/北美-美国洛杉矶
mv US-IAD* /root/xshell/美洲/北美-美国华盛顿
mv US-DFW* /root/xshell/美洲/北美-美国达拉斯
mv US-MIA* /root/xshell/美洲/北美-美国迈阿密
mv US-NYC* /root/xshell/美洲/北美-美国纽约
mv *nyc* /root/xshell/美洲/北美-美国纽约
mv US-SJC* /root/xshell/美洲/北美-美国圣何塞
mv US-SEA* /root/xshell/美洲/北美-美国西雅图
mv US-ATL* /root/xshell/美洲/北美-美国亚特兰大
mv US-CHI* /root/xshell/美洲/北美-美国芝加哥
mv SA-SAO* /root/xshell/美洲/南美-巴西圣保罗
mv *mex* /root/xshell/美洲/北美-美国墨西哥

mv *FRA* /root/xshell/欧洲/欧洲-德国法兰克福
mv *fra* /root/xshell/欧洲/欧洲-德国法兰克福
mv *MOW* /root/xshell/欧洲/欧洲-俄罗斯莫斯科
mv *PAR* /root/xshell/欧洲/欧洲-法国巴黎
mv *MRS* /root/xshell/欧洲/欧洲-法国马赛
mv *AMS* /root/xshell/欧洲/欧洲-荷兰阿姆斯特丹
mv *ams* /root/xshell/欧洲/欧洲-荷兰阿姆斯特丹
mv *IST* /root/xshell/欧洲/欧洲-土耳其伊斯坦布尔
mv *LON* /root/xshell/欧洲/欧洲-英国伦敦
mv *MAD* /root/xshell/欧洲/欧洲-西班牙马德里



mv *DXB* /root/xshell/亚太/亚洲-阿联酋迪拜
mv *FJR* /root/xshell/亚太/亚洲-阿联酋富吉拉
mv *fjr* /root/xshell/亚太/亚洲-阿联酋富吉拉
mv *DOH* /root/xshell/亚太/亚洲-卡塔尔
mv *MNL* /root/xshell/亚太/亚洲-菲律宾马尼拉
mv *SEL* /root/xshell/亚太/亚洲-韩国首尔
mv *KUL* /root/xshell/亚太/亚洲-马来西亚吉隆坡
mv *TYO* /root/xshell/亚太/亚洲-日本东京
mv *tyo* /root/xshell/亚太/亚洲-日本东京
mv *OSA* /root/xshell/亚太/亚洲-日本大阪
mv *TPE* /root/xshell/亚太/亚洲-台湾台北
mv *KHH* /root/xshell/亚太/亚洲-台湾高雄
mv *BKK* /root/xshell/亚太/亚洲-泰国曼谷
mv *HKG* /root/xshell/亚太/亚洲-香港
mv *hkg* /root/xshell/亚太/亚洲-香港
mv *SIN* /root/xshell/亚太/亚洲-新加坡
mv *sin* /root/xshell/亚太/亚洲-新加坡
mv *JKT* /root/xshell/亚太/亚洲-印尼雅加达
mv *jkt* /root/xshell/亚太/亚洲-印尼雅加达
mv *SGN* /root/xshell/亚太/亚洲-越南胡志明
mv *RGN* /root/xshell/亚太/亚洲-缅甸仰光
mv *BLR* /root/xshell/亚太/亚洲-印度/亚洲-印度班加罗尔
mv *HYD* /root/xshell/亚太/亚洲-印度/亚洲-印度海得拉巴
mv *CCU* /root/xshell/亚太/亚洲-印度/亚洲-印度加尔各答
mv *BOM* /root/xshell/亚太/亚洲-印度/亚洲-印度孟买
mv *MAA* /root/xshell/亚太/亚洲-印度/亚洲-印度清奈
mv *maa* /root/xshell/亚太/亚洲-印度/亚洲-印度清奈
mv *DEL* /root/xshell/亚太/亚洲-印度/亚洲-印度新德里

mv *PEK* /root/xshell/中国/中国-北京
mv *SHA* /root/xshell/中国/中国-上海
mv *sha* /root/xshell/中国/中国-上海
mv *CAN* /root/xshell/中国/中国-广州
mv *can* /root/xshell/中国/中国-广州
mv *CTU* /root/xshell/中国/中国-成都
mv *FUO* /root/xshell/中国/中国-佛山
mv *HGH* /root/xshell/中国/中国-杭州
mv *NKG* /root/xshell/中国/中国-南京
mv *SZX* /root/xshell/中国/中国-深圳
mv *TSN* /root/xshell/中国/中国-天津
mv *TNA* /root/xshell/中国/中国-济南
mv *WUH* /root/xshell/中国/中国-武汉
mv *XIY* /root/xshell/中国/中国-西安
mv *WNZ* /root/xshell/中国/中国-温州
mv *WUX* /root/xshell/中国/中国-无锡
mv *SJW* /root/xshell/中国/中国-石家庄
mv *SHE* /root/xshell/中国/中国-沈阳

zip -r $(date +"%Y%m%d%H%M").xshell.zip /root/xshell

mv /root/xshell/*.xshell.zip  /www/wwwroot/zenlayer/

curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=3cd9e34d-9d84-49a7-a144-69a33750b3dd' \
   -H 'Content-Type: application/json' \
   -d '
   {
        "msgtype": "text",
        "text": {
            "content": "Xshell CRT 更新完毕,请登录ftp://xshell.zqf.ink 查看。"
        }
   }'
fi
