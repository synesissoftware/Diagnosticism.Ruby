# Diagnosticism.Ruby <!-- omit in toc -->

Basic diagnostic facilities, for Ruby

![Language](https://img.shields.io/badge/Ruby-CC342D?style=flat&logo=ruby&logoColor=white)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Gem Version](https://badge.fury.io/rb/diagnosticism.svg)](https://badge.fury.io/rb/diagnosticism)
[![Last Commit](https://img.shields.io/github/last-commit/synesissoftware/Diagnosticism.Ruby)](https://github.com/synesissoftware/Diagnosticism.Ruby/commits/master)
[![Ruby](https://github.com/synesissoftware/Diagnosticism.Ruby/actions/workflows/ruby.yml/badge.svg)](https://github.com/synesissoftware/Diagnosticism.Ruby/actions/workflows/ruby.yml)


## Table of Contents <!-- omit in toc -->

- [Introduction](#introduction)
- [Installation](#installation)
- [Components](#components)
- [Examples](#examples)
- [Project Information](#project-information)
  - [Where to get help](#where-to-get-help)
  - [Contribution guidelines](#contribution-guidelines)
  - [Dependencies](#dependencies)
    - [Efferent (fan-out)](#efferent-fan-out)
      - [Runtime Dependencies (aka "Normal Dependencies")](#runtime-dependencies-aka-normal-dependencies)
      - [Development Dependencies](#development-dependencies)
    - [Afferent (fan-in)](#afferent-fan-in)
      - [Runtime dependents](#runtime-dependents)
      - [Development dependents](#development-dependents)
  - [Related projects](#related-projects)
  - [License](#license)


## Introduction

**Diagnosticism** provides low-level diagnostics facilities to support library programming. The first **Diagnosticism** library was a C library with a C++ wrapper. There have been several implementations in other languages. **Diagnosticism.Ruby** is the
Ruby version.


## Installation

Install via **gem** as in:

```
gem install diagnosticism
```

or add it to your `Gemfile`.

Use is via specific APIs. For example, in order to use the ``DOOMGram``
class you would ``require`` the source file, as in:

```Ruby
require 'diagnosticism/doomgram'
```


## Components

The main component of **Diagnosticism.Ruby** today is:

* **`Diagnosticism::DOOMGram`** — a **D**ecimal **O**rder-**O**f-**M**agnitude histo**G**ram that records event durations in twelve logarithmic buckets (1ns … 100s+);

Require it as `require 'diagnosticism/doomgram'`. Significant facilities include:

* push helpers — `push_event_time_ns`, `push_event_time_us`, `push_event_time_ms`, `push_event_time_s`;
* aggregate readers — `event_count`, `total_event_time_ns`, `min_event_time_ns`, `max_event_time_ns`, plus per-bucket counts (`num_events_in_1ns` … `num_events_ge_100s`);
* presentation — `to_strip` (12-character magnitude strip) and `to_s`;


## Examples

Examples are provided in the ```examples``` directory, along with a markdown description for each. A detailed list TOC of them is provided in [EXAMPLES.md](./EXAMPLES.md).


## Project Information


### Where to get help

[GitHub Page](https://github.com/synesissoftware/Diagnosticism.Ruby "GitHub Page")


### Contribution guidelines

Defect reports, feature requests, and pull requests are welcome on https://github.com/synesissoftware/Diagnosticism.Ruby.


### Dependencies


#### Efferent (fan-out)

Libraries upon which **Diagnosticism.Ruby** depends:


##### Runtime Dependencies (aka "Normal Dependencies")

* \<none>;


##### Development Dependencies

* [**rake**](https://rubygems.org/gems/rake);
* [**test-unit**](https://rubygems.org/gems/test-unit);
* [**xqsr3**](https://github.com/synesissoftware/xqsr3);


#### Afferent (fan-in)

Projects that depend on **Diagnosticism.Ruby**:


##### Runtime dependents

* \<none>;


##### Development dependents

* \<none>;


### Related projects

* [**Diagnosticism**](https://github.com/synesissoftware/Diagnosticism/) — C library with a C++ wrapper;
* [**Diagnosticism.Go**](https://github.com/synesissoftware/Diagnosticism.Go/);
* [**Diagnosticism.NET**](https://github.com/synesissoftware/Diagnosticism.NET/);
* [**Diagnosticism.Python**](https://github.com/synesissoftware/Diagnosticism.Python/);
* [**Diagnosticism.Rust**](https://github.com/synesissoftware/Diagnosticism.Rust/);


### License

**Diagnosticism.Ruby** is released under the 3-clause BSD license. See [LICENSE](./LICENSE) for details.


<!-- ########################### end of file ########################### -->
