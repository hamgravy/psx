# psx
A python implementation and extension of the sx bitcoin tool.

This tool is intended to provide a maximally portable bitcoin swiss army knife, mostly compatible with spesmilo's sx tool. This is alpha-level software and does not yet accomplish the intended goals. Use this software at your own risk.

PREPARE: You'll prpbably need these packages from your distro's package repo

    apt-get install python-pip libssl-dev python-ecdsa

INSTALL:

    python setup.py install

UNINSTALL:

    python setup.py install --record files.txt
    cat files.txt | xargs rm -rf

tests/demos:
=====================

generate wif encode private key for compressed format:

    psx newkey
    L4WMDSB4UrpfXpvuLJJ67HoZ7AENgnbxhav8TRLEG1XyeTwpJ7WJ

generate compressed format pubkey (hex) from private key (wif):

    psx newkey | tee priv.key
    L4WMDSB4UrpfXpvuLJJ67HoZ7AENgnbxhav8TRLEG1XyeTwpJ7WJ
    
    cat priv.key | psx pubkey
    032f4181f54eb3ea6fa3291c44c063faa9bd6aea85d739b4453a5722b8dabaa8de

generate compressed format bitcoin address from wif private key

    cat priv.key | psx addr
    147MVjbvN1vgqhYbWG2exUe5e6SzGec9PH

generate private key and its address simultaneously 

    psx newkey | tee priv.key  | psx addr | tee addr.key
    1J64dNkaH9JFDu7y56yUFyoFPmzdtLSXHb

generate private key using the "brain wallet" technique

    echo "brainwallet test" | psx brainwallet
    L2EqmMYGNuLnEaaYmpphp2UQtT35hyJ73VZA4F3vXngwDXVwgZb6

encode/decode bip39:

    echo "77c2b00716cec7213839159e404db50d" | psx mnemonic encode TREZOR | tee phrase.txt
    jelly better achieve collect unaware mountain thought cargo oxygen act hood bridge

    cat phrase.txt | psx mnemonic decode TREZOR
    b5b6d0127db1a9d2226af0c3346031d77af31e918dba64287a1b44b8ebf63cdd52676f672a290aae502472cf2d602c051f3e6f18055e84e4c43897fc4e51a6ff

encode/decode bip38:

    echo "correct horse battery staple" | psx brainwallet | psx bip38enc test | tee bip38key.txt
    6PYLr7QZXmCobukmCxTpSrEzwUTQ5RM2nvgkF8zx72rKYHSmQ3ccYGed4L

    cat bip38key.txt | psx bip38dec test
    L3p8oAcQTtuokSCRHQ7i4MhjWc9zornvpJLfmg62sYpLRJF9woSu

    cat bip38key.txt | psx bip38dec badpasswordtest
    address hash mismatch! the attempted password is incorrect

generate bip32 root private key

    echo "000102030405060708090a0b0c0d0e0f" | psx bip32root
    xprv9s21ZrQH143K3QTDL4LXw2F7HEK3wJUD2nW2nRk4stbPy6cq3jPPqjiChkVvvNKmPGJxWUtg6LnF5kejMRNNU3TGtRBeJgk33yuGBxrMPHi

generate bip32 root private key from bip39 mnemonic

    echo "77c2b00716cec7213839159e404db50d" | psx mnemonic encode TREZOR | tee phrase.txt
    jelly better achieve collect unaware mountain thought cargo oxygen act hood bridge
    
    cat phrase.txt | psx mnemonic decode TREZOR | tee seed.txt | psx bip32root | tee root.txt
    xprv9s21ZrQH143K3xC5SRKnxV4R829AcnKE7XjZu2PixyZh3CexnsvmkBsi5rzqXMhxTkfLJFB6FuHJPWxxvcH5eYvCDvWcYAMXpbpGGiVUDfH

generate bip32 private key of account/chain 0 from master private key

    cat root.txt | psx bip32 m/0
    xprv9ukRPjUyjjU7SeLWz9LjNaCPafd9RuCex2uwGYpqke3eMGpETrzHeqcGsKE7iT6Nxy7UydYwbAJhy1FZeRme4i61pMhoywoyhMU5M8KoKdh

generate bip32 hardended private key of account/chain 0 from master private key

    cat root.txt | psx bip32 m/0h
    xprv9ukRPjV85Q15e4GvGu5NUN35HS75LLYedzcq4U6YpHbPVTMYbuBpRFRwePN2cYW6RPAeLkpnp4Lxb2K32fhReMtYyRjw5315WG8q6jYtxBz
    cat root.txt | psx bip32 m/0H
    xprv9ukRPjV85Q15e4GvGu5NUN35HS75LLYedzcq4U6YpHbPVTMYbuBpRFRwePN2cYW6RPAeLkpnp4Lxb2K32fhReMtYyRjw5315WG8q6jYtxBz
    cat root.txt | psx bip32 "m/0'"
    xprv9ukRPjV85Q15e4GvGu5NUN35HS75LLYedzcq4U6YpHbPVTMYbuBpRFRwePN2cYW6RPAeLkpnp4Lxb2K32fhReMtYyRjw5315WG8q6jYtxBz

generate bip32 private key of hardended key of account 0 child key path 1, hardended key 2, key 2, key 1000000000 (!)

    cat root.txt | psx bip32 m/0H/1/2H/2/1000000000
    xprvA2T2K9q3dPP8CfMZxTjeGnYWVz36M69XD1jfRprLhGFtpTf8kRmxWFbwVmrTzb4k53T2StLD4kacHW7iqyCLzCknTjKgCTEQwWP8aY7rQEk
