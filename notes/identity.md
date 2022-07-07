# identity

The `ikkono` protocol establishes common methods for asserting and validation claims about an **identity**. An **identity** is the root identifier for an actor. 

**servers** implement the mechanics to 

Rules

I. An **identity** is established and controlled by its owner

II. Proof of ownership is established through asymmetric key cryptography

III. Obligations between servers and identity owners
<br>&emsp;a. No **server** is ever required to host or respond to or on behalf of any given identity. 
<br>&emsp;b. At the same time, no server may require that an actor link its identity to a particular server or organization by implementing cryptographic or other mechanisms that prevent the actor from independently proving ownership of their identity.
<br>&emsp;c. Servers *are* allowed to require that they generate the XID and/or keys for identities or other objects that they host, and/or to to attach portable metadata to those objects that claim or prove that the given server generated, hosted, or otherwise serviced the identity or other object.

IV. As **servers** are free to choose who they trust or with whom they interact, one server is free to require that actors prove their ownership via calls to another server. 

Example:

- Ahmed establishes an identity by generating a XID and public/private key pair
- Ahmed uploads his XID and public key to the public `ikkono` host Palm Identities
- Ahmed requests a **passport** from his new employer
- Palm Identities is prohibited from injecting or modifying Ahmed's identity, its attributes, or its keys in any way that prevents Ahmed from proving ownership of his XID and key pairs independently from Palm
- Ahmed's new employer *is* free to require that Ahmed upload his *private* key to Palm as well, so that Palm can provide cryptographic proof of the identity on behalf of Ahmed. 
- External legal authorities, private contracts, or any other forces may affect whether Ahmed's potential employer chooses to establish such requirements, or may prohibit the employer from doing so. Regardless, both Palm and the employer can have conforming `ikkono` servers as long as the format of of the communications follow the protocol
