# Change Log

## [v4.6.0](https://github.com/auth0/ruby-auth0/tree/v4.6.0) (2018-12-17)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v4.5.0...v4.6.0)

**Closed issues**
- New Release with Client Token work [\#148](https://github.com/auth0/ruby-auth0/issues/148)
- Unable to initialize Auth0Api [\#147](https://github.com/auth0/ruby-auth0/issues/147)
- Issues building the documentation [\#135](https://github.com/auth0/ruby-auth0/issues/135)
- signin with referral token [\#127](https://github.com/auth0/ruby-auth0/issues/127)
- Some challenges when upgrading to Ruby 2.5.1 [\#122](https://github.com/auth0/ruby-auth0/issues/122)
- Cannot refresh access token with refresh token. [\#111](https://github.com/auth0/ruby-auth0/issues/111)
- Incorrect request_params for username-password login [\#109](https://github.com/auth0/ruby-auth0/issues/109)
- Obtain APIv2 Token [\#86](https://github.com/auth0/ruby-auth0/issues/86)

**Added**
- Add refresh token method and unit tests [\#150](https://github.com/auth0/ruby-auth0/pull/150) ([joshcanhelp](https://github.com/joshcanhelp))
- Improve telemetry; more modular Auth API [\#149](https://github.com/auth0/ruby-auth0/pull/149) ([joshcanhelp](https://github.com/joshcanhelp))
- Add ttl_sec argument to post_email_verification request. [\#145](https://github.com/auth0/ruby-auth0/pull/145) ([digitaldawn](https://github.com/digitaldawn))
- Add issue and PR templates, CoC [\#141](https://github.com/auth0/ruby-auth0/pull/141) ([joshcanhelp](https://github.com/joshcanhelp))
- Add new login_ro method to replace login [\#133](https://github.com/auth0/ruby-auth0/pull/133) ([joshcanhelp](https://github.com/joshcanhelp))
- Add VCR to and improve all integration tests [\#132](https://github.com/auth0/ruby-auth0/pull/132) ([joshcanhelp](https://github.com/joshcanhelp))
- Add new method to perform an auth code exchange [\#131](https://github.com/auth0/ruby-auth0/pull/131) ([joshcanhelp](https://github.com/joshcanhelp))
- Add new userinfo method for auth endpoints [\#130](https://github.com/auth0/ruby-auth0/pull/130) ([joshcanhelp](https://github.com/joshcanhelp))
- Add Client Credentials grant [\#129](https://github.com/auth0/ruby-auth0/pull/129) ([joshcanhelp](https://github.com/joshcanhelp))

**Changed**
- Improve the test suite [\#143](https://github.com/auth0/ruby-auth0/pull/143) ([joshcanhelp](https://github.com/joshcanhelp))

**Deprecated**
- Formal deprecation of 4 auth endpoint methods; rubocop [\#151](https://github.com/auth0/ruby-auth0/pull/151) ([joshcanhelp](https://github.com/joshcanhelp))

**Fixed**
- Documentation improvements [\#139](https://github.com/auth0/ruby-auth0/pull/139) ([szemek](https://github.com/szemek))
- Fix typos in README.md [\#137](https://github.com/auth0/ruby-auth0/pull/137) ([swetax](https://github.com/swetax))
- Explicitly require JSON dependency [\#126](https://github.com/auth0/ruby-auth0/pull/126) ([jgaskins](https://github.com/jgaskins))


## [v4.5.0](https://github.com/auth0/ruby-auth0/tree/v4.5.0) (2018-07-27)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v4.4.0...v4.5.0)

**Closed issues:**

- New version with updated rest-client dependency [\#93](https://github.com/auth0/ruby-auth0/issues/93)
- Bug?: `result` from auth0/mixins/httpproxy.rb returns 'nil' [\#88](https://github.com/auth0/ruby-auth0/issues/88)
- import\_users fails with EOFError [\#56](https://github.com/auth0/ruby-auth0/issues/56)
- Using inside of a Rails API [\#55](https://github.com/auth0/ruby-auth0/issues/55)
- Add documentation? [\#102](https://github.com/auth0/ruby-auth0/issues/102)
- logout\_url does not include client\_id parameter [\#81](https://github.com/auth0/ruby-auth0/issues/81)

**Merged pull requests:**

- Correctly default grant\_type to 'password' in login method [\#107](https://github.com/auth0/ruby-auth0/pull/107) ([psparrow](https://github.com/psparrow))
- Add additional parameters for WS-Fed URL [\#123](https://github.com/auth0/ruby-auth0/pull/123) ([joshcanhelp](https://github.com/joshcanhelp))
- Deprecate Authentication API endpoints [\#121](https://github.com/auth0/ruby-auth0/pull/121) ([joshcanhelp](https://github.com/joshcanhelp))
- Clean up auth endpoint tests [\#120](https://github.com/auth0/ruby-auth0/pull/120) ([joshcanhelp](https://github.com/joshcanhelp))
- Fix docblocks for Authentication API endpoints [\#119](https://github.com/auth0/ruby-auth0/pull/119) ([joshcanhelp](https://github.com/joshcanhelp))
- Add Client ID to logout\_url [\#118](https://github.com/auth0/ruby-auth0/pull/118) ([joshcanhelp](https://github.com/joshcanhelp))
- Add pagination and tests for Rules endpoint [\#117](https://github.com/auth0/ruby-auth0/pull/117) ([joshcanhelp](https://github.com/joshcanhelp))
- Add pagination and tests for Client Grants [\#116](https://github.com/auth0/ruby-auth0/pull/116) ([joshcanhelp](https://github.com/joshcanhelp))
- Add search\_engine parameter to Users endpoint + tests [\#115](https://github.com/auth0/ruby-auth0/pull/115) ([joshcanhelp](https://github.com/joshcanhelp))
- Improve README [\#114](https://github.com/auth0/ruby-auth0/pull/114) ([joshcanhelp](https://github.com/joshcanhelp))
- Add pagination and tests to Clients and Connections endpoints [\#113](https://github.com/auth0/ruby-auth0/pull/113) ([joshcanhelp](https://github.com/joshcanhelp))
- Use Secure RubyGems Source [\#112](https://github.com/auth0/ruby-auth0/pull/112) ([markprovan](https://github.com/markprovan))

## [v4.4.0](https://github.com/auth0/ruby-auth0/tree/v4.4.0) (2018-02-19)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v4.3.0...v4.4.0)

**Closed issues:**

- Authentication Login is using `/oauth/ro`.  [\#89](https://github.com/auth0/ruby-auth0/issues/89)

## [v4.3.0](https://github.com/auth0/ruby-auth0/tree/v4.3.0) (2018-02-19)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v4.2.0...v4.3.0)

**Merged pull requests:**

- Fix script publish gem [\#106](https://github.com/auth0/ruby-auth0/pull/106) ([alexisluque](https://github.com/alexisluque))
- Add support to /api/v2/users-by-email [\#105](https://github.com/auth0/ruby-auth0/pull/105) ([edgurgel](https://github.com/edgurgel))
- Update /login to use /oauth/token [\#94](https://github.com/auth0/ruby-auth0/pull/94) ([Zensaburou](https://github.com/Zensaburou))
- Fix error in the readme regarding timeouts [\#90](https://github.com/auth0/ruby-auth0/pull/90) ([ksamc](https://github.com/ksamc))

## [v4.2.0](https://github.com/auth0/ruby-auth0/tree/v4.2.0) (2018-02-15)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v4.1.0...v4.2.0)

**Closed issues:**

- Vulnerable dependency: yard [\#99](https://github.com/auth0/ruby-auth0/issues/99)
- post\_password\_change results in payload validation error [\#84](https://github.com/auth0/ruby-auth0/issues/84)
- Unsupported on latest ruby version \(2.4.0\) [\#83](https://github.com/auth0/ruby-auth0/issues/83)
- Adding a resource server breaks authentication. [\#76](https://github.com/auth0/ruby-auth0/issues/76)
- outdated dependencies in ror-api example [\#75](https://github.com/auth0/ruby-auth0/issues/75)

**Merged pull requests:**

- Add scripts and Dockerfile to publish SDK on rubygems [\#104](https://github.com/auth0/ruby-auth0/pull/104) ([alexisluque](https://github.com/alexisluque))
- Fix typo [\#103](https://github.com/auth0/ruby-auth0/pull/103) ([coisnepe](https://github.com/coisnepe))
- Fix tests [\#101](https://github.com/auth0/ruby-auth0/pull/101) ([alexisluque](https://github.com/alexisluque))
- Update outdated dependency [\#100](https://github.com/auth0/ruby-auth0/pull/100) ([alexisluque](https://github.com/alexisluque))
- Fix build [\#98](https://github.com/auth0/ruby-auth0/pull/98) ([alexisluque](https://github.com/alexisluque))
- Add delay to integration test [\#97](https://github.com/auth0/ruby-auth0/pull/97) ([alexisluque](https://github.com/alexisluque))
- Fix build [\#96](https://github.com/auth0/ruby-auth0/pull/96) ([alexisluque](https://github.com/alexisluque))
- Removed reference to API v1 [\#91](https://github.com/auth0/ruby-auth0/pull/91) ([aaguiarz](https://github.com/aaguiarz))
- Update rest-client version to v2 [\#87](https://github.com/auth0/ruby-auth0/pull/87) ([hzalaz](https://github.com/hzalaz))
- Introduce and raise exception for timeout [\#85](https://github.com/auth0/ruby-auth0/pull/85) ([anderslemke](https://github.com/anderslemke))
- corrected missing comma in example code of readme.md [\#79](https://github.com/auth0/ruby-auth0/pull/79) ([drewnichols](https://github.com/drewnichols))
- Resolve v1 API example error [\#78](https://github.com/auth0/ruby-auth0/pull/78) ([jesseproudman](https://github.com/jesseproudman))
- updated dependencies in ror api example. Fix \#75 [\#77](https://github.com/auth0/ruby-auth0/pull/77) ([Amialc](https://github.com/Amialc))
- Add a badge to documentation [\#74](https://github.com/auth0/ruby-auth0/pull/74) ([amingilani](https://github.com/amingilani))
- Typo [\#73](https://github.com/auth0/ruby-auth0/pull/73) ([amingilani](https://github.com/amingilani))
- Add how to generate documentation to the README.md + patch\_user [\#72](https://github.com/auth0/ruby-auth0/pull/72) ([ignaciojonas](https://github.com/ignaciojonas))

## [v4.1.0](https://github.com/auth0/ruby-auth0/tree/v4.1.0) (2016-07-25)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v4.0.0...v4.1.0)

**Closed issues:**

- \#post\_password\_change requires a password for ticket. [\#69](https://github.com/auth0/ruby-auth0/issues/69)
- Exception messages are ruby hash string literals [\#63](https://github.com/auth0/ruby-auth0/issues/63)
- Ruby on Rails API issue [\#61](https://github.com/auth0/ruby-auth0/issues/61)
- Not possible to have V1 and V2 clients at the same time [\#60](https://github.com/auth0/ruby-auth0/issues/60)
- Be able to control timeout [\#57](https://github.com/auth0/ruby-auth0/issues/57)
- Version 4 changes [\#54](https://github.com/auth0/ruby-auth0/issues/54)
- Implement API v2 [\#38](https://github.com/auth0/ruby-auth0/issues/38)

**Merged pull requests:**

- Release 4.1.0 [\#71](https://github.com/auth0/ruby-auth0/pull/71) ([ignaciojonas](https://github.com/ignaciojonas))
- Use JSON \(result.body\) for exception messages in requests [\#67](https://github.com/auth0/ruby-auth0/pull/67) ([ianks](https://github.com/ianks))
- fixed rails api doesn't start, now impersionated links works with v2 [\#62](https://github.com/auth0/ruby-auth0/pull/62) ([Amialc](https://github.com/Amialc))
- Add api v2 log endpoints to the gem [\#59](https://github.com/auth0/ruby-auth0/pull/59) ([LindseyB](https://github.com/LindseyB))

## [v4.0.0](https://github.com/auth0/ruby-auth0/tree/v4.0.0) (2016-02-12)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v3.6.1...v4.0.0)

**Closed issues:**

- Update LICENSE [\#47](https://github.com/auth0/ruby-auth0/issues/47)
- Integration tests [\#15](https://github.com/auth0/ruby-auth0/issues/15)

**Merged pull requests:**

- V2 - Rebased to Master [\#53](https://github.com/auth0/ruby-auth0/pull/53) ([ignaciojonas](https://github.com/ignaciojonas))
- V2 - Auth Endpoints + Gem deployment [\#50](https://github.com/auth0/ruby-auth0/pull/50) ([ignaciojonas](https://github.com/ignaciojonas))
- Documentation Style [\#49](https://github.com/auth0/ruby-auth0/pull/49) ([ignaciojonas](https://github.com/ignaciojonas))
- Update License [\#48](https://github.com/auth0/ruby-auth0/pull/48) ([aguerere](https://github.com/aguerere))
- API v2 Implementation [\#46](https://github.com/auth0/ruby-auth0/pull/46) ([ignaciojonas](https://github.com/ignaciojonas))
- Refresh token delegation [\#43](https://github.com/auth0/ruby-auth0/pull/43) ([LindseyB](https://github.com/LindseyB))
- Fix tests to make build green [\#41](https://github.com/auth0/ruby-auth0/pull/41) ([leosoubeste](https://github.com/leosoubeste))
- Rubocop Integration [\#39](https://github.com/auth0/ruby-auth0/pull/39) ([ignaciojonas](https://github.com/ignaciojonas))
- Remove semi-colons in README [\#37](https://github.com/auth0/ruby-auth0/pull/37) ([l4u](https://github.com/l4u))

## [v3.6.1](https://github.com/auth0/ruby-auth0/tree/v3.6.1) (2015-07-09)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v3.6.0...v3.6.1)

**Merged pull requests:**

- set the search engine if a query is set [\#36](https://github.com/auth0/ruby-auth0/pull/36) ([taylorfinnell](https://github.com/taylorfinnell))
- email validation is broken by \_, which breaks the tests [\#35](https://github.com/auth0/ruby-auth0/pull/35) ([taylorfinnell](https://github.com/taylorfinnell))

## [v3.6.0](https://github.com/auth0/ruby-auth0/tree/v3.6.0) (2015-06-01)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v3.5.0...v3.6.0)

**Merged pull requests:**

- Remove exclude\_fields parameter for getting users [\#34](https://github.com/auth0/ruby-auth0/pull/34) ([hzalaz](https://github.com/hzalaz))
- Add connections [\#33](https://github.com/auth0/ruby-auth0/pull/33) ([taylorfinnell](https://github.com/taylorfinnell))
- Use client header spec as per documentation [\#32](https://github.com/auth0/ruby-auth0/pull/32) ([benschwarz](https://github.com/benschwarz))

## [v3.5.0](https://github.com/auth0/ruby-auth0/tree/v3.5.0) (2015-05-21)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v3.4.0...v3.5.0)

**Merged pull requests:**

- Client information headers [\#31](https://github.com/auth0/ruby-auth0/pull/31) ([benschwarz](https://github.com/benschwarz))

## [v3.4.0](https://github.com/auth0/ruby-auth0/tree/v3.4.0) (2015-05-07)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v3.3.0...v3.4.0)

**Closed issues:**

- Changelog [\#29](https://github.com/auth0/ruby-auth0/issues/29)
- Tag releases [\#16](https://github.com/auth0/ruby-auth0/issues/16)

**Merged pull requests:**

- allow setting impersonation ttl [\#30](https://github.com/auth0/ruby-auth0/pull/30) ([seamusabshere](https://github.com/seamusabshere))
- Fix broken link in README [\#28](https://github.com/auth0/ruby-auth0/pull/28) ([dentarg](https://github.com/dentarg))

## [v3.3.0](https://github.com/auth0/ruby-auth0/tree/v3.3.0) (2015-04-15)
[Full Changelog](https://github.com/auth0/ruby-auth0/compare/v3.2.0...v3.3.0)

**Closed issues:**

- AuthenticationEndpoints should be independent of the V1/V2 API [\#20](https://github.com/auth0/ruby-auth0/issues/20)
- Typo in AuthenticationEndpoints.login [\#17](https://github.com/auth0/ruby-auth0/issues/17)
- Remove generated docs [\#14](https://github.com/auth0/ruby-auth0/issues/14)
- Remove the examples directory from this repository [\#4](https://github.com/auth0/ruby-auth0/issues/4)

**Merged pull requests:**

- Chore integration tests [\#27](https://github.com/auth0/ruby-auth0/pull/27) ([hzalaz](https://github.com/hzalaz))
- allow to pass extra parameters to delegation method [\#23](https://github.com/auth0/ruby-auth0/pull/23) ([Maxim-Filimonov](https://github.com/Maxim-Filimonov))

## [v3.2.0](https://github.com/auth0/ruby-auth0/tree/v3.2.0) (2015-04-14)
**Merged pull requests:**

- Impersonation [\#26](https://github.com/auth0/ruby-auth0/pull/26) ([dentarg](https://github.com/dentarg))
- Allow to set api\_type to use with salesforce\_api [\#25](https://github.com/auth0/ruby-auth0/pull/25) ([Maxim-Filimonov](https://github.com/Maxim-Filimonov))
- Fixed few issues from issues list [\#22](https://github.com/auth0/ruby-auth0/pull/22) ([offtop](https://github.com/offtop))
- Update readme.md api v2 basic usage example [\#19](https://github.com/auth0/ruby-auth0/pull/19) ([ethancrawford](https://github.com/ethancrawford))
- fix token initialization to prevent nil token value [\#18](https://github.com/auth0/ruby-auth0/pull/18) ([ethancrawford](https://github.com/ethancrawford))
- Make the client work for API v1 [\#13](https://github.com/auth0/ruby-auth0/pull/13) ([dentarg](https://github.com/dentarg))
- Fix typo delegation signature; open\_id =\> openid [\#12](https://github.com/auth0/ruby-auth0/pull/12) ([dentarg](https://github.com/dentarg))
- Make the tests run on Travis CI [\#11](https://github.com/auth0/ruby-auth0/pull/11) ([dentarg](https://github.com/dentarg))
- Added support for API V1 and API V2 [\#9](https://github.com/auth0/ruby-auth0/pull/9) ([offtop](https://github.com/offtop))
- Update README.md [\#8](https://github.com/auth0/ruby-auth0/pull/8) ([pose](https://github.com/pose))
- Make delete user safe [\#5](https://github.com/auth0/ruby-auth0/pull/5) ([dentarg](https://github.com/dentarg))
- Remove the omniauth strategy [\#3](https://github.com/auth0/ruby-auth0/pull/3) ([dentarg](https://github.com/dentarg))
- Fix rspec deprecation warning [\#2](https://github.com/auth0/ruby-auth0/pull/2) ([dentarg](https://github.com/dentarg))
- Add method to access delegation endpoint [\#1](https://github.com/auth0/ruby-auth0/pull/1) ([FrancisPlaza](https://github.com/FrancisPlaza))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
