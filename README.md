# netdata-utils

## Usage
```
usage: netdata-utils [-h] {dump,show} ...

A set of netdata utilities

positional arguments:
  {dump,show}  Sub-command help

optional arguments:
  -h, --help   show this help message and exit
usage: netdata-utils dump [-h] [-o OUTPUT_DIR] [-a AFTER] [-b BEFORE]
                          [-c CHART] [-f {json,csv}]
                          urls [urls ...]
```

### Dumping data
```
Dump all data from a netdata host

positional arguments:
  urls                  netdata API URL e.g., http://localhost:19999

optional arguments:
  -h, --help            show this help message and exit
  -o OUTPUT_DIR, --output-dir OUTPUT_DIR
                        output directory
  -a AFTER, --after AFTER
                        Absolute timestamp or a relative number in seconds
                        specifying the starting point of the dataset
  -b BEFORE, --before BEFORE
                        Absolute timestamp or a relative number in seconds
                        specifying the ending point of the dataset
  -c CHART, --chart CHART
                        Chart ID regular expression
  -f {json,csv}, --output-format {json,csv}
                        Data output format
usage: netdata-utils show charts [-h] urls [urls ...]
```

### Resource utilization reports
```
Generate a pre-defined report on a Netdata host

positional arguments:
  urls                  netdata API URL e.g., http://localhost:19999

optional arguments:
  -h, --help            show this help message and exit
  -a AFTER, --after AFTER
                        Absolute timestamp or a relative number in seconds
                        specifying the starting point of the report
  -b BEFORE, --before BEFORE
                        Absolute timestamp or a relative number in seconds
                        specifying the ending point of the report
  -p {USE}, --profile {USE}
                        Report profile
```

### Chart metadata
```
Show chart metadata

positional arguments:
  urls        netdata API URL e.g., http://localhost:19999

optional arguments:
  -h, --help  show this help message and exit
```
