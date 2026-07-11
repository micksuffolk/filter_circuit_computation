# Filter Circuit Computation

Electrical filter transfer functions and calculations, based on standardised and widely adopted filter designs.

* [Overview](#overview)
* [Octave](#octave)
* [Filters](#filters)
    * [C-Type Passive Filter - CTPF](#c-type-passive-filter---ctpf))

&nbsp;



## Overview

The aim of this repository is to gather concise and useful filter design and response information which may be useful for educational or reference purposes. Most types of electrical filter designs are well documented, but it can often be difficult to find or derive a filter frequency response transfer function to get a feel for the filters characteristic behaviour.

&nbsp;



## Octave

[GNU Octave](https://octave.org/) is used _(as an alternative to [MATLAB](https://www.mathworks.com/products/matlab.html))_ for the computation of filter responses.

&nbsp;



## Filters

### C-Type Passive Filter - CTPF

Generally used for filtering low order harmonics i.e. up to the 5th harmonic.

> Novel Design Methodology for C-type Harmonic Filter Banks Applied in HV and EHV Networks, Randy Horton, Senior Member, IEEE, Roger Dugan, Fellow, IEEE, Daryl Hallmark, Member, IEEE. 2012. DOI: 10.1109/TDC.2012.6281629

<img src="./docs/schematics/D000001_CTPF.svg" width="450"/>

_Filter circuit_

<img src="./docs/lib/images/ctpf.svg" width="450"/>

_Bode plot (filter impedance)_

- Source code: [ctpf.m](./src/CTPF/ctpf.m)

&nbsp;


