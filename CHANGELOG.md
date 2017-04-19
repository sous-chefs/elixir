# elixir Cookbook CHANGELOG

This file is used to list changes made in each version of the elixir cookbook.

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
