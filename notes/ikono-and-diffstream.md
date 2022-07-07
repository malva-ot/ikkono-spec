
`ikkono` relates to `diffstream` as follows:

- ikkono uses the same serialization format and abstract object model as diffstream
- diffstream provides a container for a cryptographically proven series of content

A stream in diffstream is equivalent to a repository in `git`, and shares some characteristics. diffstream includes many features to express *changes* over time to normative documents, hence the "diff" in "diffstream". 

diffstream proves the completeness and ordering of a set of content, including all changes to that content. It is a very easy to read and efficient to verify serialization format for a general Merkle tree. Diffstream includes methods for proving *attribution* through cryptographic signatures, but doesn't require this. 

ikkono proves the attribution of a series of statements, whose express purpose to encode agreements, including the establishment of abstract access control agreements.

An ikkono document is mechanically equivalent to an x.509 certificate in that it is also a Merkle tree, but a very wide tree where most users only care about one small path at a time.

ikkono documents can be embedded in a diffstream stream. Doing so would provide users a means of proving that all documents in the stream exist, even when there is no 
