# psx

What is psx? psx is...

* a cross-platform commandline bitcoin tool written for the tinkerer, the curious bitcoin user.
* portable by nature, leveraging python and bash to tie together many essential bitcoin functions and features.
* deployed as a single file.
* only dependent on packages that are installable using package managers like apt-get, pip, etc
* developed and tested on both x86_64 and armhf architectures, on Linux (Ubuntu) and Mac OSX operating systems. 
* written to illustrate and provide a simple commandline interface to various BIPs. 
* modular and easily added to

psx currently specializes in keys and key derivation for bitcoin, providing a simple bash interface for BIP32, BIP38, BIP39, and brainwallets. 

psx is still really new and under constant development, so check back for new features. Feature requests are welcome in the github issues section. 

=====================

PREPARE: get these packages from your distro's package repo if they aren't already installed. On Ubuntu...

    apt-get install python-pip libssl-dev python-ecdsa

INSTALL:

    python setup.py install

UNINSTALL:

    python setup.py install --record files.txt
    cat files.txt | xargs rm -rf

GETTING STARTED - TESTING AND EXAMPLES:

Use the included demo.sh for regression testing, demonstration and syntax examples

=====================

Recent Features:
All private key features of BIP32 are now supported, including hardened keys.

Coming Soon:
Pubkey features of BIP32, base-6 key generation for dice-roll private key encoding, more streamlined regression testing and demonstration script, help dialog to list commands.

Later:
bitcoin transaction tools