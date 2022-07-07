Major hole in OAuth 2.0:

> The interaction between the authorization server and resource server
   is beyond the scope of this specification.  The authorization server
   may be the same server as the resource server or a separate entity.
   A single authorization server may issue access tokens accepted by
   multiple resource servers.

ikkono makes this irrelevant, or exact: A resource server declares exactly
which authorization server it trusts, and requires a token proving that the
authorization server verified the request.


> 2.2.  Client Identifier

   The authorization server issues the registered client a client
   identifier -- a unique string representing the registration
   information provided by the client.  The client identifier is not a
   secret; it is exposed to the resource owner and MUST NOT be used
   alone for client authentication.  The client identifier is unique to
   the authorization server.

   The client identifier string size is left undefined by this
   specification. The client should avoid making assumptions about the
   identifier size. The authorization server SHOULD document the size
   of any identifier it issues.