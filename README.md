# puppet-testing
Simple Repository to learn puppet testing

# Assumptions
I am assuming you have not really done puppet testing before and that you are
not intimately familiar with ruby or ruby testing either. I have tried to
explain all the things that were unclear to me, and am hoping that this will
get you on your way relatively easily. If you find anything unclear or blatantly
wrong then please log a bug or submit a PR and I will get it fixed.

# Methodology
In an ideal world you would and should write a test for every possible value
and resource to grace your puppet catalogue. In reality you won't have time, so
a good compromise is to at the very least, write tests for things you think
could go wrong. There after when ever you find a bug in your code, write a test for it, and next time you won't experience that bug again.

# Stuff I will need
```
gem install bundler
```

# The class we are testing
The class is called **testing** and does the following:
* Creates a directory ```/tmp/testing```
* Creates two files in that directory called ```file.one``` and ```file.two```

# Plumbing required
## spec_helper.rb file
This file for the moment is very simple and contains the line:
```require 'puppetlabs_spec_helper/module_spec_helper'```
This file sets up everything that is needed to perform the testing. In the tests
we will write there will be a line ```require 'spec_helper'```. So a test can
require the generic ```spec_helper``` file which allows us to centralise the
way we setup testing requirements. Read more about **puppetlabs_spec_helper**
[here](https://github.com/puppetlabs/puppetlabs_spec_helper).

## .fixtures.yml file
This is where you setup all puppet related dependencies. If you need a
specific module like stdlib it would be installed here.


## Rakefile

# Directory structure
Different types of puppet resources will be in different directories. Classes
will be in the **classes** directory, defined types in **defines** and functions
in **functions**.


# Writing the first test


# Doing the testing
Once all the plumbing is in place you can perform testing by running the following command:
```
bundle install && rake spec
```

## What is bundle install?
[bundle](http://bundler.io) is a tool that installs gem dependencies, amongst
other things. We require a number of gems to do our testing one of them being
**puppet** and also **puppet-lint**. ```bundle install``` will take care of the
dependencies. If you consider that you might require different versions of the
same gem for another puppet project then **bundle** becomes very valuable indeed.
Bundle's list of instructions is found in the file called Gemfile. You can read
even more about ```bundle install``` [here](http://bundler.io/v1.13/man/bundle-install.1.html).

## What is rake spec?
So firstly rake is a **build** tool for ruby. If you are old enough you might be
familiar with a tool called **make** which is similar in function. **spec** is a
**rake task** that is made available by the line ```require 'puppetlabs_spec_helper/rake_tasks'``` in ```Rakefile```. If you have a look at
[rake_tasks.rb](https://github.com/puppetlabs/puppetlabs_spec_helper/blob/master/lib/puppetlabs_spec_helper/rake_tasks.rb#L342-L347), you will see a task called
**spec** being made available. So when you run ```rake spec``` this task is
being run.

## More verbose testing
So the test works but all you see is that 1 or more examples worked and that
there were 0 failures. You gave the tests pretty names and feel that this
beauty should not be hidden. You can achieve this beauty by adding a ```.rspec```
file containing:
```
--format documentation
--color
```
When you run ```rake spec``` again you will now notice all your pretty test
names rather than just a summary of what happened.


# Who is Travis?
Travis is friendly German who kindly tests your code on your behalf. More to
the point, travis-ci is a web based continuous integration platform headquarted
in Berlin, Germany. They provide free but rate limited testing for any open source project, with strong integration with github. So basically if you have
managed to get your rspec tests working you can very easily add travis-ci
functionality. This will enable you to run your set of tests automatically every
time you push code to your github repository. You can make it even more shiny
by adding a link in your repo's readme that points to the build status. That
way you can know if the latest push worked successfully and when you get PRs
against your repo you can quickly see if the code checks without having to do
anything.

Travis Build Status: [![Build Status](https://travis-ci.org/ggeldenhuis/puppet-testing.svg?branch=master)](https://travis-ci.org/ggeldenhuis/puppet-testing)

# Old and new
You might see different ways to perform the same test when looking at other
examples. For example:
```
it { is_expected.to contain_file('/tmp/testing/file.one')}
it { should contain_file('/tmp/testing/file.one')}
```
In the above case **is_expected** is the better/newer way of performing the test.
How are you supposed to know this, well a good place to start would be by
reading [BetterSpecs](http://betterspecs.org)


# Credits
A special thanks to Craig Dunn who has kindly helped to untangle the world of
puppet testing and patiently kept answering questions.


# TODO
* Modify testing class to take parameters
* Write class test with parameters
* Write test to test array variable
* Write relationship tests
