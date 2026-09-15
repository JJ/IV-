# Project overview

This is a template for a repository that manages student assignments by running
specific checks on them, and generates analytics mainly related to dates of
submission and completion.

All code is triggered from GitHub actions, which watch different parts of the
repository for changes and run scripts that contain either checks or data
processing code.

## Folder structure

* `data/` contains data generated from the different actions
* `lib/` is a folder for library code, containing Raku as well as JavaScript
  code (since `lib` is a common name for both languages)
* `scripts/` contains scripts in Perl and Raku generally invoked from GitHub
  actions, although in some cases it contains scripts that will be invoked from
  specific targets in the `Makefile` that is in the main directory
* `src/` contains source for Perl scripts that need to be fatpacked (using MST's
  fatpack) to generate the namesake scripts (without the `.pl`) hosted in
  `scripts/`
* `t/` contains tests for Raku code
* `.github/workflows` is where most of the action is. Besides containing code as
  steps, it's the binding glue for everything happening here, including also
  triggers for stuff.

## Libraries and frameworks

It uses `fatpack` for packing Perl. The libraries used are contained in
`META6.json` (for Raku) and `cpanfile`  (for Perl).

## Coding standards

Use mainstream best practices for Perl, Raku and any Javascript code.

Errors and warnings should be issed in a very visible way, over all from
GithubActions.

Any error could refer, if needed, to the instructions for submission, which are
in https://jj.github.io/IV, over all in the [first project
milestone](https://jj.github.io/IV/documentos/proyecto/0.Repositorio). Students
are Spanish, or should speak Spanish, and have a good working knowledge of git,
although it's not bad if it's freshened up.
