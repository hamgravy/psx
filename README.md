# psx
A python implementation and extension of the sx bitcoin tool.

This tool is intended to provide a maximally portable bitcoin swiss army knife, compatible with spesmilo's sx tool. This is alpha-level software and does not yet accomplish the intended goals. Use this software at your own risk. 

PREPARE: Install these packages to get going. There are a minimum number of required dependencies, by design. For example, on an Ubuntu machine...
    # apt-get install python-ecdsa python-openssl
    # pip install scrypt
    # git clone https://github.com/trezor/python-mnemonic
    # ./setup.py install

INSTALL: Move the psx.py to a location in your path. Make sure it has execute permissions for the necessary users and groups. 


tests/demos:
=====================

generate wif encode private key for compressed format:
    $ ./psx newkey
   L4WMDSB4UrpfXpvuLJJ67HoZ7AENgnbxhav8TRLEG1XyeTwpJ7WJ

generate compressed format pubkey (hex) from private key (wif):
    $ ./psx newkey | tee priv.key
    L4WMDSB4UrpfXpvuLJJ67HoZ7AENgnbxhav8TRLEG1XyeTwpJ7WJ
    $ cat priv.key | ./psx pubkey
    032f4181f54eb3ea6fa3291c44c063faa9bd6aea85d739b4453a5722b8dabaa8de

generate compressed format bitcoin address from wif private key
    $ cat priv.key | ./psx addr
    147MVjbvN1vgqhYbWG2exUe5e6SzGec9PH

generate private key and its address simultaneously 
    $ ./psx newkey | tee priv.key  | ./psx addr | tee addr.key
    1J64dNkaH9JFDu7y56yUFyoFPmzdtLSXHb

generate private key using the "brain wallet" technique
    $ echo "brainwallet test" | ./psx brainwallet
    L2EqmMYGNuLnEaaYmpphp2UQtT35hyJ73VZA4F3vXngwDXVwgZb6

encode/decode bip39:
    $ echo "77c2b00716cec7213839159e404db50d" | ./psx mnemonic encode TREZOR | tee phrase.txt
    jelly better achieve collect unaware mountain thought cargo oxygen act hood bridge
    $ cat phrase.txt | ./psx mnemonic decode TREZOR
    b5b6d0127db1a9d2226af0c3346031d77af31e918dba64287a1b44b8ebf63cdd52676f672a290aae502472cf2d602c051f3e6f18055e84e4c43897fc4e51a6ff
encode/decode bip38:
    $ echo "correct horse battery staple" | ./psx brainwallet | ./psx bip38enc test | tee bip38key.txt
    6PYLr7QZXmCobukmCxTpSrEzwUTQ5RM2nvgkF8zx72rKYHSmQ3ccYGed4L
    $ cat bip38key.txt | ./psx bip38dec test
    L3p8oAcQTtuokSCRHQ7i4MhjWc9zornvpJLfmg62sYpLRJF9woSu
    $ cat bip38key.txt | ./psx bip38dec badpasswordtest
    address hash mismatch! the attempted password is incorrect
