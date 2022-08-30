Feature: Demo command line with junit5

  Scenario: Demo cmd
    Given print 'I am inside sample feature'

  @second
  Scenario: second test
    Given print 'I am inside second test'
