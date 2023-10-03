# elixir Cookbook CHANGELOG

This file is used to list changes made in each version of the elixir cookbook.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 3.0.11 - *2023-10-03*

## 3.0.10 - *2023-09-29*

## 3.0.9 - *2023-07-10*

## 3.0.8 - *2023-06-07*

Standardise files with files in sous-chefs/repo-management

## 3.0.7 - *2023-05-17*

## 3.0.6 - *2023-05-03*

## 3.0.5 - *2023-04-01*

## 3.0.4 - *2023-03-08*

## 3.0.3 - *2023-03-02*

## 3.0.2 - *2023-02-14*

## 3.0.1 - *2023-02-14*

- Remove delivery folder

## 3.0.0 - *2022-01-24*

- Bump to require Chef Infra Client >= 15.3
- resolved cookstyle error: metadata.rb:22:1 refactor: `Chef/Modernize/UnnecessaryDependsChef15`

## 2.0.3 - *2021-08-30*

- Standardise files with files in sous-chefs/repo-management

## 2.0.2 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 2.0.1 - *2020-12-31*

- resolved cookstyle error: metadata.rb:23:1 convention: `Layout/TrailingEmptyLines`

## 2.0.0 (2020-10-15)

### Changed

- Sous Chefs Adoption
- Update Changelog to Sous Chefs
- Update to use Sous Chefs GH workflow
- Update to Elixir 1.11.0
- Update README to sous-chefs
- Update metadata.rb to Sous Chefs
- Update test-kitchen to Sous Chefs
- Require newer erlang cookbook and Chef >= 14

### Fixed

- Yamllint fixes
- Fix idempotency issues

### Added

- Include mdlrc file
- Add CentOS 8 support
- Add Ubuntu 18.04 and 20.04 support
- Add basic InSpec tests

### Removed

- Remove Amazon Linux 1 testing
- Remove un-necessary directory creation
- Remove CentOS 6 testing
- Remove OpenSUSE testing

## 1.1.0 (2019-10-07)

- Require the latest libarchive cookbook on Chef 12.6+ - [@tas50](https://github.com/tas50)

## 1.0.1 (2017-04-19)

- Remove usage of the validate cookbook that is not chef 13 compatible

## 1.0.0 (2017-03-15)

- This cookbook has been transferred to Chef to be maintained by the Cookbook Engineering team
- Require Chef 12.1 or later
- Depend on fairly recent releases of git, erlang, and libarchive
- Resolve all cookstyle and foodcritic warnings
- Remove the apt::default from the elixir default recipe and instead leave apt updating to the users
- Install the current stable release of elixir instead of an old release that's not published anymore
- Update ignore files
- Add github templates
- Add local delivery testing config
- Add maintainers files
- Add contributing and testing documentation
- Add full Apache 2.0 license file
- Remove deps that are in ChefDK from the Gemfile
- Update platforms in the Test Kitchen config
- Add a changelog
- Update the maintainer to be Chef
- Add source_url, issues_url and chef_version metadata
- Remove attributes from the metadata file
- Don’t use node.set for attributes as this is deprecated in Chef 13
- Add supported operating systems to the metadata
- Add Travis CI config and kitchen-dokken for integration testing in Travis
- Remove HTML from the readme so that it renders on Supermarket
- Update readme attribute document to match actual attributes
- Add requirements section and license to the readme
- Update copyright headers
