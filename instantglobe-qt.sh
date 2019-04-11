sudo apt-get install -y git build-essential libssl-dev libdb++-dev libboost-all-dev libqrencode-dev miniupnpc libminiupnpc-dev qt5-default qt5-qmake qtbase5-dev-tools qttools5-dev-tools  build-essential libboost-dev libboost-system-dev  libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libssl-dev libdb++-dev libminiupnpc-dev  qtscript5-dev qtscript-tools  libqt5webkit5 libqt5webkit5-dev libqt5webkit5-qmlwebkitplugin
git clone https://github.com/mammix2/global-master/ globe
cd globe/src
chmod 755 leveldb/build_detect_platform
cd leveldb/
make libleveldb.a libmemenv.a
cd ../..
mkdir ~/.global/
echo rpcuser=dsaflkjdasfb >> ~/.global/global.conf
echo rpcpassword=dfsauiebdasfdfus >> ~/.global/global.conf
echo addnode=159.65.186.196 >> ~/.global/global.conf
qmake
make
while true; do
    read -p "Do you wish to install or just compile (y = install, n = compile)?" yn
    case $yn in
        [Yy]* ) sudo cp global-qt /usr/local/bin/global-qt; echo installed to bin; exit;;
        [Nn]* ) echo compilation completed; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
