# Diagnosticism.Ruby - Changes <!-- omit in toc -->


## 0.1.4 - 20th August 2026

* library source **Home:** URLs now use `https`;
* renamed **Diagnosticism.Ruby.gemspec** to **diagnosticism.gemspec** so the filename stem matches `spec.name`;
* **diagnosticism.gemspec**: `required_ruby_version` is the range `>= 2.0`; **Gemfile.lock** and **.ruby-version** excluded from `spec.files`; `spec.summary` matches the README tagline; packaged **AUTHORS**, **CHANGES**, **CONTRIBUTING**, **EXAMPLES**, **FAQ**, **INSTALL**, **NEWS**, **SECURITY**, **TODO**;
* **Gemfile** sets `lockfile false` when Bundler supports it; stop tracking **Gemfile.lock**;
* CI uses `bundler-cache: false` and explicit `bundle install`; **Warnings** job on Ruby **3.4**; `gem build diagnosticism.gemspec`;
* updated **run_all_unit_tests.sh** (from https://github.com/synesissoftware/misc-dev-scripts) to skip **tput** when **$TERM** is unset or stdout is not a TTY;
* **README.md**: tagline before badges; TOC before Introduction; Dependencies (Efferent / Afferent); related projects;
* added **examples/doomgram** and catalogued it in **EXAMPLES.md**;


## 0.1.3 - 15th August 2026

* added `# frozen_string_literal: true` to all **lib/** sources;


## 0.1.2 - 29th August 2025

* GitHub Actions;
* **Rakefile**;
* boilerplate;
* updated **run_all_unit_tests.sh** (from https://github.com/synesissoftware/misc-dev-scripts);


## 0.1.1 - 6th March 2025

* warnings;


## 0.1.0 - 9th January 2025

* added `DOOMGram` class;


## 0.0.0 - 2nd January 2025

* initial commit;


<!-- ########################### end of file ########################### -->
