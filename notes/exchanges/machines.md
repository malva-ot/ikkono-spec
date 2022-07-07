

A is App node
M is MfAuth node

CA is MFCA



M -> MFCA : Gimme latest MFAuth-Black key. My node XID is ________
CA -> M   : Sign this nonce with MFAuth-Black-Init-2021Q1
M ->  CA  : <signed with MFAuth-Black-Init-2021Q1>
CA ->     : Here's a token you can use to request the latest key


