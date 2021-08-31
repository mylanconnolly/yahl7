# Contributing to YAHL7

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following are guidelines for contributing to the YAHL7 gem.

## Code of Conduct

Please familiarize yourself with the
[code of conduct](https://github.com/mylanconnolly/yahl7/blob/main/CODE_OF_CONDUCT.md).
It is based on the [Contributor Covenant](https://www.contributor-covenant.org/)
and will be enforced.

## What Should I Know?

Some familiarity with Ruby and the HL7 standard will likely be necessary here.

## Reporting Bugs

When filing a bug report, please use the
[issue template](https://github.com/mylanconnolly/yahl7/blob/main/.github/ISSUE_TEMPLATE/bug_report.md).
This template contains items that are useful for us to resolve issues more
efficiently.

## Suggesting Enhancements

Is there some functionality missing that you'd like to see added? There is an
[issue template](https://github.com/mylanconnolly/yahl7/blob/main/.github/ISSUE_TEMPLATE/feature_request.md)
for that! In short, I'll be happy to consider any feature request, but there
should be some justification for it.

## Code Contribution

Contributing code is relatively easy. Create a pull request with the proposed
changes and I'll review it as soon as I'm able to. It's possible I'll request
some changes or ask for some justification, so if it's a large change, opening
an issue first to discuss specifics might save some effort all around.

Any new code should be tested where possible, in order to ensure the code is as
robust as possible.

All Ruby code should be run through [RuboCop](https://rubocop.org/) prior to
creating the pull request. This can be accomplished by running the command:

```bash
bundle exec rubocop -A
```
