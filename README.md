# nvidia

#### Table of Contents

1. [Description](#description)
1. [Usage](#usage)
1. [Notes](#notes)
1. [Limitations](#limitations)
1. [Development](#development)

## Description

This module will install the official Nvidia proprietary driver for a node
when hardware is detected.

## Usage

To get started without any fuss, use an include statement:

    include nvidia

You can specify the major version number you wish you install, to deal with older hardware.
This is subject to package for your distribution, so it might not work.

Using Heira:

    nvidia::version: 346

Or a declaring a resource in your manifest:

    class { 'nvidia':
	version => 346
    }

## Notes

Detection works by inspecting the output of `lspci` and looking for anything
with the correct vendor id that looks like a graphics card.

This is exposed as the `nvidiagfx` fact from nodes running Linux.

On Ubuntu, this module will pin the ppa it uses with a higher priority, this
is primarily because of some weirdness in the Canoncial metapackages for
hardware the author runs (eg: `nvidia-346` is a metapackage for `nvidia-352`,
however the latter does not support Ion2 hardware).


## Limitations

Right now, this module targets Ubuntu - but I am keen to clean things up and
extend to other linux distributions and Windows.

## Development

Please feel free to head to the Github page and submit a pull request.
