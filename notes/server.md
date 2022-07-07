# server

`ikkono` is implemented by a distributed network of conforming servers. `ikkono` is a public protocol, but implementing servers are not required to be public. 

`ikkono` describes the content and pattern of calls and responses so that all conforming servers can understand each other. The `ikkono` spec makes no demands that conforming servers must actually trust or even respond to other servers. It does specify the format of the calls and responses should servers mutually choose to interact.

## Rules

I. `ikkono` servers identify and authenticate to each other using certificates.

II. Any `ikkono` server is free to choose to trust or not trust another `ikkono` server.

&emsp;a. `ikkono` servers are free to establish their own policies for how they choose to trust other servers' certificates. For example, any of the following could be options:

 - Trust specific self-signed certs on a case-by-case basis
 - Trust any branch on a cert tree from certain trusted root CAs
 - Trust only first level branch certs from certain trusted root CAs
 - Require keys of length, using singing algorithm Y

&emsp;b. `ikkono` servers are free to grant or restrict access to any or all of their endpoints, and may use mechanisms or criteria not described in the `ikkono` specification, unless explicitly constrained in the `ikkono` spec.

  - Example: Org X only allows mutual handshake initialization calls for specific, manually entered IP addresses within 30 seconds of manually initiated start times. As long as the content of the handshake requests and responses conform to the protocol, this is a valid `ikkono` implementation
  - Example: Org W allows unlimited mutual handshake initialization calls from any client on the internet. As long as the content of the handshake requests and responses conform to the protocol, this is also a valid `ikkono` implementation

&emsp;c. `ikkono` servers are free to revoke trust to other servers at any time for any reason.