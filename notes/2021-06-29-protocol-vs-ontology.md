
Aside: Do we need two terms to distinguish the ontology of the data-at-rest vs the data-in-motion? The data-at-rest is generally what we have meant by "ontology". This meaning of "ontology" intentionally emphasizes that it is a formal description of the ideas, truly independent of how the actual records might be stored or transferred.

But as I describe protocols -- the series of actual encodings and back-and-forth exchanges that allow separate systems to *interact* -- I find that protocols themselves have an ontology. The ontology of the protocol describes the physical parts of a message or exchange, independent of the content of the message. I suspect the mechanical construction of the message may relate to the at-rest ontology of the content being transferred, so that the protocol ontology might not be completely independent of the ___ ontology...though would that lack of independence be an architectural flaw? Would it not be preferable to have the protocol be truly independent, so that the same protocol could be used to transfer many types of content?...

This question is not yet resolved for me.

Here is my response to my own question above: 

Fleshing out the ikkono protocol revealed that, in order to get *provability*, there were indeed additions needed to the ontology. But the *actual proof* is implemented by the protocol because:

  - To have proof, we need a signature
  - To have a signature, we need a hashable message format

diffnote already completely describes the *hashable message format*, provided diffnote includes a full description of the meta-protocol for defining new verbs and statement types. 

What we were missing from the ontology were the elements -- basically **warrants** and **grants** -- that connect the current *state* of access rules to the *actions* of authorized actors which caused those rules to exist.

This was necessary for the protocol, because the protocol consists exclusively of those actions, not of a database containing the full, currently resolved state. But those actions can be described by an ontology, independent of how they may be serialized and validated in protocol messages.