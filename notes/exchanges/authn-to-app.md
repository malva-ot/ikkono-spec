Ahmed wants to access mapapp.

Ahmed  -> MAP: Gimme maps
MAP -> Ahmed : Gimme token
Ahmed  -> MAP: Who do you trust?
MAP -> Ahmed : Only MF-ikkono (MFI)

Ahmed -> MFI : Gimme token
MFI -> Ahmed : Who are you?
Ahmed -> MFI : Ahmed as self (XID + PubK)
MFI -> Ahmed : Prove it
Ahmed -> MFI : Ask Palm
MFI -> Palm  : Prove Ahmed
Palm -> Ahmed: Prove yourself 
Ahmed -> Palm: Here's my password
Palm -> MF   : Here's a payload signed with Ahmed's private K
MF -> Ahmed  : Ok, here's a token that says I believe you are you
Ahmed -> MAP : Here's my token