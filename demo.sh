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
export PRIVKEY="L3p8oAcQTtuokSCRHQ7i4MhjWc9zornvpJLfmg62sYpLRJF9woSu"
export PUBKEY=$(echo $PRIVKEY | psx pubkey)
export ADDRPRIV=$(echo $PRIVKEY | psx addr)
export ADDRPUB=$(echo $PUBKEY | psx pub2addr)
export BWPRIVKEY=$(echo "correct horse battery staple" | psx brainwallet)
echo "from private key (wif):"
echo $PRIVKEY
echo "computed compressed format public key (hex):"
echo $PUBKEY
echo "computed address from wif private key:"
echo $ADDRPRIV
echo "computed address from hex public key:"
echo $ADDRPUB
echo "brainwallet private key (wif) using 'correct horse battery staple' (tests sha256):"
echo $BWPRIVKEY

echo "=============== TEST RESULTS ================"
if [ "$PUBKEY" = "0378d430274f8c5ec1321338151e9f27f4c676a008bdf8638d07c0b6be9ab35c71" ] 
then
	printf "PUBKEY \t\t\t\t\t[OK]\n"
else
	printf "PUBKEY \t\t\t\t\t[FAIL]\n"
fi

if [ "$ADDRPRIV" = "1C7zdTfnkzmr13HfA2vNm5SJYRK6nEKyq8" ] 
then
	printf "ADDRPRIV \t\t\t\t[OK]\n"
else
	printf "ADDRPRIV \t\t\t\t[FAIL]\n"
fi

if [ "$ADDRPUB" = "1C7zdTfnkzmr13HfA2vNm5SJYRK6nEKyq8" ] 
then
	printf "ADDRPUB \t\t\t\t[OK]\n"
else
	printf "ADDRPUB \t\t\t\t[FAIL]\n"
fi

if [ "$BWPRIVKEY" = "$PRIVKEY" ] 
then
	printf "BWPRIVKEY \t\t\t\t[OK]\n"
else
	printf "BWPRIVKEY \t\t\t\t[FAIL]\n"
fi

echo "============== BIP32 functions =============="
export BIP32RAND="fffcf9f6f3f0edeae7e4e1dedbd8d5d2cfccc9c6c3c0bdbab7b4b1aeaba8a5a29f9c999693908d8a8784817e7b7875726f6c696663605d5a5754514e4b484542"
export BIP32M1=$(echo $BIP32RAND | psx bip32 m)
export BIP32M2=$(echo $BIP32RAND | psx bip32 m/)
export BIP32M3=$(echo $BIP32RAND | psx bip32 m/0)
export BIP32M4=$(echo $BIP32RAND | psx bip32 m/0/2147483647H)
export BIP32M5=$(echo $BIP32RAND | psx bip32 m/0/2147483647h)
export BIP32M6=$(echo $BIP32RAND | psx bip32 "m/0/2147483647'")
export BIP32M7=$(echo $BIP32RAND | psx bip32 m/0/2147483647H/1)
export BIP32M8=$(echo $BIP32RAND | psx bip32 m/0/2147483647H/1/2147483646H)
export BIP32M9=$(echo $BIP32RAND | psx bip32 m/0/2147483647H/1/2147483646H/2)
export BIP32M10=$(echo $BIP32M3 | psx bip32 m/0/2147483647H)
echo "using seed (hex)"
echo $BIP32RAND
echo "chain m"
echo $BIP32M1
echo "chain m/"
echo $BIP32M2
echo "chain m/0"
echo $BIP32M3
echo "chain m/0/2147483647H"
echo $BIP32M4
echo "chain m/0/2147483647h"
echo $BIP32M5
echo "chain m/0/2147483647'"
echo $BIP32M6
echo "chain m/0/2147483647H/1"
echo $BIP32M7
echo "chain m/0/2147483647H/1/2147483646H"
echo $BIP32M8
echo "chain m/0/2147483647H/1/2147483646H/2"
echo $BIP32M9
echo "downstream m/0/2147483647H"
echo $BIP32M10
echo "=============== TEST RESULTS ================"
if [ "$BIP32M1" = "xprv9s21ZrQH143K31xYSDQpPDxsXRTUcvj2iNHm5NUtrGiGG5e2DtALGdso3pGz6ssrdK4PFmM8NSpSBHNqPqm55Qn3LqFtT2emdEXVYsCzC2U" ] 
then
	printf "m \t\t\t\t\t[OK]\n"
else
	printf "m \t\t\t\t\t[FAIL]\n"
fi

if [ "$BIP32M2" = "xprv9s21ZrQH143K31xYSDQpPDxsXRTUcvj2iNHm5NUtrGiGG5e2DtALGdso3pGz6ssrdK4PFmM8NSpSBHNqPqm55Qn3LqFtT2emdEXVYsCzC2U" ] 
then
	printf "m/ \t\t\t\t\t[OK]\n"
else
	printf "m/ \t\t\t\t\t[FAIL]\n"
fi

if [ "$BIP32M3" = "xprv9vHkqa6EV4sPZHYqZznhT2NPtPCjKuDKGY38FBWLvgaDx45zo9WQRUT3dKYnjwih2yJD9mkrocEZXo1ex8G81dwSM1fwqWpWkeS3v86pgKt" ] 
then
	printf "m/0 \t\t\t\t\t[OK]\n"
else
	printf "m/0 \t\t\t\t\t[FAIL]\n"
fi

if [ "$BIP32M4" = "xprv9wSp6B7kry3Vj9m1zSnLvN3xH8RdsPP1Mh7fAaR7aRLcQMKTR2vidYEeEg2mUCTAwCd6vnxVrcjfy2kRgVsFawNzmjuHc2YmYRmagcEPdU9" ] 
then
	printf "m/0/2147483647H \t\t\t[OK]\n"
else
	printf "m/0/2147483647H \t\t\t[FAIL]\n"
fi

if [ "$BIP32M5" = "xprv9wSp6B7kry3Vj9m1zSnLvN3xH8RdsPP1Mh7fAaR7aRLcQMKTR2vidYEeEg2mUCTAwCd6vnxVrcjfy2kRgVsFawNzmjuHc2YmYRmagcEPdU9" ] 
then
	printf "m/0/2147483647h \t\t\t[OK]\n"
else
	printf "m/0/2147483647h \t\t\t[FAIL]\n"
fi

if [ "$BIP32M6" = "xprv9wSp6B7kry3Vj9m1zSnLvN3xH8RdsPP1Mh7fAaR7aRLcQMKTR2vidYEeEg2mUCTAwCd6vnxVrcjfy2kRgVsFawNzmjuHc2YmYRmagcEPdU9" ] 
then
	printf "m/0/2147483647' \t\t\t[OK]\n"
else
	printf "m/0/2147483647' \t\t\t[FAIL]\n"
fi

if [ "$BIP32M7" = "xprv9zFnWC6h2cLgpmSA46vutJzBcfJ8yaJGg8cX1e5StJh45BBciYTRXSd25UEPVuesF9yog62tGAQtHjXajPPdbRCHuWS6T8XA2ECKADdw4Ef" ] 
then
	printf "m/0/2147483647H/1 \t\t\t[OK]\n"
else
	printf "m/0/2147483647H/1 \t\t\t[FAIL]\n"
fi

if [ "$BIP32M8" = "xprvA1RpRA33e1JQ7ifknakTFpgNXPmW2YvmhqLQYMmrj4xJXXWYpDPS3xz7iAxn8L39njGVyuoseXzU6rcxFLJ8HFsTjSyQbLYnMpCqE2VbFWc" ] 
then
	printf "m/0/2147483647H/1/2147483646H \t\t[OK]\n"
else
	printf "m/0/2147483647H/1/2147483646H \t\t[FAIL]\n"
fi

if [ "$BIP32M9" = "xprvA2nrNbFZABcdryreWet9Ea4LvTJcGsqrMzxHx98MMrotbir7yrKCEXw7nadnHM8Dq38EGfSh6dqA9QWTyefMLEcBYJUuekgW4BYPJcr9E7j" ] 
then
	printf "m/0/2147483647H/1/2147483646H/2 \t[OK]\n"
else
	printf "m/0/2147483647H/1/2147483646H/2 \t[FAIL]\n"
fi

if [ "$BIP32M4" = "$BIP32M10" ] 
then
	printf "downstream keygen \t\t\t[OK]\n"
else
	printf "downstream keygen \t\t\t[FAIL]\n"
fi

echo "============== BIP38 functions =============="
export BIP38PASSWD="test"
export BIP38KEYENC=$(echo $PRIVKEY | psx bip38enc $BIP38PASSWD)
export BIP38KEYDEC=$(echo $BIP38KEYENC | psx bip38dec $BIP38PASSWD)
export BIP38KEYBADPASSWD=$(echo $BIP38KEYENC | psx bip38dec badpasswd)
echo "using private key (wif):"
echo $PRIVKEY
echo "using password:"
echo $BIP38PASSWD
echo "encrypted key:"
echo $BIP38KEYENC
echo "decrypted key:"
echo $BIP38KEYDEC
echo "result when bad password used to decrypt key:"
echo $BIP38KEYBADPASSWD
echo "=============== TEST RESULTS ================"
if [ "$BIP38KEYENC" = "6PYLr7QZXmCobukmCxTpSrEzwUTQ5RM2nvgkF8zx72rKYHSmQ3ccYGed4L" ]
then
	printf "BIP38KEYENC \t\t\t\t[OK]\n"
else
	printf "BIP38KEYENC \t\t\t\t[FAIL]\n"
fi

if [ "$BIP38KEYDEC" = "L3p8oAcQTtuokSCRHQ7i4MhjWc9zornvpJLfmg62sYpLRJF9woSu" ]
then
	printf "BIP38KEYDEC \t\t\t\t[OK]\n"
else
	printf "BIP38KEYDEC \t\t\t\t[FAIL]\n"
fi

if [ "$BIP38KEYBADPASSWD" = "address hash mismatch! the attempted password is incorrect" ]
then
	printf "BIP38KEYBADPASSWD \t\t\t[OK]\n"
else
	printf "BIP38KEYBADPASSWD \t\t\t[FAIL]\n"
fi

echo "============== BIP39 functions =============="
export BIP39RAND="77c2b00716cec7213839159e404db50d"
export BIP39ENCPASSWD="TREZOR"
export BIP39PHRASE=$(echo $BIP39RAND | psx mnemonic encode TREZOR)
export BIP39SEED=$(echo $BIP39PHRASE | psx mnemonic decode TREZOR)
echo "generating from input (hex):" 
echo $BIP39RAND
echo "using password:"
echo $BIP39ENCPASSWD
echo "encoded mnemonic phrase:"
echo $BIP39PHRASE
echo "decoded seed from mnemonic phrase (hex):"
echo $BIP39SEED
echo "=============== TEST RESULTS ================"
if [ "$BIP39PHRASE" = "jelly better achieve collect unaware mountain thought cargo oxygen act hood bridge" ]
then
	printf "BIP39PHRASE \t\t\t\t[OK]\n"
else
	printf "BIP39PHRASE \t\t\t\t[FAIL]\n"
fi

if [ "$BIP39SEED" = "b5b6d0127db1a9d2226af0c3346031d77af31e918dba64287a1b44b8ebf63cdd52676f672a290aae502472cf2d602c051f3e6f18055e84e4c43897fc4e51a6ff" ] 
then
	printf "BIP39SEED \t\t\t\t[OK]\n"
else
	printf "BIP39SEED \t\t\t\t[FAIL]\n"
fi
