## ref

|Ref|Title|Description|
|-|-|-|
|[RFC7515](https://www.rfc-editor.org/rfc/rfc7515.html)|JWS (JSON Web Signature)|Signed but not encrypted payloads|
|[RFC7516](https://www.rfc-editor.org/rfc/rfc7516.html)|JWE (JSON Web Encryption)|Signed encrypted content|
|[RFC7517](https://www.rfc-editor.org/rfc/rfc7517.html)|JWK (JSON Web Key)|Transferable representation of cryptographic keys|
|[RFC7518](https://www.rfc-editor.org/rfc/rfc7518.html)|JWA (JSON Web Algorithms)|Classification and ontology of encryption algorithms and their input parameters|
|[RFC7519](https://www.rfc-editor.org/rfc/rfc7519.html)|JWT (JSON Web Tokens)|A specific use case of either JWS or JWE where the payload contains structured claims|
|[WebCryptoAPI](https://www.w3.org/TR/WebCryptoAPI/)|Web Cryptography API|Full API description of cryptographic suite|
### RFC7515

JWS has direct utility for ikkono as the established mechanism for encoding and transmitting authenticated identity and authorization claims over the internet.

- `jku` header is a URI to a resource that returns a JSON Web Key set (JWK set), which
   contains the key which was used to sign the JWS object. For an ikkono auth
   server, the server itself should expose a corresponding resource, which could be dynamic,
   from which validators can retrieve applicable keys. Validators should already have a white 
   list of acceptable domains or route patterns to avoid malicious actors provoking 
   validators to request resources from a malicious source
- `kid` header is the identifier for the specific key which was used to sign the JWS object.
   The structure is undefined, so this is a good place to use either a Xid or Qrn. If
   both `jku` and `kid` are present, then `kid` should match the `kid` property of exactly
   on of the keys in the set of keys returned from the resource referred to by `jku`
- `typ` is media-type which represents the conceptual type of the JWS object itself
- `cty` is a media-type which represents the canonical Content-Type of the *payload*, and thus 
   could be anything.
    - Both `typ` and `cty` are optional if the consuming application will always only process one type.
      i.e. this is NOT like HTTP where Content-Type is effectively required.
    - For both `typ` and `cty`, a `application/` prefix in the media-type value should be omitted
      unless the full media-type itself (such as in a parameter) contains a `/` character.
- `crit` to specify other header names that must be understood, such as `exp` in order to correctly validate the JWS

### RFC7516

JWE has no immediate use case in ikkono. ikkono addresses mechanisms for communicating claims that can be publicly validated and explicitly avoids any processes that would require encryption or even TLS.

### RFC7517

JWK and supporting work is directly relevant to ikkono as it provides a clear and refined body of work dedicated to describing and transmitting encryption keys. ikkono does not address how secrets may be transferred, but makes extensive use of *public* keys for asymmetric algorithms, and these keys must be communicable between participants in ikkono networks and transactions.

Perhaps even more important that the specific encodings described in RFC7517, this work implicitly includes a precise *ontology* for describing keys.