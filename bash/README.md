# skeleton: bash script

See example script [`example-script`](./example-script) for a skeleton of a bash script.


## Using bash options

At the beginning of each script, it's advised to set some shell options. The [`set`](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html) command allows you to change the values of options.

Most commonly used:
```bash
#!/bin/bash

set -e            # Exit script immediately on error
set -E            # trap on ERR is inherited by shell functions
set -u            # Treat unset variables as error
set -o pipefail   # Quit the pipe on error (-o for named options)

# all in a single line
set -Eeuo pipefail
```

See the list of all options: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html


## Testing

Uses [`shellcheck`](https://github.com/koalaman/shellcheck) to give warnings and suggestions for bash shell script.

To execute the tests with the wrapper script:
```bash
./test-example-script
```

Or run the raw commands:
```bash
shellcheck example-script
shellcheck --shell=bash --external-sources example-script
```

## External resources

If you're totally new to bash scripting, check out a basic introduction first: https://cs.lmu.edu/~ray/notes/bash/

* https://dev.to/thiht/shell-scripts-matter - simple introduction
* https://devhints.io/bash - cheatsheet
* https://learnxinyminutes.com/docs/bash/ - complete syntax overview in a single file
* https://wiki.bash-hackers.org/ - detailed collection


Some common mistakes and pitfalls:
* http://mywiki.wooledge.org/BashPitfalls
* http://www.pixelbeat.org/programming/shell_script_mistakes.html
