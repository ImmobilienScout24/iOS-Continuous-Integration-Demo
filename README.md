#iOS-Continuous-Integration-Demo
===

A demo app for for continuous integration with iOS.

The following tools/frameworks are used in this example:

1. GHUnit: https://github.com/gabriel/gh-unit
2. OCMock: https://github.com/erikdoe/ocmock
3. KIF: https://github.com/square/KIF
4. Xcode-Maven-Plugin: https://github.com/x2on/xcode-maven-plugin

##Example

### Build app
```mvn compile```

### Run tests
```mvn test -P test```

### Run integration tests
```mvn test -P integration-test```

