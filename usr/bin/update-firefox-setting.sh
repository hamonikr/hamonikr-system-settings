#!/bin/bash
# update firefox default setting

TARGET="/usr/lib/firefox/distribution/distribution.ini"
TARGET2="/usr/lib/firefox/browser/defaults/preferences/vendor-firefox.js"

if [[ -f "$TARGET" ]] ; then
    sed -i 's/id=.*/id=hamonikr/g' $TARGET
    sed -i 's/about=.*/about=Mozilla Firefox for HamoniKR/g' $TARGET

    sed -i 's/app.distributor=.*/app.distributor="hamonikr"/g' $TARGET
    sed -i 's/app.distributor.channel=.*/app.distributor.channel="hamonikr"/g' $TARGET
    sed -i 's/app.partner.hamonikr=.*/app.partner.hamonikr="hamonikr"/g' $TARGET

    sed -i 's/browser.startup.homepage=.*/browser.startup.homepage="https:\/\/hamonikr.org"/g' $TARGET

    sed -i 's/general.useragent.vendor=.*/general.useragent.vendor="HamoniKR"/g' $TARGET
    sed -i 's/general.useragent.vendorSub=.*/general.useragent.vendorSub="4.0"/g' $TARGET
    sed -i 's/general.useragent.vendorComment=.*/general.useragent.vendorComment="Jin"/g' $TARGET

    sed -i 's/keyword.URL=.*/keyword.URL="http:\/\/www.google.com\/search?q="/g' $TARGET

    sed -i '/\[BookmarksToolbar\]/d' $TARGET 
    sed -i '/item.1.title=/d' $TARGET     
    sed -i '/item.1.link=/d' $TARGET     
    sed -i '/item.1.description=/d' $TARGET     

    echo "[BookmarksToolbar]
item.1.title=HamoniKR
item.1.link=https://hamonikr.org
item.1.description=No1 Linux Community HamoniKR" | tee -a $TARGET >/dev/null 2>&1

else
    cp -a /etc/hamonikr/distribution.ini $TARGET
fi

if [[ -f "$TARGET2" ]] ; then
    sed -i 's/id=.*/id=hamonikr/g' $TARGET2
    sed -i 's/pref("general.useragent.vendor".*/pref("general.useragent.vendor", "HamoniKR");/g' $TARGET2
    sed -i 's/pref("general.useragent.vendorSub".*/pref("general.useragent.vendorSub", "4.0");/g' $TARGET2
    sed -i 's/pref("general.useragent.vendorComment".*/pref("general.useragent.vendorComment", "Jin");/g' $TARGET2    

    sed -i 's/pref("distribution.searchplugins.defaultLocale".*/pref("distribution.searchplugins.defaultLocale", "ko-KR");/g' $TARGET2
    
    sed -i '/pref("browser.showPersonalToolbar"/g' $TARGET2
    echo "pref(\"browser.showPersonalToolbar\", true);" | tee -a $TARGET2 >/dev/null 2>&1
    
else
    cp -a /etc/hamonikr/vendor-firefox.js $TARGET2    
fi