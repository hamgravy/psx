#!/bin/bash

# The MIT License (MIT)
#
# Copyright (c) 2015 Elliot Briggs
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

echo "performing tests..."

echo "============ basic key functions ============"
echo "from private key (wif):"
PRIVKEY="L3p8oAcQTtuokSCRHQ7i4MhjWc9zornvpJLfmg62sYpLRJF9woSu"
echo $PRIVKEY

echo "computed compressed format public key (hex):"
PUBKEY=$(echo $PRIVKEY | psx pubkey)
echo $PUBKEY

echo "computed address from wif private key:"
ADDRPRIV=$(echo $PRIVKEY | psx addr)
echo $ADDRPRIV

echo "computed address from hex public key:"
ADDRPUB=$(echo $PUBKEY | psx pub2addr)
echo $ADDRPUB

echo "brainwallet private key (wif) using 'correct horse battery staple' (tests sha256):"
BWPRIVKEY=$(echo "correct horse battery staple" | psx brainwallet)
echo $BWPRIVKEY

echo "=============== TEST RESULTS ================"
if [ "$PUBKEY" = "0378d430274f8c5ec1321338151e9f27f4c676a008bdf8638d07c0b6be9ab35c71" ]; then
	printf "PUBKEY \t\t\t\t\t[OK]\n"
else
	printf "PUBKEY \t\t\t\t\t[FAIL]\n"
fi

if [ "$ADDRPRIV" = "1C7zdTfnkzmr13HfA2vNm5SJYRK6nEKyq8" ]; then
	printf "ADDRPRIV \t\t\t\t[OK]\n"
else
	printf "ADDRPRIV \t\t\t\t[FAIL]\n"
fi

if [ "$ADDRPUB" = "1C7zdTfnkzmr13HfA2vNm5SJYRK6nEKyq8" ]; then
	printf "ADDRPUB \t\t\t\t[OK]\n"
else
	printf "ADDRPUB \t\t\t\t[FAIL]\n"
fi

if [ "$BWPRIVKEY" = "$PRIVKEY" ]; then
	printf "BWPRIVKEY \t\t\t\t[OK]\n"
else
	printf "BWPRIVKEY \t\t\t\t[FAIL]\n"
fi

echo "============== BIP32 functions =============="


BIP32RAND="fffcf9f6f3f0edeae7e4e1dedbd8d5d2cfccc9c6c3c0bdbab7b4b1aeaba8a5a29f9c999693908d8a8784817e7b7875726f6c696663605d5a5754514e4b484542"
BIP32M3R="xprv9vHkqa6EV4sPZHYqZznhT2NPtPCjKuDKGY38FBWLvgaDx45zo9WQRUT3dKYnjwih2yJD9mkrocEZXo1ex8G81dwSM1fwqWpWkeS3v86pgKt
xpub69H7F5d8KSRgmmdJg2KhpAK8SR3DjMwAdkxj3ZuxV27CprR9LgpeyGmXUbC6wb7ERfvrnKZjXoUmmDznezpbZb7ap6r1D3tgFxHmwMkQTPH"
BIP32M4R="xprv9wSp6B7kry3Vj9m1zSnLvN3xH8RdsPP1Mh7fAaR7aRLcQMKTR2vidYEeEg2mUCTAwCd6vnxVrcjfy2kRgVsFawNzmjuHc2YmYRmagcEPdU9
xpub6ASAVgeehLbnwdqV6UKMHVzgqAG8Gr6riv3Fxxpj8ksbH9ebxaEyBLZ85ySDhKiLDBrQSARLq1uNRts8RuJiHjaDMBU4Zn9h8LZNnBC5y4a"
BIP32M5R="$BIP32M4R"
BIP32M6R="$BIP32M5R"
BIP32M7R="xprv9zFnWC6h2cLgpmSA46vutJzBcfJ8yaJGg8cX1e5StJh45BBciYTRXSd25UEPVuesF9yog62tGAQtHjXajPPdbRCHuWS6T8XA2ECKADdw4Ef
xpub6DF8uhdarytz3FWdA8TvFSvvAh8dP3283MY7p2V4SeE2wyWmG5mg5EwVvmdMVCQcoNJxGoWaU9DCWh89LojfZ537wTfunKau47EL2dhHKon"
BIP32M8R="xprvA1RpRA33e1JQ7ifknakTFpgNXPmW2YvmhqLQYMmrj4xJXXWYpDPS3xz7iAxn8L39njGVyuoseXzU6rcxFLJ8HFsTjSyQbLYnMpCqE2VbFWc
xpub6ERApfZwUNrhLCkDtcHTcxd75RbzS1ed54G1LkBUHQVHQKqhMkhgbmJbZRkrgZw4koxb5JaHWkY4ALHY2grBGRjaDMzQLcgJvLJuZZvRcEL"
BIP32M9R="xprvA2nrNbFZABcdryreWet9Ea4LvTJcGsqrMzxHx98MMrotbir7yrKCEXw7nadnHM8Dq38EGfSh6dqA9QWTyefMLEcBYJUuekgW4BYPJcr9E7j
xpub6FnCn6nSzZAw5Tw7cgR9bi15UV96gLZhjDstkXXxvCLsUXBGXPdSnLFbdpq8p9HmGsApME5hQTZ3emM2rnY5agb9rXpVGyy3bdW6EEgAtqt"
BIP32M11R="fail"

echo "using seed (hex)"
echo -e $BIP32RAND

BIP32M1=$(echo $BIP32RAND | psx bip32 m priv)
BIP32M1R="xprv9s21ZrQH143K31xYSDQpPDxsXRTUcvj2iNHm5NUtrGiGG5e2DtALGdso3pGz6ssrdK4PFmM8NSpSBHNqPqm55Qn3LqFtT2emdEXVYsCzC2U"
echo "chain m"
echo -e $BIP32M1

echo "chain m/"
BIP32M2=$(echo $BIP32RAND | psx bip32 m/ priv)
echo -e $BIP32M2
BIP32M2R="$BIP32M1R"

echo "chain m/0"
BIP32M3=$(echo $BIP32RAND | psx bip32 m/0)
echo -e $BIP32M3

echo "chain m/0/2147483647H"
BIP32M4=$(echo $BIP32RAND | psx bip32 m/0/2147483647H)
echo -e $BIP32M4

echo "chain m/0/2147483647h"
BIP32M5=$(echo $BIP32RAND | psx bip32 m/0/2147483647h)
echo -e $BIP32M5

echo "chain m/0/2147483647'"
BIP32M6=$(echo $BIP32RAND | psx bip32 "m/0/2147483647'")
echo -e $BIP32M6

echo "chain m/0/2147483647H/1"
BIP32M7=$(echo $BIP32RAND | psx bip32 m/0/2147483647H/1)
echo -e $BIP32M7

echo "chain m/0/2147483647H/1/2147483646H"
BIP32M8=$(echo $BIP32RAND | psx bip32 m/0/2147483647H/1/2147483646H)
echo -e $BIP32M8

echo "chain m/0/2147483647H/1/2147483646H/2"
BIP32M9=$(echo $BIP32RAND | psx bip32 m/0/2147483647H/1/2147483646H/2)
echo -e $BIP32M9

echo "downstream:"
echo "requested m/0/2147483647H"
echo "provided  m/0"
BIP32M10=$(echo $BIP32RAND | psx bip32 m/0 priv | psx bip32 m/0/2147483647H)
echo -e $BIP32M10

echo "upstream: (expected to fail) "
echo "requested m/0/2147483647H/1/2147483646H"
echo "provided  m/0/2147483647H/1/2147483646H/2"
BIP32M11=$(echo $BIP32RAND | psx bip32 m/0/2147483647H/1/2147483646H/2 priv | psx bip32 m/0/2147483647H/1/2147483646H || echo fail)
echo -e $BIP32M11

echo "=============== TEST RESULTS ================"

if [ "$BIP32M1" = "$BIP32M1R" ]; then
	printf "m \t\t\t\t\t[OK]\n"
else
	printf "m \t\t\t\t\t[FAIL]\n"
fi

if [ "$BIP32M2" = "$BIP32M2R" ]; then
	printf "m/ \t\t\t\t\t[OK]\n"
else
	printf "m/ \t\t\t\t\t[FAIL]\n"
fi

if [ "$BIP32M3" = "$BIP32M3R" ]; then
	printf "m/0 \t\t\t\t\t[OK]\n"
else
	printf "m/0 \t\t\t\t\t[FAIL]\n"
fi

if [ "$BIP32M4" = "$BIP32M4R" ]; then
	printf "m/0/2147483647H \t\t\t[OK]\n"
else
	printf "m/0/2147483647H \t\t\t[FAIL]\n"
fi

if [ "$BIP32M5" = "$BIP32M5R" ]; then
	printf "m/0/2147483647h \t\t\t[OK]\n"
else
	printf "m/0/2147483647h \t\t\t[FAIL]\n"
fi

if [ "$BIP32M6" = "$BIP32M6R" ]; then
	printf "m/0/2147483647' \t\t\t[OK]\n"
else
	printf "m/0/2147483647' \t\t\t[FAIL]\n"
fi

if [ "$BIP32M7" = "$BIP32M7R" ]; then
	printf "m/0/2147483647H/1 \t\t\t[OK]\n"
else
	printf "m/0/2147483647H/1 \t\t\t[FAIL]\n"
fi

if [ "$BIP32M8" = "$BIP32M8R" ]; then
	printf "m/0/2147483647H/1/2147483646H \t\t[OK]\n"
else
	printf "m/0/2147483647H/1/2147483646H \t\t[FAIL]\n"
fi

if [ "$BIP32M9" = "$BIP32M9R" ]; then
	printf "m/0/2147483647H/1/2147483646H/2 \t[OK]\n"
else
	printf "m/0/2147483647H/1/2147483646H/2 \t[FAIL]\n"
fi

if [ "$BIP32M10" = "$BIP32M4" ]; then
	printf "downstream keygen \t\t\t[OK]\n"
else
	printf "downstream keygen \t\t\t[FAIL]\n"
fi

if [ "$BIP32M11" = "$BIP32M11R" ]; then
	printf "upstream keygen \t\t\t[OK]\n"
else
	printf "upstream keygen \t\t\t[FAIL]\n"
fi

echo "============== BIP38 functions =============="

BIP38PASSWD="test"
echo "using private key (wif):"
echo $PRIVKEY
echo "using password:"
echo $BIP38PASSWD

BIP38KEYENC=$(echo $PRIVKEY | psx bip38enc $BIP38PASSWD)
echo "encrypted key:"
echo $BIP38KEYENC

BIP38KEYDEC=$(echo $BIP38KEYENC | psx bip38dec $BIP38PASSWD)
echo "decrypted key:"
echo $BIP38KEYDEC

BIP38KEYBADPASSWD=$(echo $BIP38KEYENC | psx bip38dec badpasswd)
echo "result when bad password used to decrypt key:"
echo $BIP38KEYBADPASSWD

echo "speed test: spawning 100 parallel decryption processes"
echo "executed in..."
start=`date +%s`
for i in {1..100}
do
    echo $BIP38KEYENC | psx bip38dec $BIP38PASSWD > /dev/null &
done
wait
end=`date +%s`
bip38100time=$((end-start))
echo "$bip38100time seconds"

echo "=============== TEST RESULTS ================"
if [ "$BIP38KEYENC" = "6PYLr7QZXmCobukmCxTpSrEzwUTQ5RM2nvgkF8zx72rKYHSmQ3ccYGed4L" ]; then
	printf "BIP38KEYENC \t\t\t\t[OK]\n"
else
	printf "BIP38KEYENC \t\t\t\t[FAIL]\n"
fi

if [ "$BIP38KEYDEC" = "L3p8oAcQTtuokSCRHQ7i4MhjWc9zornvpJLfmg62sYpLRJF9woSu" ]; then
	printf "BIP38KEYDEC \t\t\t\t[OK]\n"
else
	printf "BIP38KEYDEC \t\t\t\t[FAIL]\n"
fi

if [ "$BIP38KEYBADPASSWD" = "address hash mismatch! the attempted password is incorrect" ]; then
	printf "BIP38KEYBADPASSWD \t\t\t[OK]\n"
else
	printf "BIP38KEYBADPASSWD \t\t\t[FAIL]\n"
fi

echo "============== BIP39 functions =============="
BIP39RAND="77c2b00716cec7213839159e404db50d"
BIP39ENCPASSWD="TREZOR"
echo "generating from input (hex):" 
echo $BIP39RAND
echo "using password:"
echo $BIP39ENCPASSWD

BIP39PHRASE=$(echo $BIP39RAND | psx mnemonic encode TREZOR)
echo "encoded mnemonic phrase:"
echo $BIP39PHRASE

BIP39SEED=$(echo $BIP39PHRASE | psx mnemonic decode TREZOR)
echo "decoded seed from mnemonic phrase (hex):"
echo $BIP39SEED

echo "=============== TEST RESULTS ================"
if [ "$BIP39PHRASE" = "jelly better achieve collect unaware mountain thought cargo oxygen act hood bridge" ]; then
	printf "BIP39PHRASE \t\t\t\t[OK]\n"
else
	printf "BIP39PHRASE \t\t\t\t[FAIL]\n"
fi

if [ "$BIP39SEED" = "b5b6d0127db1a9d2226af0c3346031d77af31e918dba64287a1b44b8ebf63cdd52676f672a290aae502472cf2d602c051f3e6f18055e84e4c43897fc4e51a6ff" ]; then
	printf "BIP39SEED \t\t\t\t[OK]\n"
else
	printf "BIP39SEED \t\t\t\t[FAIL]\n"
fi
