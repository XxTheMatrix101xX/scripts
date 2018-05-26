sudo apt-get install -y build-essential libssl-dev libdb++-dev libboost-all-dev libqrencode-dev miniupnpc libminiupnpc-dev
git clone https://github.com/mammix2/global-master/ globe
cd globe/src
chmod 755 leveldb/build_detect_platform
make -f makefile.unix
mkdir ~/.global/
echo daemon=1 > ~/.global/global.conf
echo rpcuser=dsaflkjdasfb >> ~/.global/global.conf
echo rpcpassword=dfsauiebdasfdfus >> ~/.global/global.conf
echo addnode=159.65.186.196 >> ~/.global/global.conf
./globald
